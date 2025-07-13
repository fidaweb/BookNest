<?php

require '../config/connection.php';

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);
$name=$xmlr->name;
$email=$xmlr->email;
$password=crypt($xmlr->password,"123!>67");
$phone=$xmlr->phone;


// $sql="INSERT INTO `users`(`name`, `email`, `password`, `Phone`) VALUES ('$name','$email','$password','$phone')";
$sql="INSERT INTO `users`(`name`, `email`, `password`, `Phone`) VALUES (?,?,?,?)";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_bind_param($stmt,"ssss",$name,$email,$password,$phone);
if(mysqli_stmt_execute($stmt)){
    echo "{\"msg\":\"success\"}";
}
// else{
//     echo "{\"msg\":\"error\"}";
// }


// $result=mysqli_query($conn,$sql);


?>