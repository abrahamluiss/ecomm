<?php 
ob_start();
session_start();
include 'admin/../../admin/inc/config.php';
unset($_SESSION['customer']);
header("location: ".BASE_URL.'login.php'); 
?>