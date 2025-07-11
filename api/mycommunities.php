<?php
// Handle leave community functionality
if (isset($_POST['action']) && $_POST['action'] === 'leave_community') {
    header('Content-Type: text/xml');
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo '<response>';
    
    try {
        if (!isset($_POST['user_id']) || empty($_POST['user_id'])) {
            throw new Exception("User ID is required");
        }
        
        if (!isset($_POST['community_id']) || empty($_POST['community_id'])) {
            throw new Exception("Community ID is required");
        }
        
        $user_id = intval($_POST['user_id']);
        $community_id = intval($_POST['community_id']);
        
        include("../config/connection.php");
        
        if (!isset($conn)) {
            throw new Exception("Connection variable not found in connection file");
        }
        
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }
        
        // Check if the user is actually a member of this community
        $check_sql = "SELECT cm.id, c.name FROM community_member cm 
                      INNER JOIN communities c ON cm.community_id = c.community_id 
                      WHERE cm.user_id = ? AND cm.community_id = ?";
        $check_stmt = mysqli_prepare($conn, $check_sql);
        mysqli_stmt_bind_param($check_stmt, "ii", $user_id, $community_id);
        mysqli_stmt_execute($check_stmt);
        $check_result = mysqli_stmt_get_result($check_stmt);
        
        if (mysqli_num_rows($check_result) === 0) {
            throw new Exception("You are not a member of this community");
        }
        
        $membership_data = mysqli_fetch_assoc($check_result);
        $community_name = $membership_data['name'];
        
        // Remove the user from the community
        $delete_sql = "DELETE FROM community_member WHERE user_id = ? AND community_id = ?";
        $delete_stmt = mysqli_prepare($conn, $delete_sql);
        mysqli_stmt_bind_param($delete_stmt, "ii", $user_id, $community_id);
        
        if (mysqli_stmt_execute($delete_stmt)) {
            $affected_rows = mysqli_stmt_affected_rows($delete_stmt);
            
            if ($affected_rows > 0) {
                echo '<success>true</success>';
                echo '<message>You have successfully left "' . htmlspecialchars($community_name) . '"</message>';
                echo '<community_id>' . $community_id . '</community_id>';
            } else {
                throw new Exception("Failed to leave community");
            }
        } else {
            throw new Exception("Database error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_close($delete_stmt);
        mysqli_stmt_close($check_stmt);
        
    } catch (Exception $e) {
        echo '<success>false</success>';
        echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
    }
    
    echo '</response>';
    
    if (isset($conn)) {
        mysqli_close($conn);
    }
    exit;
}

// Handle regular user communities fetch
if (!isset($_POST['action'])) {
    header('Content-Type: text/xml');
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo '<response>';
    
    try {
        if (!isset($_GET['user_id']) || empty($_GET['user_id'])) {
            throw new Exception("User ID is required");
        }
        
        $user_id = intval($_GET['user_id']);
        
        include("../config/connection.php");
        
        if (!isset($conn)) {
            throw new Exception("Connection variable not found in connection file");
        }
        
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }
        
        // Join community_member with communities table to get user's communities
        $sql = "SELECT 
                    c.community_id, 
                    c.name, 
                    c.description, 
                    c.image_url, 
                    c.category
                FROM community_member cm 
                INNER JOIN communities c ON cm.community_id = c.community_id 
                WHERE cm.user_id = ? 
                ORDER BY c.community_id DESC";
        
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "i", $user_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        
        if (!$result) {
            throw new Exception("Query failed: " . mysqli_error($conn));
        }
        
        echo '<success>true</success>';
        echo '<communities>';
        
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                echo '<community>';
                echo '<community_id>' . htmlspecialchars($row['community_id']) . '</community_id>';
                echo '<name>' . htmlspecialchars($row['name']) . '</name>';
                echo '<description>' . htmlspecialchars($row['description']) . '</description>';
                echo '<image_url>' . htmlspecialchars($row['image_url']) . '</image_url>';
                echo '<category>' . htmlspecialchars($row['category']) . '</category>';
                echo '</community>';
            }
        }
        
        echo '</communities>';
        
        mysqli_stmt_close($stmt);
        
    } catch (Exception $e) {
        echo '<success>false</success>';
        echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
    }
    
    echo '</response>';
    
    if (isset($conn)) {
        mysqli_close($conn);
    }
}
?>
