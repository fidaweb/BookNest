<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Configure Memcached for session storage BEFORE session_start()
ini_set('session.save_handler', 'memcached');
ini_set('session.save_path', 'localhost:11211'); // Assuming Memcached runs on localhost:11211

require 'session.php'; // Assuming session.php calls session_start()

header('Content-Type: application/json');

// Basic XSS Prevention Headers
header("Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline' https://ajax.googleapis.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:;");

// Input sanitization function for XSS prevention
function sanitizeOutput($data) {
    if (is_array($data)) {
        return array_map('sanitizeOutput', $data);
    }
    return htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
}

// Memcached server details
$memcached_host = "localhost";
$memcached_port = 11211;

// Create Memcached connection
$memcache = new Memcached();
$memcache->addServer($memcached_host, $memcached_port);

// Check for Memcached connection errors (optional)
if ($memcache->getStats() === false) {
    error_log("Memcached connection failed in mybooks.php. Falling back to database.");
    $memcache = null; // Set to null to indicate Memcached is not available
}

if (!function_exists('checkSession') || !checkSession($conn)) {
    echo json_encode(['error' => 'Unauthorized: Session invalid or user not logged in.']);
    exit();
}

if (!isset($_SESSION["user_id"])) {
    echo json_encode(['error' => 'User ID not found in session.']);
    exit();
}

// SQL Injection Prevention: Cast to integer
$user_id = (int)$_SESSION["user_id"];
$books = [];

try {
    $cache_key = 'user_books_' . $user_id;
    $cached_books = false;

    // Try to get data from Memcached
    if ($memcache) {
        $cached_books = $memcache->get($cache_key);
    }

    if ($cached_books !== false) {
        // Data found in Memcached
        echo $cached_books; // Output cached JSON string
    } else {
        // Data not found in Memcached, fetch from database
        
        // SQL Injection Prevention: Use prepared statements
        $stmt_payments = $conn->prepare("SELECT book_id FROM payments WHERE user_id = ?");
        if (!$stmt_payments) {
            throw new Exception("Failed to prepare payments statement: " . $conn->error);
        }
        $stmt_payments->bind_param("i", $user_id);
        $stmt_payments->execute();
        $result_payments = $stmt_payments->get_result();
        $book_ids = [];
        while ($row = $result_payments->fetch_assoc()) {
            $book_ids[] = (int)$row['book_id']; // Cast to integer for SQL injection prevention
        }
        $stmt_payments->close();

        if (empty($book_ids)) {
            $response = ['message' => 'No books found for this user.'];
            $json_response = json_encode($response);
            if ($memcache) {
                $memcache->set($cache_key, $json_response, 300); // Cache for 5 minutes
            }
            echo $json_response;
            exit();
        }

        // SQL Injection Prevention: Use prepared statements with placeholders
        $placeholders = implode(',', array_fill(0, count($book_ids), '?'));
        $types = str_repeat('i', count($book_ids));

        $stmt_books = $conn->prepare("SELECT id, Book_Title, Book_Author, description, PRICE, Image_URL_L FROM books WHERE id IN ($placeholders)");
        if (!$stmt_books) {
            throw new Exception("Failed to prepare books statement: " . $conn->error);
        }
        $stmt_books->bind_param($types, ...$book_ids);
        $stmt_books->execute();
        $result_books = $stmt_books->get_result();
        
        while ($row = $result_books->fetch_assoc()) {
            // XSS Prevention: Sanitize output data
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
        if ($memcache) {
            $memcache->set($cache_key, $json_response, 300); // Cache for 5 minutes
        }
        echo $json_response;
    }
} catch (Exception $e) {
    error_log("Error in mybooks.php: " . $e->getMessage());
    echo json_encode(['error' => 'An internal server error occurred.']);
} finally {
    if ($conn) {
        $conn->close();
    }
}
?>
