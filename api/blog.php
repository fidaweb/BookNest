<?php


require '../config/connection.php';
require 'session.php';




$ID=$_GET['id'];
$sql="SELECT * FROM blogs WHERE `blog_id`=$ID";
$result=mysqli_query($conn,$sql);
$blogs = [];

while ($row = mysqli_fetch_assoc($result)) {
    $blogs[] = $row;
}

echo json_encode($blogs);
    










?>