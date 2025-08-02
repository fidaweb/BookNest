<?php
require '../config/connection.php';
require 'session.php';



$page=$_GET["page"];
$offset=$_GET["offset"];

if($page==="home"){
   $sql= "SELECT * FROM books LIMIT 20 OFFSET ?";  // corrected SQL
   $stmt=mysqli_prepare($conn,$sql);
   mysqli_stmt_bind_param($stmt,'i',$offset);
   
}
else{
    $sql="SELECT * FROM books  WHERE Category =? LIMIT 20 OFFSET ?";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,'si',$page,$offset);
    
}

mysqli_stmt_execute($stmt);
$result=mysqli_stmt_get_result($stmt);



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

