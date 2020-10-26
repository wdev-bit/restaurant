<?php 
  require 'include/header.php';
  ?>
<?php 
$getkey = $con->query("select * from setting")->fetch_assoc();
define('ONE_KEY',$getkey['one_key']);
define('ONE_HASH',$getkey['one_hash']);
function resizeImage($resourceType,$image_width,$image_height,$resizeWidth,$resizeHeight) {
    // $resizeWidth = 100;
    // $resizeHeight = 100;
    $imageLayer = imagecreatetruecolor($resizeWidth,$resizeHeight);
    $background = imagecolorallocate($imageLayer , 0, 0, 0);
        // removing the black from the placeholder
        imagecolortransparent($imageLayer, $background);

        // turning off alpha blending (to ensure alpha channel information
        // is preserved, rather than removed (blending with the rest of the
        // image in the form of black))
        imagealphablending($imageLayer, false);

        // turning on alpha channel information saving (to ensure the full range
        // of transparency is preserved)
        imagesavealpha($imageLayer, true);
    imagecopyresampled($imageLayer,$resourceType,0,0,0,0,$resizeWidth,$resizeHeight, $image_width,$image_height);
    return $imageLayer;
}

function sendMessage($title){
		$content = array(
			"en" => 'New Product-'.$title
			);
		
		$fields = array(
			'app_id' => ONE_KEY,
			'included_segments' => array('Active Users'),
			'data' => array('type' =>1),
			'contents' => $content
		);
		
		$fields = json_encode($fields);
    	//print("\nJSON sent:\n");
    	//print($fields);
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
												   'Authorization: Basic '.ONE_HASH));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_POST, TRUE);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

		$response = curl_exec($ch);
		curl_close($ch);
		
		return $response;
	}
	
	function sendMessages($title){
		$content = array(
			"en" => 'Product-'.$title.'Updated'
			);
		
		$fields = array(
			'app_id' => ONE_KEY,
			'included_segments' => array('Active Users'),
			'data' => array('type' =>1),
			'contents' => $content
		);
		
		$fields = json_encode($fields);
    	//print("\nJSON sent:\n");
    	//print($fields);
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8',
												   'Authorization: Basic '.ONE_HASH));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_POST, TRUE);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

		$response = curl_exec($ch);
		curl_close($ch);
		
		return $response;
	}

?>

  <body data-col="2-columns" class=" 2-columns ">
       <div class="layer"></div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <div class="wrapper">


      <!-- main menu-->
      <!--.main-menu(class="#{menuColor} #{menuOpenType}", class=(menuShadow == true ? 'menu-shadow' : ''))-->
      <?php include('main.php'); ?>
      <!-- Navbar (Header) Ends-->

      <div class="main-panel">
        <div class="main-content">
          <div class="content-wrapper"><!--Statistics cards Starts-->

<?php 
if(isset($_GET['edit']))
{
    $selk = $con->query("select * from seller where id=".$_GET['edit']."")->fetch_assoc();
?>

<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title" id="basic-layout-form">Edit Seller</h4>
				</div>
				<div class="card-body">
					<div class="px-3">
						<form class="form" method="post" enctype="multipart/form-data">
							<div class="form-body">
							
								<div class="form-group">
									<label for="cname">Seller Name / Shop Name</label>
									<input type="text" id="sname" class="form-control"  value="<?php echo $selk['sname'];?>" name="sname" required>
                                </div>

                                <div class="form-group">
									<label for="slogo">Seller Logo</label>
                                    <input type="file" id="slogo" class="form-control" name="slogo"> <br>
                                    <label for="oslogo">Old Seller</label> <br>
                                    <img src="<?php echo $selk['slogo'];?>" id="oslogo" alt="" class="img img-fluid" style="border: 1px dashed #ccc; padding: 10px; width: 120px;"> 
                                </div>
                                
                                <div class="form-group">
									<label for="sbanner">Banner Image</label>
                                    <input type="file" id="sbanner" class="form-control" name="sbanner"> <br>
                                    <label for="osbanner">Old Banner Image</label> <br>
                                    <img src="<?php echo $selk['sbanner'];?>" id="osbanner" alt="" class="img img-fluid" style="border: 1px dashed #ccc; padding: 10px; width: 120px;"> 
								</div>
                                
                                <div class="form-group">
                                    <label for="saddress">Seller Address</label>
                                        <textarea class="form-control" name="saddress" placeholder="Enter Seller Address" required><?php echo $selk['saddress'];?></textarea>
                                    </div>
                                </div>
									
							</div>

							<div class="form-actions">
								
								<button type="submit" name="edit_product" class="btn btn-raised btn-raised btn-primary" style="margin-left: 23px;">
									<i class="fa fa-check-square-o"></i> Edit Product
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<?php
		if(isset($_POST['edit_product']))
		{
			// $data = $con->query("select * from product where id=".$_GET['edit']."")->fetch_assoc();
		    $sname = mysqli_real_escape_string($con,$_POST['sname']);
            $saddress = mysqli_real_escape_string($con,$_POST['saddress']);
            $timestamp = date("Y-m-d H:i:s");
            $sl = $con->query("select * from seller where id=".$_GET['edit']."")->fetch_assoc();
            $url = $sl['slogo'];
            $burl = $sl['sbanner'];
            // Seller Logo Upload Start
            if (file_exists($_FILES['slogo']['tmp_name']) || is_uploaded_file($_FILES['slogo']['tmp_name'])) 
            {
                unlink($sl['slogo']);
                $slogo = $_FILES['slogo']['tmp_name'];
                $sourceProperties = getimagesize($slogo);
                $resizeFileName = time();
                $uploadPath = "uploads/seller/logo/";
                $fileExt = pathinfo($_FILES['slogo']['name'], PATHINFO_EXTENSION);
                $uploadImageType = $sourceProperties[2];
                $sourceImageWidth = $sourceProperties[0];
                $sourceImageHeight = $sourceProperties[1];
                $new_width = $sourceImageWidth;
                $new_height = $sourceImageHeight;
                switch ($uploadImageType) {
                    case IMAGETYPE_JPEG:
                        $resourceType = imagecreatefromjpeg($slogo); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagejpeg($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                        break;
        
                    case IMAGETYPE_GIF:
                        $resourceType = imagecreatefromgif($slogo); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagegif($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                        break;
        
                    case IMAGETYPE_PNG:
                        
                        $resourceType = imagecreatefrompng($slogo); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagepng($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                        
                        break;
        
                    default:
                        $imageProcess = 0;
                        break;
                }
                $url = $uploadPath."thump_".$resizeFileName.".". $fileExt;
                // Seller Logo Upload End
            }

            if (file_exists($_FILES['sbanner']['tmp_name']) || is_uploaded_file($_FILES['sbanner']['tmp_name'])) 
            {
                unlink($sl['sbanner']);
                $sbanner = $_FILES['sbanner']['tmp_name'];
                $sourceProperties = getimagesize($sbanner);
                $resizeBanner = time();
                $uploadPathB = "uploads/seller/banner/";
                $fileExtB = pathinfo($_FILES['sbanner']['name'], PATHINFO_EXTENSION);
                $uploadImageType = $sourceProperties[2];
                $sourceImageWidth = $sourceProperties[0];
                $sourceImageHeight = $sourceProperties[1];
                $new_width = $sourceImageWidth;
                $new_height = $sourceImageHeight;
                switch ($uploadImageType) {
                    case IMAGETYPE_JPEG:
                        $resourceType = imagecreatefromjpeg($sbanner); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagejpeg($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                        break;
        
                    case IMAGETYPE_GIF:
                        $resourceType = imagecreatefromgif($sbanner); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagegif($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                        break;
        
                    case IMAGETYPE_PNG:
                        
                        $resourceType = imagecreatefrompng($sbanner); 
                        $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                        imagepng($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                        
                        break;
        
                    default:
                        $imageProcess = 0;
                        break;
                }
                $burl = $uploadPathB."thump_".$resizeBanner.".". $fileExtB;
            }
 
            $con->query("update seller set sname='".$sname."',saddress='".$saddress."',slogo='".$url."',sbanner='".$burl."' where id=".$_GET['edit']."");
		
		 
            // if($snoti == 1)
            // {
            //     $title = 'Product '.$pname.' Updated';
            //     sendMessages($pname);
            //     $timestamp = date("Y-m-d H:i:s");
            //     $url = 'no_url';
            //     $msg = "our Store Product Updated";
            //     $con->query("insert into noti(`msg`,`date`,`title`,`img`)values('".$msg."','".$timestamp."','".$title."','".$url."')");    
            // }
        
        
		?>
        
        <script type="text/javascript">
            $(document).ready(function() {
                toastr.options.timeOut = 4500; // 1.5s
                toastr.info('Seller Updated Successfully!!');
                setTimeout(function()
                {
                    window.location.href="sellerlist.php";
                },1500);
          });
        </script>

		<?php 
		
		}
		?>
	</div>

	<?php 
} 
else 
{
    ?>
    
    <div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title" id="basic-layout-form">Add Seller</h4>
				</div>
				<div class="card-body">
					<div class="px-3">
						<form class="form" action="#" method="post" enctype="multipart/form-data">
							<div class="form-body">
								
                                <div class="form-group">
									<label for="cname">Seller Name / Shop Name</label>
									<input type="text" id="sname" class="form-control" name="sname" required>
                                </div>

                                <div class="form-group">
									<label for="slogo">Seller Logo</label>
                                    <input type="file" id="slogo" class="form-control" name="slogo" required>
                                </div>
                                
                                <div class="form-group">
									<label for="sbanner">Banner Image</label>
									<input type="file" id="sbanner" class="form-control" name="sbanner" required>
								</div>
                                
                                <div class="form-group">
                                    <label for="saddress">Seller Address</label>
                                        <textarea class="form-control" name="saddress" placeholder="Enter Seller Address" required></textarea>
                                    </div>
                                </div>
								
							</div>

							<div class="form-actions">
								
								<button type="submit" name="add_seller" class="btn btn-raised btn-raised btn-primary" style="margin-left: 23px;">
									<i class="fa fa-check-square-o"></i> Save Seller
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<?php
		if(isset($_POST['add_seller']))
		{

        $sname = mysqli_real_escape_string($con,$_POST['sname']);
        $saddress = mysqli_real_escape_string($con,$_POST['saddress']);
        $timestamp = date("Y-m-d H:i:s");
        // Seller Logo Upload Start
        $slogo = $_FILES['slogo']['tmp_name'];
        $sourceProperties = getimagesize($slogo);
        $resizeFileName = time();
        $uploadPath = "uploads/seller/logo/";
        $fileExt = pathinfo($_FILES['slogo']['name'], PATHINFO_EXTENSION);
        $uploadImageType = $sourceProperties[2];
        $sourceImageWidth = $sourceProperties[0];
        $sourceImageHeight = $sourceProperties[1];
		$new_width = $sourceImageWidth;
        $new_height = $sourceImageHeight;
        switch ($uploadImageType) {
            case IMAGETYPE_JPEG:
                $resourceType = imagecreatefromjpeg($slogo); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagejpeg($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                break;

            case IMAGETYPE_GIF:
                $resourceType = imagecreatefromgif($slogo); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagegif($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                break;

            case IMAGETYPE_PNG:
                
                $resourceType = imagecreatefrompng($slogo); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagepng($imageLayer,$uploadPath."thump_".$resizeFileName.'.'. $fileExt);
                
                break;

            default:
                $imageProcess = 0;
                break;
        }
        // Seller Logo Upload End
        $sbanner = $_FILES['sbanner']['tmp_name'];
        $sourceProperties = getimagesize($sbanner);
        $resizeBanner = time();
        $uploadPathB = "uploads/seller/banner/";
        $fileExtB = pathinfo($_FILES['slogo']['name'], PATHINFO_EXTENSION);
        $uploadImageType = $sourceProperties[2];
        $sourceImageWidth = $sourceProperties[0];
        $sourceImageHeight = $sourceProperties[1];
		$new_width = $sourceImageWidth;
        $new_height = $sourceImageHeight;
        switch ($uploadImageType) {
            case IMAGETYPE_JPEG:
                $resourceType = imagecreatefromjpeg($sbanner); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagejpeg($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                break;

            case IMAGETYPE_GIF:
                $resourceType = imagecreatefromgif($sbanner); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagegif($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                break;

            case IMAGETYPE_PNG:
                
                $resourceType = imagecreatefrompng($sbanner); 
                $imageLayer = resizeImage($resourceType,$sourceImageWidth,$sourceImageHeight,$new_width,$new_height);
                imagepng($imageLayer,$uploadPathB."thump_".$resizeBanner.'.'. $fileExtB);
                
                break;

            default:
                $imageProcess = 0;
                break;
        }
        // Seller Logo Upload End
        $url = $uploadPath."thump_".$resizeFileName.".". $fileExt;
        $burl = $uploadPathB."thump_".$resizeBanner.".". $fileExtB;
		$con->query("insert into seller(`sname`,`saddress`,`slogo`,`sbanner`,`created_at`) values('".$sname."','".$saddress."','".$url."','".$burl."','".$timestamp."')");
	
		// if($snoti == 1)
		// {
		//     sendMessage($pname);
        //     $timestamp = date("Y-m-d H:i:s");
		//     $title = 'New Seller '.$pname.' Added';
		//     $url = 'no_url';
		//     $msg = "our Store New Product Inserted";
	    //     $con->query("insert into noti(`msg`,`date`,`title`,`img`)values('".$msg."','".$timestamp."','".$title."','".$url."')");
        // }
        
		?>
		<script type="text/javascript">
            $(document).ready(function() {
                toastr.options.timeOut = 4500; // 1.5s
                toastr.info('Seller Added Successfully!!');
            });
        </script>
		<?php 

		}
		?>
	</div>

<?php 

} 

?>


<script>
// Code to get duration of audio /video file before upload - from: http://coursesweb.net/

//register canplaythrough event to #audio element to can get duration
var f_duration =0;  //store duration
document.getElementById('audio').addEventListener('canplaythrough', function(e){
  //add duration in the input field #f_du
  f_duration = Math.round(e.currentTarget.duration);
  document.getElementById('f_du').value = f_duration;
  URL.revokeObjectURL(obUrl);
});

//when select a file, create an ObjectURL with the file and add it in the #audio element
var obUrl;
document.getElementById('f_up').addEventListener('change', function(e){
  var file = e.currentTarget.files[0];
  //check file extension for audio/video type
  if(file.name.match(/\.(avi|mp3|mp4|mpeg|ogg)$/i)){
    obUrl = URL.createObjectURL(file);
    document.getElementById('audio').setAttribute('src', obUrl);
  }
});
</script>



          </div>
        </div>

        

      </div>
    </div>
    
   <?php 
  require 'include/js.php';
  ?>
   
  
   <script>
   $(document).on('change','#cat_change',function()
	{
		var value = $(this).val();
		
		$.ajax({
			type:'post',
			url:'getsub.php',
			data:
			{
				catid:value
			},
			success:function(data)
			{
				$('#sub_list').html(data);
			}
		});
	});
	</script>
	
	<script>
$('#ptype').tagsinput('items');
$('#pprice').tagsinput('items');
</script>
  </body>


</html>