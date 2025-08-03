<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require 'session.php';
include "../config/connection.php"; 

if (!checkSession($conn)) {
    http_response_code(401);
    echo "Unauthorized access. Please log in.";
    exit();
}

// user id session er
$user_id = isset($_SESSION["user_id"]) ? (int)$_SESSION["user_id"] : 0;

// book id ney from book card click kore j get request otate
$book_id = isset($_GET['book_id']) ? (int)$_GET['book_id'] : 0;

if ($user_id === 0 || $book_id === 0) {
    http_response_code(400);
    echo "Invalid request: Missing user ID or book ID.";
    exit();
}

//payment table check koree
$has_access = false;
try {
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
} catch (Exception $e) {
    error_log("Database error in download.php: " . $e->getMessage());
    http_response_code(500);
    echo "An internal server error occurred.";
    exit();
}

if (!$has_access) {
    http_response_code(403); //churi kore book access
    echo "Access denied: You do not have permission to download this book.";
    exit();
}

//amra only book.pdf download kori 
$fileName = 'book.pdf';
$filePath = __DIR__ . '/../pdfs/' . $fileName;

if (file_exists($filePath)) {
    //  headers for download
    header('Content-Description: File Transfer');
    header('Content-Type: application/pdf'); //  content type PDF
    header('Content-Disposition: attachment; filename="' . $fileName . '"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($filePath));
    ob_clean();
    flush();
    readfile($filePath);
    exit();
} else {
    http_response_code(404);
    echo "File not found at: " . htmlspecialchars($filePath, ENT_QUOTES, 'UTF-8');
}

if ($conn) {
    $conn->close();
}
?>
