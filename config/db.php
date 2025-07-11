<?php
// Database connection parameters
error_reporting(E_ALL);
ini_set('display_errors', 1);
$servername = "localhost";
$username = "root";        // default username in XAMPP
$password = "";            // default password is empty in XAMPP
$dbname = "test2";  // Replace with your actual DB name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


?>
