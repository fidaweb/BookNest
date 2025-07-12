<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Set proper headers
header('Content-Type: application/xml; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

// Start output
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
    // Include database connection first
    $connectionFile = __DIR__ . '/../config/connection.php';
    if (!file_exists($connectionFile)) {
        throw new Exception("Database connection file not found at: " . $connectionFile);
    }
    
    require_once($connectionFile);
    
    if (!isset($conn)) {
        throw new Exception("Database connection not established");
    }
    
    if ($conn->connect_error) {
        throw new Exception("Database connection failed: " . $conn->connect_error);
    }
    include('session.php');
    // // Include session checking - CORRECTED PATH (same folder)
    // $sessionFile = __DIR__ . '/session.php';
    // if (file_exists($sessionFile)) {
    //     require_once($sessionFile);
    // } else {
    //     // Simple fallback session check (should not be needed if session.php exists)
    //     function checkSession() {
    //         return isset($_COOKIE["session_id"]) && isset($_COOKIE["user_id"]);
    //     }
    // }

    // Handle different actions
    if (isset($_POST['action']) && $_POST['action'] === 'leave_community') {
        handleLeaveCommunity($conn);
    } else {
        // Handle get communities
        handleGetCommunities($conn);
    }

} catch (Exception $e) {
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
    error_log("MyCommunitiesAPI Error: " . $e->getMessage());
}

echo '</response>';

if (isset($conn)) {
    mysqli_close($conn);
}

function handleLeaveCommunity($conn) {
    try {
        // Check session
        if (!function_exists('checkSession') || !checkSession()) {
            throw new Exception("Please log in to continue");
        }
        
        // Get user_id from session cookie
        if (!isset($_COOKIE["user_id"])) {
            throw new Exception("Session expired. Please log in again.");
        }
        
        $user_id = (int)$_COOKIE["user_id"];
        
        if (!isset($_POST['community_id']) || empty($_POST['community_id'])) {
            throw new Exception("Community ID is required");
        }
        
        $community_id = intval($_POST['community_id']);
        
        // Check if user is member of this community
        $check_sql = "SELECT cm.id, c.name FROM community_member cm 
                      INNER JOIN communities c ON cm.community_id = c.community_id 
                      WHERE cm.user_id = ? AND cm.community_id = ?";
        
        $check_stmt = mysqli_prepare($conn, $check_sql);
        if (!$check_stmt) {
            throw new Exception("Database prepare error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($check_stmt, "ii", $user_id, $community_id);
        mysqli_stmt_execute($check_stmt);
        $check_result = mysqli_stmt_get_result($check_stmt);
        
        if (mysqli_num_rows($check_result) === 0) {
            throw new Exception("You are not a member of this community");
        }
        
        $membership_data = mysqli_fetch_assoc($check_result);
        $community_name = $membership_data['name'];
        
        // Remove user from community
        $delete_sql = "DELETE FROM community_member WHERE user_id = ? AND community_id = ?";
        $delete_stmt = mysqli_prepare($conn, $delete_sql);
        
        if (!$delete_stmt) {
            throw new Exception("Database prepare error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($delete_stmt, "ii", $user_id, $community_id);
        
        if (mysqli_stmt_execute($delete_stmt)) {
            $affected_rows = mysqli_stmt_affected_rows($delete_stmt);
            
            if ($affected_rows > 0) {
                echo '<success>true</success>';
                echo '<message>You have successfully left "' . htmlspecialchars($community_name) . '"</message>';
                echo '<community_id>' . $community_id . '</community_id>';
            } else {
                throw new Exception("Failed to leave community - no rows affected");
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
}

function handleGetCommunities($conn) {
    try {
        $user_id = null;
        
        // Try to get user_id from session first
        if (function_exists('checkSession') && checkSession() && isset($_COOKIE["user_id"])) {
            $user_id = (int)$_COOKIE["user_id"];
        } 
        // Fallback to GET parameter for testing - REMOVED FOR PRODUCTION
        // else if (isset($_GET['user_id']) && !empty($_GET['user_id'])) {
        //     $user_id = intval($_GET['user_id']);
        // }
        
        if (!$user_id) {
            throw new Exception("Please log in to view your communities");
        }
        
        // Get user's communities with member count
        $sql = "SELECT 
                    c.community_id, 
                    c.name, 
                    c.description, 
                    c.image_url, 
                    c.category,
                    COUNT(cm2.user_id) as member_count
                FROM community_members cm 
                INNER JOIN communities c ON cm.community_id = c.community_id 
                LEFT JOIN community_members cm2 ON c.community_id = cm2.community_id
                WHERE cm.user_id = ? 
                GROUP BY c.community_id, c.name, c.description, c.image_url, c.category
                ORDER BY c.name ASC";
        
        $stmt = mysqli_prepare($conn, $sql);
        if (!$stmt) {
            throw new Exception("Database prepare error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($stmt, "i", $user_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        
        if (!$result) {
            throw new Exception("Query failed: " . mysqli_error($conn));
        }
        
        echo '<success>true</success>';
        echo '<user_id>' . $user_id . '</user_id>';
        echo '<communities>';
        
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                echo '<community>';
                echo '<community_id>' . htmlspecialchars($row['community_id']) . '</community_id>';
                echo '<name>' . htmlspecialchars($row['name']) . '</name>';
                echo '<description>' . htmlspecialchars($row['description'] ?? '') . '</description>';
                echo '<image_url>' . htmlspecialchars($row['image_url'] ?? '') . '</image_url>';
                echo '<category>' . htmlspecialchars($row['category'] ?? '') . '</category>';
                echo '<member_count>' . htmlspecialchars($row['member_count']) . '</member_count>';
                echo '</community>';
            }
        }
        
        echo '</communities>';
        
        mysqli_stmt_close($stmt);
        
    } catch (Exception $e) {
        echo '<success>false</success>';
        echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
    }
}
?>
