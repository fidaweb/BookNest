<?php
require '../config/db.php';


function checkSession(){
    global $conn;
    $session_id=$_COOKIE["session_id"];
    $user_id=$_COOKIE["user_id"];
    $sql="SELECT * FROM `sessions` WHERE sessionid IN ('$session_id') AND user_id IN ('$user_id')";
    $result=mysqli_query($conn,$sql);
    $temp=[];
    while($row=mysqli_fetch_assoc($result)){
        
        return true;
    }
    return false;
    
   
}




?>