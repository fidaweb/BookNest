<?php
// Prevent any headers from being sent before session
if (headers_sent($file, $line)) {
    die("Headers already sent in $file on line $line");
}

// // Memcached server config
// $memcache_servers = [
//     ['host' => '127.0.0.1', 'port' => 11211],
// ];

// // Set session to use memcached
// ini_set('session.save_handler', 'memcached');  // ✅ must be before session_start
// ini_set('session.save_path', implode(',', array_map(function ($s) {
//     return "tcp://{$s['host']}:{$s['port']}";
// }, $memcache_servers)));

session_start(); // ✅ must come AFTER ini_set

// Debug
echo "<pre>SESSION ID: " . session_id() . "</pre>";

// Set or display session
if (isset($_SESSION['id'])) {
    echo "Stored session ID: " . $_SESSION['id'];
} else {
    $_SESSION['id'] = $_GET['user'] ?? 'guest';
    echo "Session set to: " . $_SESSION['id'];
}





 


