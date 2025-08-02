<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("../config/connection.php");
require 'session.php';


if (!checkSession($conn)) { 
    http_response_code(401);
    echo "Unauthorized access.";
    exit();
}

if (isset($_GET['book_name'])) {
    $bookName = $_GET['book_name'];

    //shudhui filenames not extension
    $fileName = basename($bookName) . '.txt';
    $fileName='Book.txt';
    
    echo __DIR__;
    // $filePath = __DIR__ . '/files/' . $fileName;
    $filePath='/opt/lampp/book.txt';
    echo $filePath;

    if (file_exists($filePath)) {
        //  headers for download
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream'); 
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
        echo "File not found.";
    }
} else {
    http_response_code(400);
    echo "Book name not provided.";
}
?>
