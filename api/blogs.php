<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
// require '../config/db.php';
require 'session.php';




    
$sql="SELECT b.*,u.name FROM blogs b,users u WHERE b.author_id=u.user_id";
$result=mysqli_query($conn,$sql);
$blogs = [];

while ($row = mysqli_fetch_assoc($result)) {
    $blogs[] = $row;
}

echo json_encode($blogs);
    










?>