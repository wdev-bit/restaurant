<?php 
require 'db.php';
$data = $_POST;
if($data['uid'] == "")
{
     $returnArr = array("ResponseCode"=>"401","Result"=>"false","ResponseMsg"=>"Something Went Wrong!");  
}
else
{
    $uid = $data['uid'];
    $card = $con->query("select * from user_detail where user_id='{$uid}'");
    $p = array();
    while($row = $card->fetch_assoc())
    {
        $myarray['id'] = $row['id'];
        $myarray['uid'] = $row['user_id'];
        $myarray['card_number'] = $row['card_holder_name'];
        $myarray['cvc'] = $row['cvc'];
        $myarray['expiry_month'] = $row['expiry_month'];
        $myarray['expiry_year'] = $row['expiry_year'];
        $myarray['access_code'] = $row['access_code'];
        $myarray['reference'] = $row['reference'];
    	$p[] = $myarray;
    }
    $returnArr = array("data"=>$p,"ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Card Founded!");
}
echo json_encode($returnArr);
?>

