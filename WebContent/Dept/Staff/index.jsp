<!DOCTYPE html>
<%@page import="com.hypertrac.commons.Helper"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HyperTrac Staff</title>

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
	<%
		session.setAttribute("reportGenerateDept", 1);
		Helper helper = new Helper();
		int loggedId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		ResultSet rsCount = helper.getStatusCountOfApplicationsByStaffId(loggedId);
		
		int newOpen = 0;
		int inProgress = 0;
		int onHold = 0;
		int redirected = 0;
		int completed = 0;
		int totalCount = 0;		
		int newPercentage = 0;
		int inProgressPercentage = 0;
		int onHoldPercentage = 0;
		int redirectedPercentage = 0;
		int completedPercentage = 0;		
		
		if (rsCount.next()) {
			newOpen = rsCount.getInt(1);
			inProgress = rsCount.getInt(2);
			onHold = rsCount.getInt(3);
			redirected = rsCount.getInt(4);
			completed = rsCount.getInt(5);
			totalCount = rsCount.getInt(6);

			newPercentage = (newOpen * 100) / totalCount;
			inProgressPercentage = (inProgress * 100) / totalCount;
			onHoldPercentage = (onHold * 100) / totalCount;
			redirectedPercentage = (redirected * 100) / totalCount;
			completedPercentage = (completed * 100) / totalCount;
		}
	%>
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

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">
							Dashboard <small class="text-info"><i> / <%=helper.getDeptNameByStaffId(loggedId)%>
									/ <%=session.getAttribute("loggedInUserName").toString()%></i></small>
						</h1>
						<!-- <a href="../generateReport.jsp"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
					</div>

					<!-- Content Row -->

					<div class="row">
						<div class="col-md-1 col-lg-1"></div>
						<div class="col-md-10 col-lg-10">
							<div class="alert alert-success alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<small><%@include file="../lastLoggedIn.jsp"%></small>
							</div>
						</div>
						<div class="col-md-1 col-lg-1"></div>

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Performance
										Overview</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">My Dept. Applications Status</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
										<input id="newOpen" value="<%=newOpen %>" type="hidden" /> <input
											id="inProgress" value="<%=inProgress %>" type="hidden" /> <input
											id="onHold" value="<%=onHold %>" type="hidden" /> <input
											id="redirected" value="<%=redirected %>" type="hidden" /> <input
											id="completed" value="<%=completed %>" type="hidden" />
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-danger"></i> New/Open
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> In Progress
										</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
											On Hold
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-warning"></i> Redirected
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> Completed
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-6 mb-4">
							<!-- Project Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">My
										Dept. Tickets Status</h6>
								</div>
								<div class="card-body">
									<h4 class="small font-weight-bold">
										New / Open <span class="float-right"><%=newPercentage%>
											%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: <%=newPercentage%>%" aria-valuenow="20"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										In Progress <span class="float-right"><%=inProgressPercentage%>%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: <%=inProgressPercentage%>%" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										On Hold <span class="float-right"><%=onHoldPercentage%>%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar"
											style="width: <%=onHoldPercentage%>%" aria-valuenow="60"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Redirected<span class="float-right"><%=redirectedPercentage%>%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: <%=redirectedPercentage%>%" aria-valuenow="80"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<h4 class="small font-weight-bold">
										Completed<span class="float-right"><%=completedPercentage%>%</span>
									</h4>
									<div class="progress mb-4">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: <%=completedPercentage%>%" aria-valuenow="80"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6 mb-4">

							<!-- Illustrations -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Important
										Notifications</h6>
								</div>
								<div class="card-body">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 25rem;" src="../img/undraw_posting_photo.svg"
											alt="">
									</div>
									<p>
										This is a place where Admin will be sharing important
										notifications. Add some quality, svg illustrations to your
										project courtesy of, a constantly updated collection of
										beautiful svg images <br />that you can use completely free
										and without attribution!
									</p>
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
