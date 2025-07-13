<?php
include('../../config/connection.php');

$file = "temp.txt";
if (file_exists($file)) {
    header("Content-Type: text/plain");
    header("Content-Disposition: attachment; filename=\"book.txt\"");
    readfile($file);
    exit;
}







?>