<?php

error_reporting(0);
ini_set('display_errors', 0);

include("../config/connection.php");
include("session.php");


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    header('Content-Type: application/json');
} else {
    header('Content-Type: text/xml; charset=utf-8');
}

//   memcached judi na thake
$memcache = null;
if (class_exists('Memcached')) {
    try {
        $memcache = new Memcached();
        $memcache->addServer('localhost', 11211);//eta port number

        if ($memcache->getStats() === false) {
            $memcache = null;
        }
    } catch (Exception $e) {
        $memcache = null;
    }
}

if (!$conn) {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        echo json_encode(['success' => false, 'message' => 'Database connection failed']);
    } else {
        echo '<?xml version="1.0" encoding="UTF-8"?>';
        echo '<response>';
        echo '<success>false</success>';
        echo '<error>Database connection failed</error>';
        echo '</response>';
    }
    exit;
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {

        if (!checkSession($conn)) {
            echo json_encode([
                'success' => false,
                'message' => 'Please log in to join communities.'
            ]);
            exit;
        }
       
        $user_id = (int)$_SESSION["user_id"]; 
        
        if (!isset($_POST['community_id']) || empty($_POST['community_id'])) {
            echo json_encode([
                'success' => false,
                'message' => 'Community ID is required.'
            ]);
            exit;
        }
        
        $community_id = (int)$_POST['community_id'];
        
        // jodi user oi cummunity member agei
        $check_sql = "SELECT 1 FROM community_members WHERE community_id = ? AND user_id = ?";
        $check_stmt = mysqli_prepare($conn, $check_sql);
        
        if (!$check_stmt) {
            throw new Exception("Database error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($check_stmt, "ii", $community_id, $user_id);
        mysqli_stmt_execute($check_stmt);
        $check_result = mysqli_stmt_get_result($check_stmt);
        
        if (mysqli_num_rows($check_result) > 0) {
            echo json_encode([
                'success' => false,
                'message' => 'You are already a member of this community.'
            ]);
            exit;
        }
        
        //  new member
        $insert_sql = "INSERT INTO community_members (community_id, user_id) VALUES (?, ?)";
        $insert_stmt = mysqli_prepare($conn, $insert_sql);
        
        if (!$insert_stmt) {
            throw new Exception("Database error: " . mysqli_error($conn));
        }
        
        mysqli_stmt_bind_param($insert_stmt, "ii", $community_id, $user_id);
        
        if (mysqli_stmt_execute($insert_stmt)) {
            echo json_encode([
                'success' => true,
                'message' => 'Successfully joined the community!'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to join community: ' . mysqli_stmt_error($insert_stmt)
            ]);
        }
        
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Server error: ' . $e->getMessage()
        ]);
    }
    exit; 
}

// fetching communities
try {
    
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo '<response>';
    
    $cache_key = 'all_communities_xml';
    $xml_data = false;

    // get data from cache
    if ($memcache) {
        $xml_data = $memcache->get($cache_key);
    }

    if ($xml_data) {
        echo '<mem>true</mem>';
        echo '<success>true</success>';
        echo '<communities>';
        echo $xml_data;
        echo '</communities>';
    } else {
        //  from database
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
                $temp_xml_fragment .= '<community_id>' . htmlspecialchars($row['community_id'], ENT_XML1, 'UTF-8') . '</community_id>';
                $temp_xml_fragment .= '<name>' . htmlspecialchars($row['name'], ENT_XML1, 'UTF-8') . '</name>';
                $temp_xml_fragment .= '<description>' . htmlspecialchars($row['description'], ENT_XML1, 'UTF-8') . '</description>';
                $temp_xml_fragment .= '<image_url>' . htmlspecialchars($row['image_url'], ENT_XML1, 'UTF-8') . '</image_url>';
                $temp_xml_fragment .= '<category>' . htmlspecialchars($row['category'], ENT_XML1, 'UTF-8') . '</category>';
                $temp_xml_fragment .= '</community>';
            }
        }
        
        echo $temp_xml_fragment;
        
        // store in cache for 1 hour
        if ($memcache) {
            $memcache->set($cache_key, $temp_xml_fragment, 3600);
        }
        
        echo '</communities>';
    }
    
    echo '</response>';
    
} catch (Exception $e) {
    echo '<success>false</success>';
    echo '<error>' . htmlspecialchars($e->getMessage(), ENT_XML1, 'UTF-8') . '</error>';
    echo '</response>';
}


if (isset($conn) && $conn) {
    mysqli_close($conn);
}
?>
