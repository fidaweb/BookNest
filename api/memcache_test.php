<?php
phpinfo();
echo ini_get('session.save_handler'); // Should return 'memcached'
echo '<br>';
echo ini_get('session.save_path');    // Should contain Memcached server addresses
echo '<br>';


session_start();
$_SESSION['test'] = 'memcached_check';
session_write_close();

session_start();
echo $_SESSION['test']; // Should return 'memcached_check'


?>