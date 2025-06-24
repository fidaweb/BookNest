<?php
// Database connection parameters
$servername = "localhost";
$username = "root";        // default username in XAMPP
$password = "";            // default password is empty in XAMPP
$dbname = "test";  // Replace with your actual DB name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


?>
