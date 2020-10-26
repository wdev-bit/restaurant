<?php 
require 'db.php';
if(isset($_GET['seller_id']))
{
    $sel = $con->query("select product.* , seller.sname from product left join seller on product.seller_id = seller.id WHERE product.seller_id='".$_GET['seller_id']."' order by product.id desc");
    $p = array();
    while($row = $sel->fetch_assoc())
    {
        $myarray['id'] = $row['id'];
        $myarray['product_name'] = $row['pname'];
        $myarray['product_image'] = $row['pimg'];
    	$myarray['product_related_image'] = $row['prel'];
        $myarray['seller_name'] = $row['sname'];
        $myarray['seller_id'] = $row['seller_id'];
        $myarray['short_desc'] = $row['psdesc'];
        $a = explode('$;',$row['pgms']);
        //print_r($a[0]);
        $ab = explode('$;',$row['pprice']);
        $k=array();
        for($i=0;$i<count($a);$i++)
        {
            $k[$i] = array("product_type"=>$a[$i],"product_price"=>$ab[$i]);
        }
        
        $myarray['price'] = $k;
        $myarray['stock'] = $row['stock'];
    	$myarray['discount'] = $row['discount'];
        
    	$p[] = $myarray;
    }
    $returnArr = array("data"=>$p,"ResponseCode"=>"200","Result"=>"true","ResponseMsg"=>"Products Founded!");
    echo json_encode($returnArr);   
}
else
{
    $returnArr = array("data"=>[],"ResponseCode"=>"200","Result"=>"false","ResponseMsg"=>"Invalid Request!");
    echo json_encode($returnArr);   
}
?>

