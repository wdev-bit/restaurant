<?php 
require 'db.php';
$data = $_POST;
if($data['uid'] == '')
{
 $returnArr = array("ResponseCode"=>"401","Result"=>"false","ResponseMsg"=>"Something Went Wrong!");    
}
else
{
    echo "ok";
$uid =  $data['uid'];
$ddate = $data['ddate'];
$a = explode('/',$ddate);
$ddate = $a[2].'-'.$a[1].'-'.$a[0];
$timesloat = $data['timesloat'];
$oid ='#'.uniqid();
$pname = $data['pname'];
$status = 'pending'; 
$p_method = $data['p_method'];
$address_id = $data['address_id'];
$tax = $data['tax'];
$coupon_id = $data['coupon_id'];
$cou_amt = $data['cou_amt'];
$wal_amt = $data['wal_amt'];
$timestamp = date("Y-m-d");
$tid = $data['tid'];
$total = number_format((float)$data['total'], 2, '.', '');
$e= array();
$p = array();
$w=array();
$pp = array();
$q = array();
for($i=0;$i<count($pname);$i++)
{
$e[] = mysqli_real_escape_string($con,$pname[$i]['title']);
$p[] = $pname[$i]['pid'];
$w[] = $pname[$i]['weight'];
$pp[] = $pname[$i]['cost'];
$q[] = $pname[$i]['qty'];
}
$pname = implode('$;',$e);
$pid = implode('$;',$p);
$ptype = implode('$;',$w);
$pprice = implode('$;',$pp);
$qty = implode('$;',$q);

$con->query("insert into orders(`oid`,`uid`,`pname`,`pid`,`ptype`,`pprice`,`ddate`,`timesloat`,`order_date`,`status`,`qty`,`total`,`p_method`,`address_id`,`tax`,`tid`,`cou_amt`,`coupon_id`,`wal_amt`)values('".$oid."',".$uid.",'".$pname."','".$pid."','".$ptype."','".$pprice."','".$ddate."','".$timesloat."','".$timestamp."','".$status."','".$qty."',".$total.",'".$p_method."',".$address_id.",".$tax.",'".$tid."',".$cou_amt.",".$coupon_id.",".$wal_amt.")");

$con->query("update user set wallet=wallet-".$wal_amt." where id=".$uid."");

$returnArr = array("ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Order Placed Successfully!!!");
}

echo json_encode($returnArr);