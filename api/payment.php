<?php
include "../config/connection.php";
include("session.php");


$xml=file_get_contents("php://input");

if(checkSession()){
    $xmlr=simplexml_load_string($xml);
// echo count($xmlr->bookid);
$payment_id=bin2hex(random_bytes(16));
$user_id=$_COOKIE["user_id"];
$flag=true;
for($i=0;$i<count($xmlr->bookid);$i++){
    $book=(int)$xmlr->bookid[$i];
    $sql="INSERT INTO payments (payment_id,user_id, book_id,price, bought_at) SELECT '$payment_id',$user_id,b.id,b.PRICE,CURRENT_TIMESTAMP() FROM books b WHERE b.id=$book";
    if(!mysqli_query($conn,$sql)){
       $flag=false;
       break;
    } 
}
if($flag){
    echo "{\"msg\":\"success\"}";
}
else{
    echo "{\"msg\":\"erro\"}";
}

}
else{
    echo "{\"msg\":\"session invalid\"}";
}



?>