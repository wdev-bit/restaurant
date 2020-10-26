<?php 
  require 'include/header.php';
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

<section id="dom">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Transactions List</h4>
                </div>
                <div class="card-body collapse show">
                    <div class="card-block card-dashboard">
                       
                        <table class="table table-striped table-bordered dom-jQuery-events">
                            <thead>
                                <tr>
								    <th>Trx ID</th>
                                    <th>Customer Name</th>
                                    <th>Amount</th>
                                    <th>Fess</th>
                                    <th>Reference</th>
                                    <th>Payment Method</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $sel = $con->query("select transactions.*, user.name from transactions left join user on transactions.user_id = user.id");
                                $i=0;
                                while($row = $sel->fetch_assoc())
                                {
                                    $i= $i + 1;
                                ?>
                                <tr>
                                    <td><?php echo $row['trx_id'];?></td>
                                    <td><?php echo $row['name']; ?></td>
                                    <td><?php echo number_format(($row['amount']/100),2); ?></td>
                                    <td><?php echo number_format(($row['fees']/100),2); ?></td>
                                    <td><?php echo $row['reference']; ?></td>
                                    <td><?php echo $row['channel']; ?></td>
                                    <td class="text-capitalize"><?php echo $row['status']; ?></td>
                                    <td><?php echo $row['date']; ?></td>
                                </tr>
                               <?php } ?>
                            </tbody>
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php 
if(isset($_GET['dele']))
{
$con->query("delete from timeslot where id=".$_GET['dele']."");
?>
	 <script type="text/javascript">
  $(document).ready(function() {
    toastr.options.timeOut = 4500; // 1.5s

    toastr.error('Selected Timeslot Deleted Successfully.');
    setTimeout(function()
	{
		window.location.href="tlist.php";
	},1500);
  });
  </script>
  <?php
}
?>



          </div>
        </div>

      

      </div>
    </div>
   
   <?php 
  require 'include/js.php';
  ?>

  </body>


</html>