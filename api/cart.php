<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
// require '../config/db.php';
require 'session.php';


if(checkSession($conn)){

    $test=substr($_GET["books"],1,-1);
    $arr=explode(',',$test);
    $placeholders=implode(',',array_fill(0,count($arr),'?'));
    $sql="SELECT * FROM books WHERE id IN ($placeholders)";
    $stmt=mysqli_prepare($conn,$sql);
    $Is=str_repeat('i',count($arr));
    mysqli_stmt_bind_param($stmt,$Is,...$arr);
    mysqli_stmt_execute($stmt);
   
    $result=mysqli_stmt_get_result($stmt);
    $books = [];
    
    while ($row = mysqli_fetch_assoc($result)) {
        $books[] = $row;
    }
    
    echo json_encode($books);
    
}









?>