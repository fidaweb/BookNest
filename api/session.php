<?php
require '../config/connection.php';


function checkSession(){
    global $conn;
    if(!isset($_COOKIE["session_id"])||!isset($_COOKIE["user_id"])){
        return False;
    }
    $session_id=$_COOKIE["session_id"];
    $user_id=(int)$_COOKIE["user_id"];

    $stmt=$conn->prepare("SELECT 1 FROM sessions WHERE sessionid=? AND user_id=?");
    $stmt->bind_param("si",$session_id,$user_id);
    $stmt->execute();
    $result=$stmt->get_result();
   
    return ($result->num_rows>0);
   
}










