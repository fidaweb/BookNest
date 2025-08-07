<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require '../config/connection.php';
require 'session.php';

header('Content-Type: application/json'); // default json errors


$action = isset($_GET['action']) ? $_GET['action'] : (isset($_POST['action']) ? $_POST['action'] : '');

switch($action) {
    case 'get_session':
        handleGetSession($conn);
        break;
    case 'get_pdf':
        handleGetPDF($conn);
        break;
    default:
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Invalid action']);
        break;
}

function handleGetSession($conn) {
    try {
        if (checkSession($conn)) {
            echo json_encode([
                'success' => true,
                'user_id' => (int)$_SESSION['user_id']
            ]);
        } else {
            http_response_code(401); // session id na available
            echo json_encode([
                'success' => false,
                'message' => 'User not logged in'
            ]);
        }
    } catch (Exception $e) {
        http_response_code(500); // internal server noshtoo
        echo json_encode([
            'success' => false,
            'message' => 'Server error during session check: ' . $e->getMessage()
        ]);
    } finally {
        if ($conn) {
            $conn->close();
        }
    }
}

function handleGetPDF($conn) {
    try {
        
        if (!checkSession($conn)) {
            http_response_code(401); 
            echo json_encode(['success' => false, 'message' => 'Access denied: User not logged in.']);
            exit();
        }
        
        $user_id = (int)$_SESSION['user_id'];
        $book_id = isset($_GET['book_id']) ? (int)$_GET['book_id'] : 0;
        
        if ($book_id === 0) {
            http_response_code(400); 
            echo json_encode(['success' => false, 'message' => 'Invalid request: Missing book ID.']);
            exit();
        }
        
        //oi book ta oi user kineche kina payments table a check dey
        $has_access = false;
        $stmt = $conn->prepare("SELECT COUNT(*) FROM payments WHERE user_id = ? AND book_id = ?");
        if (!$stmt) {
            throw new Exception("Failed to prepare statement: " . $conn->error);
        }
        $stmt->bind_param("ii", $user_id, $book_id);
        $stmt->execute();
        $stmt->bind_result($count);
        $stmt->fetch();
        $stmt->close();
        
        if ($count > 0) {
            $has_access = true;
        }
        
        if (!$has_access) {
            http_response_code(403); // churi kore onno book access
            echo json_encode(['success' => false, 'message' => 'Access denied: You do not have permission to view this book.']);
            exit();
        }
        $sql='SELECT `book_title` FROM books WHERE id=?';
        $stmt=mysqli_prepare($conn,$sql);
        mysqli_stmt_bind_param($stmt,"i",$book_id);
        $stmt->execute();
        $book_row=$stmt->get_result();
        
        $title=mysqli_fetch_assoc($book_row)['book_title'];
        //Dynamic book implementation
        $pdf_filename=$title.'.pdf';
        
        //for now amra just book.pdf tai serve korbo as amader ar book available na. we can make it dynamic to take different book for different book card
        $pdf_filename = 'book.pdf';
        $full_pdf_file_path = __DIR__ . '/../pdfs/' . $pdf_filename;
       
        if (!file_exists($full_pdf_file_path)) {
            http_response_code(404); // book.pdf payna
            echo json_encode(['success' => false, 'message' => 'PDF file not found on server.']);
            exit();
        }
        else{
             echo json_encode(['success' => true, 'message' => 'PDF file found on server.']);
        }
        
        // If all checks pass
        header_remove('Content-Type'); // Remove default JSON header jeta 1st a diyechi for debug if error
        header('Content-Type: application/pdf');
        header('Content-Length: ' . filesize($full_pdf_file_path));
        header('Content-Disposition: inline; filename="' . htmlspecialchars($pdf_filename, ENT_QUOTES, 'UTF-8') . '"'); // Use generic filename
        header('Cache-Control: private, max-age=3600');
        ob_clean();
        flush();
        readfile($full_pdf_file_path);
        
    } catch (Exception $e) {
        http_response_code(500); //internal server noshto
        echo json_encode(['success' => false, 'message' => 'Server error during PDF retrieval: ' . $e->getMessage()]);
    } finally {
        if ($conn) {
            $conn->close();
        }
    }
}
?>
