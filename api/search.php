<?php
include("../config/connection.php");
require 'session.php';
$term="%".$_GET["term"]."%";
$category=$_GET["category"];



    if($category=="home"){
        $sql="SELECT * FROM books WHERE `Book_Title` LIKE ? LIMIT 20";
        $stmt=mysqli_prepare($conn,$sql);
        mysqli_stmt_bind_param($stmt,'s',$term);
    }
    else{
        $sql="SELECT * FROM books WHERE `Book_Title` LIKE ? AND `Category`=? LIMIT 20";
        $stmt=mysqli_prepare($conn,$sql);
        mysqli_stmt_bind_param($stmt,'ss',$term,$category);
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