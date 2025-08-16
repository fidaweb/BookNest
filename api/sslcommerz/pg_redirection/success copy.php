<?php
######
# THIS FILE IS ONLY AN EXAMPLE. PLEASE MODIFY AS REQUIRED.
# Contributors: 
#       Md. Rakibul Islam <rakibul.islam@sslwireless.com>
#       Prabal Mallick <prabal.mallick@sslwireless.com>
######

error_reporting(0);
ini_set('display_errors', 0);
 require_once(__DIR__ . "/../lib/SslCommerzNotification.php");
                include_once(__DIR__ . "/../db_connection.php");
                include_once(__DIR__ . "/../OrderTransaction.php");
                include_once(__DIR__ . "/../../session.php");
               

                use SslCommerz\SslCommerzNotification;
                
                $sslc = new SslCommerzNotification();
                $tran_id = $_POST['tran_id'];
                $amount =  $_POST['amount'];
                $currency =  $_POST['currency'];
                

                $ot = new OrderTransaction();
                $sql = $ot->getRecordQuery($tran_id);
                $result = $conn_integration->query($sql);
                $row = $result->fetch_array(MYSQLI_ASSOC);
                
                echo json_encode($row);
                echo $row['status'];

                if ($row['status'] == 'Pending' || $row['status'] == 'Processing') {
                    echo 'pending';
                    $validated = $sslc->orderValidate($_POST, $tran_id, $amount, $currency);
                    echo 'validate';

                    if ($validated&&checkSession($conn_integration)) {
                        echo 'session';
                        $books=$_SESSION['cart'];
                        $user_id=$_SESSION['user_id'];
                        $sql = $ot->updateTransactionQuery($tran_id, 'Processing');
                        $conn_integration->query($sql);
                        $flag=true;
                        for($i=0;$i<count($books);$i++){
                            $book=$books[$i];
                            $sql="INSERT INTO payments (payment_id,user_id, book_id,price, bought_at) SELECT ?,?,b.id,b.PRICE,CURRENT_TIMESTAMP() FROM books b WHERE b.id=?";
                            $stmt=mysqli_prepare($conn_integration,$sql);
                            mysqli_stmt_bind_param($stmt,'sii',$tran_id,$user_id,$book);
                        
                            if(!mysqli_stmt_execute($stmt)){
                                $flag=false;
                                break;
                            }}
                        echo json_encode($flag);
                        
                        $memcache=new memcached();
                        $memcache->addServer('localhost',11211);
    
                        $cache_key = 'user_books_' . $user_id;
                        $memcache->delete($cache_key);
                    }}

?>


                
    


                       