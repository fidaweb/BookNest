<?php
// Handle regular communities fetch
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: text/xml');

echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
    include("../config/connection.php");
    
    if (!isset($conn)) {
        throw new Exception("Connection variable not found in connection file");
    }
    
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }
    
    $sql = "SELECT community_id, name, description, image_url, category FROM communities ORDER BY community_id DESC";
    $result = mysqli_query($conn, $sql);
    
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
    
} catch (Exception $e) {
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage()) . '</error>';
}

echo '</response>';

if (isset($conn)) {
    mysqli_close($conn);
}
?>
