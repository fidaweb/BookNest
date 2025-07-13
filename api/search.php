<?php
require 'session.php';
$term=$_GET["term"];
$category=$_GET["category"];

if(checkSession()){

    if($category=="home"){
        $sql="SELECT * FROM books WHERE `Book_Title` LIKE '%$term%' LIMIT 20";
    }
    else{
        $sql="SELECT * FROM books WHERE `Book_Title` LIKE '%$term%' AND `Category`='$category' LIMIT 20";
    }
    
    $result=mysqli_query($conn,$sql);
    $books = [];
    
    while ($row = mysqli_fetch_assoc($result)) {
        $books[] = $row;
    }
    
    echo json_encode($books);
    
}


?>