<?php

require '../config/db.php';

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);
$name=$xmlr->name;
$email=$xmlr->email;
$password=crypt($xmlr->password,"123!>67");
$phone=$xmlr->phone;

$sql="INSERT INTO `users`(`name`, `email`, `password`, `Phone`) VALUES ('$name','$email','$password','$phone')";

$result=mysqli_query($conn,$sql);

?>