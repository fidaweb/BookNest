<?php
// require '../config/connection.php';
require 'session.php';

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);

if(checkSession($conn)){

$title=$xmlr->title;
$url=$xmlr->url;
$content=$xmlr->content;
$author_id=$_SESSION["user_id"];

$sql="INSERT INTO `blogs`( `author_id`, `image_url`, `content`, `created_on`, `title`) VALUES ('$author_id','$url','$content',CURRENT_TIMESTAMP(),'$title')";
mysqli_query($conn,$sql);
echo "{\"msg\":\"success\"}";

}

?>