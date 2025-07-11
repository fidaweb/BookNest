<?php
include("../config/connection.php");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



$name = $_POST['name'];
$description = $_POST['description'];
$image_url = $_POST['image_url'];
$category = $_POST['category'];

$stmt = $conn->prepare("INSERT INTO communities (name, description, image_url,category) VALUES (?, ?, ?,?)");
$stmt->bind_param("ssss", $name, $description, $image_url,$category);

if ($stmt->execute()) {
    echo "  Community created";
} else {
    echo "error: " . $stmt->error;
}

$conn->close();
?>
