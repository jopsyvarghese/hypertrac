<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HyperTrac</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">


	<!-- Payment Modal  -->
	<!-- <script src="../vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });
</script>

The Modal
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      Modal Header
      <div class="modal-header">
        <h4 class="modal-title">Please Pay your Bill</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      Modal body
      <div class="modal-body">
        You can pay your bill in monthly / quarterly / half yearly / Yearly by clicking on the below link
      </div>

      Modal footer
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</div> -->

	<!-- Payment Modal  -->

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="bg-white mb-4">
						<div class="text-center">
							<img src="../../img/logo.png" style="width: 150px; height: 40px;" />
						</div>
					</div>

					<div class="card">
						<div class="text-center">
						<br/>
							<h4 class="text-info">Please make your payment</h4>
							<strong>with any of the
								following options <i>Monthly, Quarterly, Half-Yearly, Yearly</i>
							</strong> <br /> <br />
							<form action="/action_page.php">
							
							<table class="table table-hover">
								<tr>
									<td>Full Name</td>
									<td><input type="text" class="form-control" id="name"></td>
								</tr>
								<tr>
									<td>Transaction Type</td>
									<td>
										<select name="txnType" class="form-control">
											<option value="0">Monthly($2 USD)</option>
											<option value="0">Quarterly($6 USD)</option>
											<option value="0">Half Yearly($12 USD)</option>
											<option value="0">Yearly($24 USD)</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Message (Optional)</td>
									<td><input type="text" class="form-control" id="msg"></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" class="form-control" id="name"></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" class="form-control" id="name"></td>
								</tr>
								<tr>
									<td></td>
									<td><text-area class="form-control" name="addr"></text-area></td>
								</tr>
								<tr>
									<td colspan="2">
									<button type="submit" class="btn btn-primary">Submit</button>
									</td>
								</tr>
							</table>								
							</form>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Preatech 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/chart-area-demo.js"></script>
	<script src="../js/demo/chart-pie-demo.js"></script>

</body>

</html>
