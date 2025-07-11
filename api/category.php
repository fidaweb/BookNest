<?php
require '../config/db.php';




$page=$_GET["page"];

if($page==="home"){
    $sql = "SELECT * FROM books_table LIMIT 20 ";  // corrected SQL
}
else{
    $sql="SELECT * FROM books_table  WHERE Category IN ('$page') LIMIT 20";
}





$result = mysqli_query($conn, $sql);


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

?>

