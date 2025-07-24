<?php
include "../config/connection.php";

$xml=file_get_contents("php://input");

$xmlr=simplexml_load_string($xml);
$email=$xmlr->email;
$password=crypt($xmlr->password,"123!>67");



$sql="SELECT * FROM users WHERE email =? AND password =?";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_bind_param($stmt,'ss',$email,$password);
mysqli_stmt_execute($stmt);
$result=mysqli_stmt_get_result($stmt);

if($result->num_rows>0){
   
$id=mysqli_fetch_assoc($result)['user_id'];

$sql="SELECT * FROM admin";
$admin=mysqli_query($conn,$sql);
$isAdmin=false;
if($admin->num_rows>0){
    $admin=mysqli_fetch_assoc($admin);
    $adminsession=$admin['session'];
    if($email==$admin['email']&&$password==$admin['password']){
        $isAdmin=true;
    }
}
$sessionid="";
$temp=0;
if($result->num_rows>0){
    session_start();
    do{
        $sessionid=bin2hex(random_bytes(16));
    }while($sessionid==$adminsession);
    if($isAdmin){

        $sessionid=$adminsession;
        $temp=1;
        $_SESSION['admin_id']=$sessionid;
    }
   
   
    $sql="INSERT INTO `sessions`(`sessionid`, `user_id`, `created_at`, `expires_at`) VALUES (?,?,CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP()+INTERVAL 3 Day)";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,"si",$sessionid,$id);
    mysqli_stmt_execute($stmt);
   
    $_SESSION['session_id']=$sessionid;
    $_SESSION['user_id']=$id;

    
    echo "{\"sessionid\":\"".$sessionid."\",\"userid\":".$id.",\"admin\":".$temp."}";

}
}
else{
    echo "{\"error\":\"Incorrect Email or Password\"}";
}

?>