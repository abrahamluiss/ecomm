<?php 
ob_start();
session_start();
include '../../Model/inc/config.php'; 
unset($_SESSION['user']);
header("location: login.php"); 
?>