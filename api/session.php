<?php
// require '../config/connection.php';


function checkSession($conn){
   
    if(!isset($_COOKIE["session_id"])){
            return False;
        }
    if(!isset($_SESSION["session_id"])){
        $session_id=$_COOKIE["session_id"];
      

        $stmt=$conn->prepare("SELECT * FROM sessions WHERE sessionid=?");
        $stmt->bind_param("s",$session_id);
        $stmt->execute();
        $result=$stmt->get_result();
    
       

        if($result->num_rows>0){
            session_start();
            $session=mysqli_fetch_assoc($result);
            $_SESSION['user_id']=$session['user_id'];
            $_SESSION['session_id']=$session_id;
            return true;
            
        }
        else{
            return false;
        }

    }else{
        return true;
    }
    
    
   
}



function checkAdminSession($conn){
    if(checkSession($conn)){
    
        
        if(!isset($_SESSION['admin_id'])){
            // echo $_SESSION['session_id'];
            $session_id=$_SESSION['session_id'];
            $stmt=$conn->prepare("SELECT * FROM admin WHERE session=?");
            $stmt->bind_param("s",$session_id);
            $stmt->execute();
            $result=$stmt->get_result();

           
            if($result->num_rows>0){
                
                $_SESSION['admin_id']=$session_id;
                return true;
            }
            else{
                return false;
            }
        
            }
            else{
                return true;
            }
    }else{
        return false;
    }
    

}















