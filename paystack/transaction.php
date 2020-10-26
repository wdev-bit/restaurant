<?php

session_start();
require_once __DIR__.'/../include/dbconfig.php';
require_once __DIR__.'/vendor/autoload.php';
use Yabacon\Paystack;
use Yabacon\Paystack\MetadataBuilder;

$psec = $con->query("select cred_value as PAYSTACK_SECRET from payment_list where id = 3 and cred_title='PAYSTACK_SECRET'");
define('PAYSTACK_SECRET', $psec->fetch_assoc()['PAYSTACK_SECRET']);

if(isset($_GET['action']))
{
    $action = $_GET['action'];
    if($action == 'new-access-code')
    {
        if(isset($_GET['email']) && isset($_GET['amount']))
        {
            $email  = $_GET['email'];
            $amount = $_GET['amount'];
            $users = $con->query("select * from user where email = '$email'")->fetch_assoc();
            $_SESSION['user_id'] = $users['id'];
        }
        else
        {
            http_response_code(400);
            die('Invalid Email or amount sent');
        }
        $amountinkobo = 100 * $amount;
        $builder = new MetadataBuilder();
        $builder->withCustomField('Started From', 'sample charge card backend');
        time()%2 && $builder->withCustomFilters(['recurring'=>true]);
        $metadata = $builder->build();
        try{
            $paystack = new Paystack(PAYSTACK_SECRET);
            $paystack->disableFileGetContentsFallback();
            $trx = $paystack->transaction->initialize([
                'amount'=>$amountinkobo,
                'email'=>$email,
                'metadata'=>$metadata,
                'channels'=>array('card'),
                'callback_url'=>'https://pharmacy.angorabynayabchaudary.com/paystack/transaction.php'
            ]);

        } catch(Exception $e){
            http_response_code(400);
            die($e->getMessage());
        }
        
        echo json_encode($trx);
        
    }
}


function fetch_api($method, $url, $data){
    $curl = curl_init();
    switch ($method){
       case "POST":
          curl_setopt($curl, CURLOPT_POST, 1);
          if ($data)
             curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
          break;
       case "PUT":
          curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
          if ($data)
             curl_setopt($curl, CURLOPT_POSTFIELDS, $data);			 					
          break;
       default:
          if ($data)
             $url = sprintf("%s?%s", $url, http_build_query($data));
    }
    // OPTIONS:
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
       'Content-Type: application/json',
    ));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
    // EXECUTE:
    $result = curl_exec($curl);
    if(!$result){die("Connection Failure");}
    curl_close($curl);
    return $result;

}


if(isset($_GET['reference']))
{
    // whatever is after verify is our refernce
    $reference =$_GET['reference'];

    try{
        $paystack = new Paystack(PAYSTACK_SECRET);
        $paystack->disableFileGetContentsFallback();
        $trx = $paystack->transaction->verify([
            'reference'=>$reference,
        ]);
    } catch(Exception $e){
        http_response_code(400);
        die($e->getMessage());
    }

    if($trx->data->status === 'success'){
        $user_id        =   $_SESSION['user_id'];
        $trx_id         =   $trx->data->id;
        $reference      =   $trx->data->reference;
        $amount         =   $trx->data->amount;
        $channel        =   $trx->data->authorization->channel;
        $card_type      =   $trx->data->authorization->card_type;
        $bank           =   $trx->data->authorization->bank;
        $country_code   =   $trx->data->authorization->country_code;
        $currency       =   $trx->data->currency;
        $message        =   $trx->data->log->history[1]->message;
        $fees           =   $trx->data->fees;
        $status         =   $trx->data->status;
        $date           =   Date("Y-m-d H:i:s");
        
        $con->query("insert into transactions(`user_id`,`trx_id`,`reference`,`amount`,`channel`,`card_type`,`bank`,`country_code`,`currency`,`message`,`fees`,`status`,`date`) values('".$user_id ."','".$trx_id."','".$reference."','".$amount."','".$channel."','".$card_type."','".$bank."','".$country_code."','".$currency."','".$message."','".$fees."','".$status."','".$date."')");

        $_SESSION['amount'] = $amount;
        $_SESSION['trx_id'] = $trx_id;
        $_SESSION['status'] = $status;
        $_SESSION['method'] = $channel;
        $_SESSION['currency'] = $currency;
        $_SESSION['fees']   = $fees;

        header("location: transaction.php");
    }

}


?>
 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Successful!</title>
    <style>
        body,*{
            margin: 0;
            padding: 0;
        }
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        strong,p{
            font-size: 15px !important;
        }
        strong{
            font-weight: 700 !important;
        }
        b{
            font-weight: 600 !important;
        }
        p{
            font-weight: 400;
        }
        small{
            font-weight: 300;
            font-size: 10px !important;
        }
        .div-centered {
            text-align: left; 
            margin: auto; 
            max-width: 110px;
        }
    </style>
    <link rel="stylesheet" href="../app-assets/css/app.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="page-heading text-center mb-3">
                    <h4><b>Transaction Successful!</b></h4>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <i class="fa fa-check text-white bg-success fa-2x p-2 rounded-circle"></i>
                    </div>
                </div>
                <br>
                <div class="row px-2">
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6 text-right">
                        <div class="div-centered">
                            <strong>Amount</strong>
                        </div>
                        
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6 text-left">
                        <div class="div-centered">
                            <p><?php echo (number_format($_SESSION['amount'] / 100,2 ))." ".$_SESSION['currency']; ?></p>
                        </div>
                    </div>
                </div>
                <div class="row px-2">
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <strong>Fees</strong>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <p><?php echo (number_format($_SESSION['fees'] / 100,2))." ".$_SESSION['currency']; ?></p>
                        </div>
                    </div>
                </div>
                <div class="row px-2">
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <strong>Trx ID</strong>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <p class=""><?php echo $_SESSION['trx_id']; ?></p>
                        </div>
                    </div>
                </div>
                <div class="row px-2">
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <strong>Trx Status</strong>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                        <div class="div-centered">
                            <p class="text-capitalize"><?php echo $_SESSION['status']; ?></p>
                        </div>
                    </div>
                </div><br><br>
                <div class="row px-2">
                    <div class="col-md-12 col-sm-12 col-xs-12 col-12 text-center">
                        <small>You can close this page</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>