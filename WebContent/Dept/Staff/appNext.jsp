<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="sun.security.util.Length"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
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
						<div class="col-lg-3 mb-4"></div>
						<div class="col-lg-6 mb-4">
							<form action="appAssign.jsp" method="post">
								<table class="table">
									<%
										String appId = "";
										String id = "";
										id = request.getParameter("id");
										appId = request.getParameter("appId");
									%>
									<tr>
										<th>Application Name/No</th>
										<td><%=appId%> <input type="hidden" name="id"
											value="<%=id%>" /></td>
									</tr>
									<tr>
										<th>Comments</th>
										<td><textarea class="form-control" name="comments"></textarea>
										</td>
									</tr>
									<tr>
										<th>Department</th>
										<td>
											<%
												Helper helper = new Helper();
												Connection con = database.getConnection();
												ResultSet rs = helper.getDept();
											%> <select name="dept"
											class="form-control">
												<option value="0">Select Department To Assign</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
										</select>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="text-center"><input type="submit"
											value="Assign Now" class="btn btn-danger" /></td>
									</tr>
								</table>
							</form>
						</div>
						<div class="col-lg-3 mb-4"></div>
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
