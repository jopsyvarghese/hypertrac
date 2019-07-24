<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>HyperTrac Application Status</title>

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
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<jsp:include page="header.jsp"></jsp:include>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="bg-white mb-4">
						<div class="text-center">
							<img src="../../img/logo.png" style="width: 150px; height: 40px;" />
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-12 mb-4">
							<h4 class="text-center">STATUS</h4>
							<hr />
							<div class="card-header bg-white">
								<div class="row">

									<div class="col-sm-2">
										<small>Status</small>
									</div>
									<div class="col-sm-8">
										<small>Details</small>
									</div>
									<div class="col-sm-2">
										<small>Last Updated</small>
									</div>
									<hr />


									<div class="col-sm-2">
										<small> <strong
											class="rounded-pill bg-primary text-white"
											style="padding: 2px 4px;"> Acknowledged </strong>
										</small>
									</div>
									<div class="col-sm-8">
										<small> Department 1 / Receiver: Sanal Kumar
											(Asst.Engineer) / sanalkumar@gmail.com </small>
									</div>
									<div class="col-sm-2">
										<small>25 May 2019</small>
									</div>
									<div class="col-sm-5"></div>
									<div class="col-sm-2">
										<span class="fa fa-angle-down"></span>
									</div>
									<div class="col-sm-5"></div>



									<div class="col-sm-2">
										<small> <strong
											class="rounded-pill bg-warning text-white"
											style="padding: 2px 4px;"> Processing </strong>
										</small>
									</div>
									<div class="col-sm-8">
										<small> Department 5 / Receiver: Sam Jacob (Asst.CMO)
											/ samjacob@gmail.com </small>
									</div>
									<div class="col-sm-2">
										<small>01 June 2019</small>
									</div>
									<div class="col-sm-5"></div>
									<div class="col-sm-2">
										<span class="fa fa-angle-down"></span>
									</div>
									<div class="col-sm-5"></div>




									<div class="col-sm-2">
										<small> <strong
											class="rounded-pill bg-success text-white"
											style="padding: 2px 4px;"> Completed </strong>
										</small>
									</div>
									<div class="col-sm-8">
										<small> Department 5 / Receiver: Sam Jacob (Asst.CMO)
											/ samjacob@gmail.com </small>
									</div>
									<div class="col-sm-2">
										<small>03 June 2019</small>
									</div>


								</div>
							</div>
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
