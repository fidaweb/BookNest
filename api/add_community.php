<?php
include("../config/connection.php");
include("session.php");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



$name = $_POST['name'];
$description = $_POST['description'];
$image_url = $_POST['image_url'];
$category = $_POST['category'];

if(checkSession($conn)){
    $stmt = $conn->prepare("INSERT INTO communities (name, description, image_url,category) VALUES (?, ?, ?,?)");
    $stmt->bind_param("ssss", $name, $description, $image_url,$category);

    $memcache=new memcached();
    $memcache->addServer('localhost',11211);
    $keyname='all_communities_xml';
    $memcache->delete($keyname);
    
    if ($stmt->execute()) {
        echo "  Community created";
    } else {
        echo "error: " . $stmt->error;
    }
}
else{
    echo "Session not valid";
}



?>
