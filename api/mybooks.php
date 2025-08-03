<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


include "../config/connection.php";

//memcached ache or na 
if (extension_loaded('memcached')) {
    ini_set('session.save_handler', 'memcached');
    ini_set('session.save_path', 'localhost:11211');
}

require 'session.php'; 

header('Content-Type: application/json');

//  XSS cdn
header("Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline' https://ajax.googleapis.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:;");

// sanitize for xss
function sanitizeOutput($data) {
    if (is_array($data)) {
        return array_map('sanitizeOutput', $data);
    }
    return htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
}

// notun memcached object banay store kore data
$memcache = null;
if (extension_loaded('memcached')) {
    try {
        $memcache = new Memcached();
        $memcache->addServer('localhost', 11211);//eta port number
        
        
        $stats = $memcache->getStats();
        if (empty($stats) || $stats === false) {
            error_log("Memcached connection failed in mybooks.php. Falling back to database only.");
            $memcache = null;
        }
    } catch (Exception $e) {
        error_log("Memcached error in mybooks.php: " . $e->getMessage());
        $memcache = null;
    }
} else {
    error_log("Memcached extension not found. Using database only.");
}

if (!function_exists('checkSession') || !checkSession($conn)) {
    echo json_encode(['error' => 'Unauthorized: Session invalid or user not logged in.']);
    exit();
}

if (!isset($_SESSION["user_id"])) {
    echo json_encode(['error' => 'User ID not found in session.']);
    exit();
}


$user_id = (int)$_SESSION["user_id"];
$books = [];

try {
    $cache_key = 'user_books_' . $user_id;
    $cached_books = false;

    // memcached a data jodi thake okhane theke nibo 
    if ($memcache) {
        try {
            $cached_books = $memcache->get($cache_key);
            if ($cached_books !== false) {
                error_log("Serving books from Memcached for user: " . $user_id);
            }
        } catch (Exception $e) {
            error_log("Memcached get error: " . $e->getMessage());
            $cached_books = false;
        }
    }

    if ($cached_books !== false) {
        // data found in Memcached
        echo $cached_books; 
    } else {
        //  fetch from database
        error_log("Fetching books from database for user: " . $user_id);
        
        // sql injection
        $stmt_payments = $conn->prepare("SELECT DISTINCT book_id FROM payments WHERE user_id = ?");
        if (!$stmt_payments) {
            throw new Exception("Failed to prepare payments statement: " . $conn->error);
        }
        $stmt_payments->bind_param("i", $user_id);
        $stmt_payments->execute();
        $result_payments = $stmt_payments->get_result();
        $book_ids = [];
        while ($row = $result_payments->fetch_assoc()) {
            $book_ids[] = (int)$row['book_id'];
        }
        $stmt_payments->close();

        if (empty($book_ids)) {
            $response = ['message' => 'No books found for this user.'];
            $json_response = json_encode($response);
            
            // cache"no books" 
            if ($memcache) {
                try {
                    $memcache->set($cache_key, $json_response, 300); // 5 min cache hoye thake memcached a
                } catch (Exception $e) {
                    error_log("Memcached set error: " . $e->getMessage());
                }
            }
            echo $json_response;
            exit();
        }

        
        $placeholders = implode(',', array_fill(0, count($book_ids), '?'));
        $types = str_repeat('i', count($book_ids));
        //book ante sql
        $stmt_books = $conn->prepare("SELECT id, Book_Title, Book_Author, description, PRICE, Image_URL_L FROM books WHERE id IN ($placeholders)");
        if (!$stmt_books) {
            throw new Exception("Failed to prepare books statement: " . $conn->error);
        }
        $stmt_books->bind_param($types, ...$book_ids);
        $stmt_books->execute();
        $result_books = $stmt_books->get_result();
        
        while ($row = $result_books->fetch_assoc()) {
            //  sanitize output data
            $sanitized_row = [
                'id' => (int)$row['id'],
                'Book_Title' => htmlspecialchars($row['Book_Title'], ENT_QUOTES, 'UTF-8'),
                'Book_Author' => htmlspecialchars($row['Book_Author'], ENT_QUOTES, 'UTF-8'),
                'description' => htmlspecialchars($row['description'], ENT_QUOTES, 'UTF-8'),
                'PRICE' => $row['PRICE'],
                'Image_URL_L' => htmlspecialchars($row['Image_URL_L'], ENT_QUOTES, 'UTF-8')
            ];
            $books[] = $sanitized_row;
        }
        $stmt_books->close();

        $json_response = json_encode($books);
        
        // cache results 
        if ($memcache && !empty($books)) {
            try {
                $memcache->set($cache_key, $json_response, 300); // Cache for 5 minutes
                error_log("Cached books in Memcached for user: " . $user_id);
            } catch (Exception $e) {
                error_log("Memcached set error: " . $e->getMessage());
            }
        }
        
        echo $json_response;
    }
} catch (Exception $e) {
    error_log("Error in mybooks.php: " . $e->getMessage());
    echo json_encode(['error' => 'An internal server error occurred: ' . $e->getMessage()]);
} finally {
    if ($conn) {
        $conn->close();
    }
}
?>
