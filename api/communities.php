<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Configure Memcached for session storage BEFORE session_start()
ini_set('session.save_handler', 'memcached');
ini_set('session.save_path', 'localhost:11211'); // Assuming Memcached runs on localhost:11211

include("../config/connection.php");
include("session.php"); // Assuming session.php calls session_start()

// Memcached server details
$memcached_host = "localhost";
$memcached_port = 11211; // Use the same port as session.save_path

// Create Memcached connection
$memcache = new Memcached();
$memcache->addServer($memcached_host, $memcached_port);

// Check for Memcached connection errors (optional, but good for debugging)
if ($memcache->getStats() === false) {
    // Handle Memcached connection failure gracefully
    // For production, you might log this and fall back to database directly
    // For now, we'll just log a message.
    error_log("Memcached connection failed. Falling back to database for data fetching.");
    $memcache = null; // Set to null to indicate Memcached is not available
}


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
        if (!function_exists('checkSession') || !checkSession($conn)) {
            echo json_encode([
                'success' => false,
                'message' => 'Please log in to join communities.'
            ]);
            exit;
        }
       
        // user_id from cookie 
        $user_id = (int)$_SESSION["user_id"]; 
        
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
    $cache_key = 'all_communities_xml';
    $xml_data = false;

    // Try to get data from Memcached
    if ($memcache) {
        $xml_data = $memcache->get($cache_key);
    }

    if ($xml_data) {
        // Data found in Memcached
        echo '<success>true</success>';
        echo '<communities>';
        echo $xml_data; // Output cached XML fragment
        echo '</communities>';
    } else {
        // Data not found in Memcached, fetch from database
        $sql = "SELECT community_id, name, description, image_url, category FROM communities ORDER BY community_id DESC";
        $result = mysqli_query($conn, $sql);
        
        if (!$result) {
            throw new Exception("Query failed: " . mysqli_error($conn));
        }
        
        echo '<success>true</success>';
        echo '<communities>';
        
        $temp_xml_fragment = '';
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                $temp_xml_fragment .= '<community>';
                $temp_xml_fragment .= '<community_id>' . htmlspecialchars($row['community_id']) . '</community_id>';
                $temp_xml_fragment .= '<name>' . htmlspecialchars($row['name']) . '</name>';
                $temp_xml_fragment .= '<description>' . htmlspecialchars($row['description']) . '</description>';
                $temp_xml_fragment .= '<image_url>' . htmlspecialchars($row['image_url']) . '</image_url>';
                $temp_xml_fragment .= '<category>' . htmlspecialchars($row['category']) . '</category>';
                $temp_xml_fragment .= '</community>';
            }
        }
        
        echo $temp_xml_fragment; // Output to client
        
        // Store in Memcached for 1 hour (3600 seconds)
        if ($memcache) {
            $memcache->set($cache_key, $temp_xml_fragment, 3600);
        }
        
        echo '</communities>';
    }
    
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
