<?php
include "../config/connection.php";
include("session.php");

$xml=file_get_contents("php://input");

if(checkSession($conn)){
    $xmlr=simplexml_load_string($xml);
$payment_id=bin2hex(random_bytes(16));
$user_id=$_SESSION["user_id"];
$flag=true;
for($i=0;$i<count($xmlr->bookid);$i++){
    $book=(int)$xmlr->bookid[$i];
    $sql="INSERT INTO payments (payment_id,user_id, book_id,price, bought_at) SELECT ?,?,b.id,b.PRICE,CURRENT_TIMESTAMP() FROM books b WHERE b.id=?";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,'sii',$payment_id,$user_id,$book);
   
    if(!mysqli_stmt_execute($stmt)){
        $flag=false;
        break;
     } 
}

    if($flag){
        echo "{\"msg\":\"success\"}";
    }
    else{
        echo "{\"msg\":\"error\"}";
    }
}
else{
    echo "{\"msg\":\"session invalid\"}";
}
?>
