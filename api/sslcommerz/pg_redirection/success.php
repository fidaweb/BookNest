<?php
######
# THIS FILE IS ONLY AN EXAMPLE. PLEASE MODIFY AS REQUIRED.
# Contributors: 
#       Md. Rakibul Islam <rakibul.islam@sslwireless.com>
#       Prabal Mallick <prabal.mallick@sslwireless.com>
######

error_reporting(0);
ini_set('display_errors', 0);
?>
<!DOCTYPE html>

<head>
    <meta name="author" content="SSLCommerz">
    <title>Successful Transaction - SSLCommerz</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="row" style="margin-top: 10%;">
            <div class="col-md-8 offset-md-2">

                <?php
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

                if ($row['status'] == 'Pending' || $row['status'] == 'Processing') {
                    $validated = $sslc->orderValidate($_POST, $tran_id, $amount, $currency);

                    if ($validated&&checkSession($conn_integration)) {
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
                            } 
}


                        if ($flag) { ?>
                            <h2 class="text-center text-success">Congratulations! Your Transaction is Successful.<?php
                            echo 'Books purchased: '.json_encode($books);
                            echo '<br>';
                            echo json_encode($tran_id);
                            echo '<br>';
                            echo 'Purhcased by User ID: '.json_encode($user_id);
                            ?></h2>
                            <br>
                            <table border="1" class="table table-striped">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th colspan="2">Payment Details</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td class="text-right">Transaction ID</td>
                                    <td><?= $_POST['tran_id'] ?></td>
                                </tr>
                                <tr>
                                    <td class="text-right">Transaction Time</td>
                                    <td><?= $_POST['tran_date'] ?></td>
                                </tr>
                                <tr>
                                    <td class="text-right">Payment Method</td>
                                    <td><?= $_POST['card_issuer'] ?></td>
                                </tr>
                                <tr>
                                    <td class="text-right">Bank Transaction ID</td>
                                    <td><?= $_POST['bank_tran_id'] ?></td>
                                </tr>
                                <tr>
                                    <td class="text-right">Amount</td>
                                    <td><?= $_POST['amount'] . ' ' . $_POST['currency'] ?></td>
                                </tr>
                            </table>
                            <div>
                             <button class="btn btn-outline-dark"><a href="https://fidaullah.test/Project/client/pages/home.html">Home</a></button>
                            </div>
                           

                        <?php

                        } else { // update query returned error

                            echo '<h2 class="text-center text-danger">Error updating record: </h2>' . $conn_integration->error;

                        } // update query successful or not 

                    } else { // $validated is false

                        echo '<h2 class="text-center text-danger">Payment was not valid. Please contact with the merchant.</h2>';

                    } // check if validated or not

                } else { // status is something else

                    echo '<h2 class="text-center text-danger">Invalid Information.</h2>';

                } // status is 'Pending' or already 'Processing'
                ?>

            </div>
        </div>
    </div>
</body>
