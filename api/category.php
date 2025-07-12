<?php
require '../config/connection.php';




$page=$_GET["page"];

$offset=$_GET["offset"];

if($page==="home"){
    $sql = "SELECT * FROM books LIMIT 20 OFFSET $offset";  // corrected SQL
}
else{
    $sql="SELECT * FROM books  WHERE Category ='$page' LIMIT 20 OFFSET $offset";
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

