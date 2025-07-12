<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
// require '../config/db.php';
require 'session.php';


if(checkSession()){

    $test=substr($_GET["books"],1,-1);
    $sql="SELECT * FROM books WHERE id IN ($test)";
    // $stmt=$conn->prepare("SELECT * FROM books WHERE id IN (?)");
    // $stmt->bind_param("s",$test);
    
    $result=mysqli_query($conn,$sql);
    // if($stmt->execute()){
    //     $result=$stmt->get_result();
    // }
    
    $books = [];
    
    while ($row = mysqli_fetch_assoc($result)) {
        $books[] = $row;
    }
    
    echo json_encode($books);
    
}









?>