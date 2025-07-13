<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);


include("../config/connection.php");
include("session.php"); 


if (!$conn) {
    // connection fail
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Database connection failed: ' . mysqli_connect_error()]);
    } else {
        header('Content-Type: text/xml');
        echo '<?xml version="1.0" encoding="UTF-8"?><response><success>false</success><error>Database connection failed: ' . htmlspecialchars(mysqli_connect_error()) . '</error></response>';
    }
    exit;
}



//  joining community 
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    header('Content-Type: application/json');
    
    try {


 if (!checkSession()) {
    echo json_encode([
        'success' => false,
        'message' => 'Please log in to join communities.'
    ]);
    exit;
}
       
        
        // user_id from cookie 
        $user_id = (int)$_COOKIE["user_id"]; 
        
        
        if (!isset($_POST['community_id']) || empty($_POST['community_id'])) {
            echo json_encode([
                'success' => false,
                'message' => 'Community ID is required.'
            ]);
            exit;
        }
        
        $community_id = (int)$_POST['community_id'];
        
        // check user already  member
        $check_stmt = $conn->prepare("SELECT 1 FROM community_members WHERE community_id = ? AND user_id = ?");
        $check_stmt->bind_param("ii", $community_id, $user_id);
        $check_stmt->execute();
        $check_result = $check_stmt->get_result();
        
        if ($check_result->num_rows > 0) {
            echo json_encode([
                'success' => false,
                'message' => 'You are already a member of this community.'
            ]);
            exit;
        }
        
        // insert to community_member 
        $insert_stmt = $conn->prepare("INSERT INTO community_members (community_id, user_id) VALUES (?, ?)");
        $insert_stmt->bind_param("ii", $community_id, $user_id);
        
        if ($insert_stmt->execute()) {
            echo json_encode([
                'success' => true,
                'message' => 'Successfully joined the community!'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to join community: ' . $insert_stmt->error
            ]);
        }
        
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Server error: ' . $e->getMessage()
        ]);
    } finally {
        if (isset($conn) && $conn) {
            mysqli_close($conn);
        }
    }
    exit; 
}

//  fetching communities 

header('Content-Type: text/xml');
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<response>';

try {
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
} finally {
    if (isset($conn) && $conn) {
        mysqli_close($conn);
    }
}

echo '</response>';
?>