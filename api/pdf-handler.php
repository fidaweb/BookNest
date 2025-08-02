<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require '../config/connection.php';
require 'session.php';

header('Content-Type: application/json'); // Default to JSON for error responses

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
            http_response_code(401); // Unauthorized
            echo json_encode([
                'success' => false,
                'message' => 'User not logged in'
            ]);
        }
    } catch (Exception $e) {
        http_response_code(500); // Internal Server Error
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
        // Check if user is logged in
        if (!checkSession($conn)) {
            http_response_code(401); // Unauthorized
            echo json_encode(['success' => false, 'message' => 'Access denied: User not logged in.']);
            exit();
        }
        
        $user_id = (int)$_SESSION['user_id'];
        $book_id = isset($_GET['book_id']) ? (int)$_GET['book_id'] : 0;
        
        if ($book_id === 0) {
            http_response_code(400); // Bad Request
            echo json_encode(['success' => false, 'message' => 'Invalid request: Missing book ID.']);
            exit();
        }
        
        // Check if user has access to this book via the payments table
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
            http_response_code(403); // Forbidden
            echo json_encode(['success' => false, 'message' => 'Access denied: You do not have permission to view this book.']);
            exit();
        }
        
        // If access is granted, serve the single 'book.pdf' file
        $pdf_filename = 'book.pdf';
        $full_pdf_file_path = __DIR__ . '/../pdfs/' . $pdf_filename;

        if (!file_exists($full_pdf_file_path)) {
            http_response_code(404); // Not Found
            echo json_encode(['success' => false, 'message' => 'PDF file not found on server.']);
            exit();
        }
        
        // If all checks pass, serve the PDF
        header_remove('Content-Type'); // Remove default JSON header
        header('Content-Type: application/pdf');
        header('Content-Length: ' . filesize($full_pdf_file_path));
        header('Content-Disposition: inline; filename="' . htmlspecialchars($pdf_filename, ENT_QUOTES, 'UTF-8') . '"'); // Use generic filename
        header('Cache-Control: private, max-age=3600');
        ob_clean();
        flush();
        readfile($full_pdf_file_path);
        
    } catch (Exception $e) {
        http_response_code(500); // Internal Server Error
        echo json_encode(['success' => false, 'message' => 'Server error during PDF retrieval: ' . $e->getMessage()]);
    } finally {
        if ($conn) {
            $conn->close();
        }
    }
}
?>
