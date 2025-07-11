<?php
include "../config/db.php";

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);
$email=$xmlr->email;
$password=crypt($xmlr->password,"123!>67");

$sql="SELECT * FROM users WHERE email IN ('$email') AND password IN ('$password')";
$result=mysqli_query($conn,$sql);
$user=[];
while($row=mysqli_fetch_assoc($result)){
    $user[]=$row;
}
if(count($user)==1){
    $sessionid=bin2hex(random_bytes(16));
    $id=$user[0]["user_id"];
    $sql="INSERT INTO `sessions`(`sessionid`, `user_id`, `created_at`, `expires_at`) VALUES ('$sessionid',$id,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP()+INTERVAL 3 Day)";
  
    $result=mysqli_query($conn,$sql);
    echo "{\"sessionid\":\"".$sessionid."\",\"userid\":".$id."}";

}
?>