<?php
require '../config/db.php';

$sql = "SELECT * FROM books_table LIMIT 20 ";  // corrected SQL


$result = mysqli_query($conn, $sql);

// if (!$result) {
//     die("Query failed: " . mysqli_error($conn));
// }
if (!$result) {
    http_response_code(500);
    echo json_encode(["error" => mysqli_error($conn)]);
    exit;
}

$books = [];

while ($row = mysqli_fetch_assoc($result)) {
    $books[] = $row;
}

echo json_encode($books);

// mysqli_close($conn);
?>

