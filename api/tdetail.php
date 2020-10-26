<?php 
require 'db.php';
if(isset($_GET['user_id']))
{
    $sel = $con->query("select transactions.* , user.name from transactions left join user on  transactions.user_id = user.id WHERE  transactions.user_id='".$_GET['user_id']."' order by  transactions.id desc");
    $p = array();
    while($row = $sel->fetch_assoc())
    {
        $myarray['id'] = $row['id'];
        $myarray['trx_id'] = $row['trx_id'];
        $myarray['reference'] = $row['reference'];
    	$myarray['amount'] = $row['amount'];
    	$myarray['fees'] = $row['fees'];
        $myarray['channel'] = $row['channel'];
        $myarray['currency'] = $row['currency'];
        $myarray['message'] = $row['message'];
        $myarray['status'] = $row['status'];
        $myarray['date'] = $row['date'];
        
    	$p[] = $myarray;
    }
    $returnArr = array("data"=>$p,"ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Transactions Founded!");
    echo json_encode($returnArr);   
}
else
{
    $returnArr = array("data"=>[],"ResponseCode"=>"200","Result"=>"false","ResponseMsg"=>"Invalid Request!");
    echo json_encode($returnArr);   
}
?>
