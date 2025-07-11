<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
// require '../config/db.php';
require 'session.php';


if(checkSession()){

    $test=substr($_GET["books"],1,-1);
    $sql="SELECT * FROM books_table WHERE id IN ($test)";
    
    $result=mysqli_query($conn,$sql);
    
    $books = [];
    
    while ($row = mysqli_fetch_assoc($result)) {
        $books[] = $row;
    }
    
    echo json_encode($books);
    
}









?>