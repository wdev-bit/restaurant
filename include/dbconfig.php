<?php
// session_start();

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
  //Username, Password and Database
  $con = new mysqli("localhost", "angorabynayabcha_pharmacy","angorabynayabcha_pharmacy","angorabynayabcha_pharmacy");
  $con->set_charset("utf8mb4");
} catch(Exception $e) {
  error_log($e->getMessage());
  //Should be a message a typical user could understand
}

$fset = $con->query("select * from setting")->fetch_assoc();
$fetch_main = $con->query("select * from main_setting")->fetch_assoc();

date_default_timezone_set($fset['timezone']);
$dirname = dirname( dirname(__FILE__) ).'/api';


?>

