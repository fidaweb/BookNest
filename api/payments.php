<?php
header('Content-Type: text/xml');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
    include("../config/connection.php");
    
    if (!isset($conn)) {
        throw new Exception("Connection variable not found");
    }
    
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    
    // Handle payment processing (POST request)
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'process_payment') {
        
        // Validate required fields
        if (!isset($_POST['user_id']) || !isset($_POST['payment_method']) || !isset($_POST['total_amount'])) {
            throw new Exception("Missing required payment information");
        }
        
        $user_id = intval($_POST['user_id']);
        $payment_method = trim($_POST['payment_method']);
        $total_amount = floatval($_POST['total_amount']);
        
        if ($user_id <= 0) {
            throw new Exception("Invalid user ID");
        }
        
        if ($total_amount <= 0) {
            throw new Exception("Invalid payment amount");
        }
        
        // Validate payment method specific fields
        if ($payment_method === 'bank') {
            if (!isset($_POST['cardholder_name']) || !isset($_POST['card_number']) || !isset($_POST['expiry_date'])) {
                throw new Exception("Missing card information");
            }
            
            $cardholder_name = trim($_POST['cardholder_name']);
            $card_number = trim($_POST['card_number']);
            $expiry_date = trim($_POST['expiry_date']);
            
            if (empty($cardholder_name) || empty($card_number) || empty($expiry_date)) {
                throw new Exception("All card fields are required");
            }
            
        } else if ($payment_method === 'mobile') {
            if (!isset($_POST['mobile_service']) || !isset($_POST['mobile_number'])) {
                throw new Exception("Missing mobile banking information");
            }
            
            $mobile_service = trim($_POST['mobile_service']);
            $mobile_number = trim($_POST['mobile_number']);
            
            if (empty($mobile_service) || empty($mobile_number)) {
                throw new Exception("All mobile banking fields are required");
            }
        } else {
            throw new Exception("Invalid payment method");
        }
        
        // Get books from cart (for demo, we'll use the hardcoded books from HTML)
        $books = [
            ['book_id' => 1, 'price' => 20.00],
            ['book_id' => 2, 'price' => 50.00]
        ];
        
        // Start transaction
        mysqli_autocommit($conn, FALSE);
        
        try {
            // Insert payment records for each book
            $payment_ids = [];
            foreach ($books as $book) {
                $sql = "INSERT INTO payment (user_id, book_id, price, bought_at) VALUES (?, ?, ?, NOW())";
                $stmt = mysqli_prepare($conn, $sql);
                
                if (!$stmt) {
                    throw new Exception("Prepare failed: " . mysqli_error($conn));
                }
                
                mysqli_stmt_bind_param($stmt, "iid", $user_id, $book['book_id'], $book['price']);
                
                if (!mysqli_stmt_execute($stmt)) {
                    throw new Exception("Failed to process payment: " . mysqli_stmt_error($stmt));
                }
                
                $payment_ids[] = mysqli_insert_id($conn);
                mysqli_stmt_close($stmt);
            }
            
            // Commit transaction
            mysqli_commit($conn);
            
            // Generate invoice number
            $invoice_number = 'INV-' . strtoupper(substr(md5(time() . $user_id), 0, 8));
            
            echo '<success>true</success>';
            echo '<message>Payment processed successfully</message>';
            echo '<invoice_number>' . htmlspecialchars($invoice_number) . '</invoice_number>';
            echo '<amount_paid>' . number_format($total_amount, 2) . '</amount_paid>';
            echo '<payment_date>' . date('Y-m-d H:i:s') . '</payment_date>';
            echo '<payment_ids>';
            foreach ($payment_ids as $pay_id) {
                echo '<pay_id>' . $pay_id . '</pay_id>';
            }
            echo '</payment_ids>';
            
        } catch (Exception $e) {
            // Rollback transaction
            mysqli_rollback($conn);
            throw $e;
        }
    }
    
    // Handle getting payment history (GET request)
    else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['user_id'])) {
        $user_id = intval($_GET['user_id']);
        
        if ($user_id <= 0) {
            throw new Exception("Invalid user ID");
        }
        
        $sql = "SELECT pay_id, book_id, price, bought_at FROM payments WHERE user_id = ? ORDER BY bought_at DESC LIMIT 10";
        $stmt = mysqli_prepare($conn, $sql);
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($stmt, "i", $user_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        
        echo '<success>true</success>';
        echo '<payments>';
        
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo '<payment>';
                echo '<pay_id>' . htmlspecialchars($row['pay_id']) . '</pay_id>';
                echo '<book_id>' . htmlspecialchars($row['book_id']) . '</book_id>';
                echo '<price>' . htmlspecialchars($row['price']) . '</price>';
                echo '<bought_at>' . htmlspecialchars($row['bought_at']) . '</bought_at>';
                echo '</payment>';
            }
        }
        
        echo '</payments>';
        mysqli_stmt_close($stmt);
    }
    
    else {
        throw new Exception("Invalid request - missing required parameters");
    }
    
} catch (Exception $e) {
    // Rollback transaction if it was started
    if (isset($conn)) {
        mysqli_rollback($conn);
    }
    
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
}

echo '</response>';

if (isset($conn)) {
    mysqli_close($conn);
}
?>
