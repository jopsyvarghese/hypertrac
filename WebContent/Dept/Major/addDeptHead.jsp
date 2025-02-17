<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hypertrac.commons.Helper"%>
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
	<%
		int mcId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		Helper helper = new Helper();
		ArrayList<Integer> arr = helper.getStaffNamesByMcId(mcId);
		ResultSet rs = helper.getDeptByMcId(mcId);
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

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-12 mb-4">
							<small class="pull-left"> <a href="dept.jsp"><i
									class="fa fa-arrow-left" aria-hidden="true"></i></a>
							</small><br />
							<div class="text-center">
								<h3 class="text-info">Add Department Head</h3>
								<form action="addDeptHeadFinal.jsp" method="post">
									<table class="table table-hover table-responsive-lg">
										<tr>
											<th>Department Head</th>
											<td><select name="deptHead" class="form-control"
												required>
													<%
														for (int rowValues : arr) {
													%>
													<option value="<%=rowValues%>"><%=helper.getNameById(rowValues)%></option>
													<%
														}
													%>
											</select></td>
										</tr>
										<tr>
											<th>Department Name</th>
											<td><select name="dept" class="form-control"
												required>
													<%														
														while (rs.next()) {
													%>
													<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
													<% } %>
											</select></td>
										</tr>
									</table>
									<br />
									<button type="submit" class="btn btn-primary">
										<span class="fa fa-plus-circle"></span> &nbsp;Add
									</button>
								</form>
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
