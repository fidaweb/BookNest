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
        echo '<error>' . htmlspecialchars('Unauthorized: Session invalid or user not logged in.', ENT_QUOTES, 'UTF-8') . '</error>';
        exit();
    }
    
    if (!isset($_SESSION["user_id"])) {
        echo '<success>false</success>';
        echo '<error>' . htmlspecialchars('User ID not found in session. Please log in again.', ENT_QUOTES, 'UTF-8') . '</error>';
        exit();
    }
    
    //  sanitization for user_id
    $user_id = filter_var($_SESSION["user_id"], FILTER_VALIDATE_INT);
    if ($user_id === false || $user_id <= 0) {
        echo '<success>false</success>';
        echo '<error>' . htmlspecialchars('Invalid user ID in session.', ENT_QUOTES, 'UTF-8') . '</error>';
        exit();
    }

    if (!isset($conn)) {
        throw new Exception("Connection variable not found");
    }
    
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }

    
    function sanitizeInput($input, $type = 'string') {
        $input = trim($input);
        
        switch ($type) {
            case 'int':
                return filter_var($input, FILTER_VALIDATE_INT);
            case 'string':
                
                $input = htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
                // additional XSS prevention(lab manual er bahire korechi from net). eta just script tags replace kore so malicious code na dey
                $input = preg_replace('/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/mi', '', $input);
                $input = preg_replace('/javascript:/i', '', $input);
                $input = preg_replace('/on\w+\s*=/i', '', $input);
                return $input;
            default:
                return htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
        }
    }

    // sending new message
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'send_message') {
        if (!isset($_POST['community_id']) || !isset($_POST['message'])) {
            throw new Exception("Missing required fields");
        }
        
        
        $community_id = sanitizeInput($_POST['community_id'], 'int');
        if ($community_id === false || $community_id <= 0) {
            throw new Exception("Invalid community ID");
        }
        
        $message = sanitizeInput($_POST['message'], 'string');
        
        if (empty($message)) {
            throw new Exception("Message cannot be empty");
        }
        
        if (strlen($message) > 500) {
            throw new Exception("Message too long (maximum 500 characters)");
        }
        
        // sql injection  
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
        
        // insert message 
        $sql = "INSERT INTO chat (community_id, user_id, message, sent_at) VALUES (?, ?, ?, NOW())";
        $stmt = mysqli_prepare($conn, $sql);
        
        if (!$stmt) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($stmt, "iis", $community_id, $user_id, $message);
        
        if (mysqli_stmt_execute($stmt)) {
            echo '<success>true</success>';
            echo '<message>' . htmlspecialchars('Message sent successfully', ENT_QUOTES, 'UTF-8') . '</message>';
        } else {
            throw new Exception("Failed to send message: " . mysqli_stmt_error($stmt));
        }
       
        mysqli_stmt_close($stmt);
    }
    
    // get messages
    else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['community_id'])) {
        $community_id = sanitizeInput($_GET['community_id'], 'int');
        
        if ($community_id === false || $community_id <= 0) {
            throw new Exception("Invalid community ID");
        }
        
        // fetch community info 
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
        
        // fetch chat messages 
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
        echo '<name>' . htmlspecialchars($community_data['name'], ENT_QUOTES, 'UTF-8') . '</name>';
        echo '<description>' . htmlspecialchars($community_data['description'], ENT_QUOTES, 'UTF-8') . '</description>';
        echo '</community>';
        echo '<messages>';

        if (mysqli_num_rows($chat_result) > 0) {
            while($row = mysqli_fetch_assoc($chat_result)) {
                echo '<chat>';
                echo '<chat_id>' . htmlspecialchars($row['chat_id'], ENT_QUOTES, 'UTF-8') . '</chat_id>';
                echo '<user_id>' . htmlspecialchars($row['user_id'], ENT_QUOTES, 'UTF-8') . '</user_id>';
                echo '<username>User' . htmlspecialchars($row['user_id'], ENT_QUOTES, 'UTF-8') . '</username>';
                echo '<message>' . htmlspecialchars($row['message'], ENT_QUOTES, 'UTF-8') . '</message>';
                echo '<sent_at>' . htmlspecialchars($row['sent_at'], ENT_QUOTES, 'UTF-8') . '</sent_at>';
                echo '</chat>';
            }
        }

        echo '</messages>';

        mysqli_stmt_close($community_stmt);
        mysqli_stmt_close($chat_stmt);
    }
    
    else {
        throw new Exception("Invalid request - missing required parameters");
    }
    
} catch (Exception $e) {
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . '</error>';
}

echo '</response>';

if (isset($conn)) {
    mysqli_close($conn);
}
?>
