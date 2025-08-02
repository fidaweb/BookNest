<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require 'session.php';
require '../config/connection.php';

// Include database connection if needed for user/book validation,
// but for now, we're just serving a generic PDF.
// include "../config/connection.php"; 

if (!checkSession($conn)) { 
    http_response_code(401);
    echo "Unauthorized access.";
    exit();
}

// The user wants to download 'books.pdf' regardless of the book card clicked.
// The book_id parameter can still be passed from mybooks.html, but download.php
// will ignore it for now and always serve 'books.pdf'.
// If you later want to download different PDFs per book, you'd use $bookId
// to determine the correct file path.

// Define the fixed PDF filename and its relative path from download.php
$fileName = 'book.pdf';
// Assuming download.php is in 'api/' and books.pdf is in 'pdfs/'
$filePath = __DIR__ . '/../pdfs/' . $fileName; 

if (file_exists($filePath)) {
    // Set headers for download
    header('Content-Description: File Transfer');
    header('Content-Type: application/pdf'); // Set content type to PDF
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
?>
