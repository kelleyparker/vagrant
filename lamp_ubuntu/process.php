<?php
// Stores a submitted name in db1.users.  Credentials come from /etc/lamp_db.ini
// (written by the Vagrant provisioner) and the insert uses a prepared statement.
$cfg = parse_ini_file('/etc/lamp_db.ini');
if ($cfg === false) {
    http_response_code(500);
    exit('Server configuration error.');
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    header('Allow: POST');
    exit('Use the form on the home page.');
}

$name = trim($_POST['name'] ?? '');
if ($name === '' || mb_strlen($name) > 255) {
    http_response_code(400);
    exit('Please enter a name of 1-255 characters.');
}

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conn = new mysqli('localhost', $cfg['user'], $cfg['password'], $cfg['dbname']);
    $stmt = $conn->prepare('INSERT INTO users (name) VALUES (?)');
    $stmt->bind_param('s', $name);
    $stmt->execute();
    $stmt->close();
    $conn->close();
    echo 'Record inserted successfully for ' . htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
} catch (mysqli_sql_exception $e) {
    error_log($e->getMessage());
    http_response_code(500);
    echo 'Database error.';
}
