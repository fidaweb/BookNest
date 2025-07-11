<?php
header('Content-Type: text/xml');

echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Only POST requests are allowed");
    }
    
    if (!isset($_POST['community_id']) || empty($_POST['community_id'])) {
        throw new Exception("Community ID is required");
    }
    
    $community_id = intval($_POST['community_id']);
    
    include("../config/connection.php");
    
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    
    $check_sql = "SELECT name FROM communities WHERE community_id = ?";
    $check_stmt = mysqli_prepare($conn, $check_sql);
    mysqli_stmt_bind_param($check_stmt, "i", $community_id);
    mysqli_stmt_execute($check_stmt);
    $check_result = mysqli_stmt_get_result($check_stmt);
    
    if (mysqli_num_rows($check_result) === 0) {
        throw new Exception("Community not found");
    }
    
    $community_data = mysqli_fetch_assoc($check_result);
    $community_name = $community_data['name'];
    
    $delete_sql = "DELETE FROM communities WHERE community_id = ?";
    $delete_stmt = mysqli_prepare($conn, $delete_sql);
    mysqli_stmt_bind_param($delete_stmt, "i", $community_id);
    
    if (mysqli_stmt_execute($delete_stmt)) {
        echo '<success>true</success>';
        echo '<message>Community "' . htmlspecialchars($community_name) . '" has been successfully deleted</message>';
        echo '<deleted_id>' . $community_id . '</deleted_id>';
    } else {
        throw new Exception("Failed to delete community");
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
?>
