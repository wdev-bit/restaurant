<?php 
require 'db.php';
$sel = $con->query("select * from seller");
$p = array();
while($row = $sel->fetch_assoc())
{
    $myarray['id'] = $row['id'];
    $myarray['name'] = $row['sname'];
    $myarray['logo'] = $row['slogo'];
    $myarray['banner'] = $row['sbanner'];
    $myarray['rating'] = $row['rating'];
	$p[] = $myarray;
}
$returnArr = array("data"=>$p,"ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Seller Founded!");
echo json_encode($returnArr);
?>

