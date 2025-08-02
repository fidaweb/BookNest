<?php
require '../config/connection.php';
require 'session.php';

// Get the action parameter
$action = isset($_GET['action']) ? $_GET['action'] : (isset($_POST['action']) ? $_POST['action'] : '');

switch($action) {
    case 'get_session':
        handleGetSession($conn);
        break;
    case 'get_pdf':
        handleGetPDF($conn);
        break;
    default:
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
            echo json_encode([
                'success' => false,
                'message' => 'User not logged in'
            ]);
        }
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Server error'
        ]);
    }
}

function handleGetPDF($conn) {
    try {
        // Check if user is logged in
        if (!checkSession($conn)) {
            http_response_code(403);
            exit('Access denied');
        }
        
        $user_id = (int)$_SESSION['user_id'];
        $book_id = isset($_GET['book_id']) ? (int)$_GET['book_id'] : 0;
        
        if (!$book_id) {
            http_response_code(400);
            exit('Invalid book ID');
        }
        
        // Check if user has access to this book (purchased)
        $stmt = $conn->prepare("
            SELECT b.pdf_path, b.title 
            FROM books b 
            INNER JOIN user_books ub ON b.id = ub.book_id 
            WHERE b.id = ? AND ub.user_id = ?
        ");
        $stmt->bind_param("ii", $book_id, $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $book = $result->fetch_assoc();
        
        if (!$book) {
            http_response_code(404);
            exit('Book not found or access denied');
        }
        
        $pdf_path = htmlspecialchars($book['pdf_path'], ENT_QUOTES, 'UTF-8');
        
        // Check if file exists
        if (!file_exists($pdf_path)) {
            http_response_code(404);
            exit('PDF file not found');
        }
        
        // Set headers for PDF
        header('Content-Type: application/pdf');
        header('Content-Length: ' . filesize($pdf_path));
        header('Content-Disposition: inline; filename="' . htmlspecialchars($book['title'], ENT_QUOTES, 'UTF-8') . '.pdf"');
        header('Cache-Control: private, max-age=3600');
        
        // Output PDF
        readfile($pdf_path);
        
    } catch (Exception $e) {
        http_response_code(500);
        exit('Server error');
    }
}
?>