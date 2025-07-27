<?php
include "../config/db.php";
include "session.php";

if($_SERVER['REQUEST_METHOD']=="POST"){

    if(checkAdminSession($conn)){

        $xml=file_get_contents("php://input");

        $xmlr=simplexml_load_string($xml);
        
        $title=$xmlr->title;
        $author=$xmlr->author;
        $url=$xmlr->url;
        $category=$xmlr->category;
        $price=$xmlr->price;
        $description=$xmlr->description;
        $bookurl=$xmlr->bookurl;
        $action=$xmlr->action;
        
        
        if($action=="add"){
        $sql="INSERT INTO `books`(`ISBN`, `Book_Title`, `Book_Author`, `Year_Of_Publication`, `Publisher`, `Image_URL_S`, `Image_URL_M`, `Image_URL_L`, `PRICE`, `Category`, `description`,`book_url`) VALUES ('[value-1]',?,?,'[value-4]','[value-5]','[value-6]','[value-7]',?,?,?,?,?)";
        
        $stmt=mysqli_prepare($conn,$sql);
        mysqli_stmt_bind_param($stmt,'sssdsss',$title,$author,$url,$price,$category,$description,$bookurl);
        mysqli_stmt_execute($stmt);
        echo "{\"msg\":\"success\"}";
        
        }

        if($action=="update"){

        $book_id=$xmlr->id;
      
      

        $sql="UPDATE `books` SET `Book_Title`=?,`Book_Author`=?,`Image_URL_L`=?,`PRICE`=?,`Category`=?,`description`=?,`book_url`=? WHERE id=?";
        
        $stmt=mysqli_prepare($conn,$sql);
        mysqli_stmt_bind_param($stmt,'sssdsssi',$title,$author,$url,$price,$category,$description,$bookurl,$book_id);
        if(mysqli_stmt_execute($stmt)){
            if(mysqli_stmt_affected_rows($stmt) > 0){
                 echo "{\"msg\":\"success\"}";
            }
           
        }
        
     
        
        }

    }
    else{
        echo "{\"msg\":\"Must be admin\"}";
    }
   
}



if($_SERVER['REQUEST_METHOD']=="GET"){
if(checkAdminSession($conn)){
    $id=$_GET["id"];
    $sql="DELETE FROM `books` WHERE `id`=?";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_bind_param($stmt,'i',$id);
    mysqli_stmt_execute($stmt);
    echo "{\"msg\":\"success\"}";
}
else{
    echo "{\"msg\":\"Must be admin\"}";
}


}


?>