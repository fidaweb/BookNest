<?php
require '../config/db.php';
error_reporting(E_ALL);
ini_set('display_errors', 1);
$input = file_get_contents('php://input');

$data = json_decode($input, true);

$isbns = $data['isbns']; // ✅ Force to string
// Force all ISBNs to string (IMPORTANT!)
// $isbns = array_map('strval', $data['isbns']);
 
// var_dump($isbns);


// Prepare dynamic placeholders (?, ?, ?, ...)
$placeholders = implode(',', array_fill(0, count($isbns), '?'));

// Prepare SQL
$sql = "SELECT * FROM books_table WHERE ISBN IN ($placeholders)";

$stmt = $conn->prepare($sql);







$types = str_repeat('i', count($isbns)); // ✅ Bind as strings
mysqli_stmt_bind_param($stmt, $types, ...$isbns);

mysqli_stmt_execute($stmt);

$debug_sql = $sql; // $sql still has the placeholders

foreach ($isbns as $isbn) {
    $escaped = "'" . $conn->real_escape_string($isbn) . "'";
    $debug_sql = preg_replace('/\?/', $escaped, $debug_sql, 1);
}

// echo "Executed SQL: $debug_sql\n";

$result = mysqli_stmt_get_result($stmt);

$books = [];

while ($row = mysqli_fetch_assoc($result)) {
    $books[] = $row;
}



echo json_encode($books);


// mysqli_close($conn);
?>