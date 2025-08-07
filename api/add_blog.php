<?php
require '../config/connection.php';
require 'session.php';

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);

if(checkSession($conn)){

$title=$xmlr->title;
$url=$xmlr->url;
$content=$xmlr->content;
$author_id=$_SESSION["user_id"];

try{
$sql="INSERT INTO `blogs`( `author_id`, `image_url`, `content`, `created_on`, `title`) VALUES (?,?,?,CURRENT_TIMESTAMP(),?)";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_bind_param($stmt,'isss',$author_id,$url,$content,$title);
$stmt->execute();
echo "{\"msg\":\"success\"}";
}
catch(Exception $e){
echo "{\"msg\":\"fail\"}";
}



}

?>