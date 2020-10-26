<?php 
require 'db.php';
$data = $_POST;

if($data['uid'] == '')
{
 $returnArr = array("ResponseCode"=>"401","Result"=>"false","ResponseMsg"=>"Something Went Wrong!");    
}
else
{
    $uid = $data['uid'];
    $num = $data['card_number'];
    $chn = $data['card_holder_name'];
    $cvc = $data['cvc'];
    $epm = $data['expiry_month'];
    $epy = $data['expiry_year'];
    $acd = $data['access_code'];
    $rfc = $data['reference'];
    
    $con->query("insert into user_detail(`user_id`,`card_number`,`card_holder_name`,`cvc`,`expiry_month`,`expiry_year`,`access_code`,`reference`)values('".$uid."','".$num."','".$chn."','".$cvc."','".$epm."','".$epy."','".$acd."','".$rfc."')");
    $returnArr = array("ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Card Saved Successfully!!!");
}

echo json_encode($returnArr);