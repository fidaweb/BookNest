<?php
header('Content-Type: text/xml');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');


if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
    include("../config/connection.php");
    include("session.php");
    
    
    if (!function_exists('checkSession') || !checkSession($conn)) {
        echo '<success>false</success>';
        echo '<error>Unauthorized: Session invalid or user not logged in.</error>';
        exit();
    }
    
    if (!isset($_SESSION["user_id"])) {
        echo '<success>false</success>';
        echo '<error>User ID not found in session. Please log in again.</error>';
        exit();
    }
    $user_id = (int)$_SESSION["user_id"]; 

    if (!isset($conn)) {
        throw new Exception("Connection variable not found");
    }
    
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }

    
    //  send new message 
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'send_message') {
        if (!isset($_POST['community_id']) || !isset($_POST['message'])) {
            throw new Exception("Missing required fields");
        }
        
        $community_id = intval($_POST['community_id']);
        $message = trim($_POST['message']);
        // echo $_POST['community_id'];
        // echo $_POST['user_id'];
        // echo $_POST['message'];
        if (empty($message)) {
            throw new Exception("Message cannot be empty");
        }
        
        if (strlen($message) > 500) {
            throw new Exception("Message too long");
        }
        
       
        $check_sql = "SELECT community_id FROM communities WHERE community_id = ?";
        $check_stmt = mysqli_prepare($conn, $check_sql);
        
        if (!$check_stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($check_stmt, "i", $community_id);
        mysqli_stmt_execute($check_stmt);
        $check_result = mysqli_stmt_get_result($check_stmt);
        
        if (mysqli_num_rows($check_result) === 0) {
            throw new Exception("Community not found");
        }
        mysqli_stmt_close($check_stmt);
        
        //  message
        $sql = "INSERT INTO chat (community_id, user_id, message, sent_at) VALUES (?, ?, ?, NOW())";
        $stmt = mysqli_prepare($conn, $sql);
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($stmt, "iis", $community_id, $user_id, $message);
        
        if (mysqli_stmt_execute($stmt)) {
            echo '<success>true</success>';
            echo '<message>Message sent successfully</message>';
        } else {
            throw new Exception("Failed to send message: " . mysqli_stmt_error($stmt));
        }
       
        mysqli_stmt_close($stmt);
    }
   
    
    // get message
    else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['community_id'])) {
        $community_id = intval($_GET['community_id']);
        
        
        if ($community_id <= 0) {
            throw new Exception("Invalid community ID");
        }
        
        // community info fetch kore
        $community_sql = "SELECT name, description FROM communities WHERE community_id = ?";
        $community_stmt = mysqli_prepare($conn, $community_sql);
        
        if (!$community_stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($community_stmt, "i", $community_id);
        mysqli_stmt_execute($community_stmt);
        $community_result = mysqli_stmt_get_result($community_stmt);
        
        if (mysqli_num_rows($community_result) === 0) {
            throw new Exception("Community not found");
        }
        
        $community_data = mysqli_fetch_assoc($community_result);
        
        // chat messages fetch kore
        $chat_sql = "SELECT chat_id, user_id, message, sent_at 
                     FROM chat 
                     WHERE community_id = ? 
                     ORDER BY sent_at ASC 
                     LIMIT 50";
        $chat_stmt = mysqli_prepare($conn, $chat_sql);
        
        if (!$chat_stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($chat_stmt, "i", $community_id);
        mysqli_stmt_execute($chat_stmt);
        $chat_result = mysqli_stmt_get_result($chat_stmt);

        echo '<success>true</success>';
        echo '<community>';
        echo '<name>' . htmlspecialchars($community_data['name']) . '</name>';
        echo '<description>' . htmlspecialchars($community_data['description']) . '</description>';
        echo '</community>';
        echo '<messages>';

        if (mysqli_num_rows($chat_result) > 0) {
            while($row = mysqli_fetch_assoc($chat_result)) {
                echo '<chat>';
                echo '<chat_id>' . htmlspecialchars($row['chat_id']) . '</chat_id>';
                echo '<user_id>' . htmlspecialchars($row['user_id']) . '</user_id>';
                echo '<username>User' . htmlspecialchars($row['user_id']) . '</username>';
                echo '<message>' . htmlspecialchars($row['message']) . '</message>';
                echo '<sent_at>' . htmlspecialchars($row['sent_at']) . '</sent_at>';
                echo '</chat>';
            }
        }

        echo '</messages>';

        mysqli_stmt_close($community_stmt);
        mysqli_stmt_close($chat_stmt);
    }
    
    else {
        // throw new Exception("Invalid request - missing required parameters");
        throw new Exception("Sending ...");
    }
    
} catch (Exception $e) {
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
}

echo '</response>';

if (isset($conn)) {
    mysqli_close($conn);
}
?>
