<!DOCTYPE html>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

<title>HyperTrac</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Profile Pic Style -->
<style>
.propic .image {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.propic .middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
}

.propic .container:hover .image {
	opacity: 0.3;
}

.propic .container:hover .middle {
	opacity: 1;
}

.propic .text {
	/* background-color: #3b5998; */
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}
</style>

</head>

<body id="page-top">
	<%
		int dept = Integer.parseInt(request.getParameter("dept"));
		int generateDeptId = Integer.parseInt(session.getAttribute("reportGenerateDept").toString());
		String redirectUrl = "";
		if (generateDeptId == 1) {
			redirectUrl = "Staff/";
		} else if (generateDeptId == 2) {
			redirectUrl = "Major/";
		} else if (generateDeptId == 3) {
			redirectUrl = "Admin/";
		}
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<small><i class="fas fa-walking"></i></small>
				</div>
				<div class="sidebar-brand-text mx-3">
					Hyper<sup>Trac</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="../logout.jsp">
					<i class="fas fa-fw fa-chart-area"></i> <span>Logout</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<form action="downloadReport.jsp" method="post">
						<input type="hidden" name="dept" value="<%=dept%>" /> <input
							type="submit" value="Download Report" class="btn btn-primary" />
					</form>

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

				</nav>

				<%
					if (request.getParameter("status") != null) {
						String status = request.getParameter("status");
						if (status.equals("success")) {
				%>
				<div class="alert alert-success alert-dismissible fade show">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Success!</strong> Updated your details.
				</div>
				<%
					} else if (status.equals("failed")) {
				%>
				<div class="alert alert-danger alert-dismissible fade show">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Failed!</strong> Unable to Update.
				</div>
				<%
					}
					}
				%>
				<!-- End of Topbar -->
				<div class="row">
					<div class="col-sm-3">
						&nbsp;<a href="<%=redirectUrl %>" class="btn btn-primary btn-sm">Back
							To Dashboard</a>
					</div>
					<div class="col-sm-12 text-center card">
						<br />
						<%
							Connection con = database.getConnection();
							PreparedStatement ps = null;
							String sql = "";
							Helper helper = new Helper();
							String stat[] = helper.getAppStatus();

							if (dept == 0 || dept == 4) {
								sql = "SELECT * FROM auth WHERE role=?";
							} else {
								sql = "SELECT * FROM applications_comment WHERE role=?";
							}
							ps = con.prepareStatement(sql);
							ps.setInt(1, dept);
							ResultSet rs = ps.executeQuery();
							if (dept == 0 || dept == 4) {
						%>
						<table class='table table-responsive'>
							<tr>
								<td>App ID</td>
								<td>Name/No.</td>
								<td>Subject</td>
								<td>Submitted On</td>
								<td>Status</td>
							</tr>
							<%
								while (rs.next()) {
										int userId = rs.getInt(1);
										String sql2 = "SELECT * FROM applications WHERE app_by=?";
										PreparedStatement ps2 = con.prepareStatement(sql2);
										ps2.setInt(1, userId);
										ResultSet rs2 = ps2.executeQuery();
										while (rs2.next()) {
							%>
							<tr>
								<td><%=rs2.getInt(1)%></td>
								<td><%=rs2.getString(2)%></td>
								<td><%=rs2.getString(4)%></td>
								<td><%=rs2.getString(5)%></td>
								<td><%=stat[rs2.getInt(7)]%></td>
							</tr>
							<%
								}
									}
							%>
						</table>
						<%
							} else {
						%>
						<table class='table table-responsive'>
							<tr>
								<td>App ID</td>
								<td>Dept Assigned</td>
								<td>Comment</td>
								<td>By</td>
								<td>On</td>
								<td>Status</td>
							</tr>
							<%
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getInt(2)%></td>
								<td><%=helper.getDeptById(rs.getInt(3))%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=helper.getNameById(rs.getInt(5))%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=stat[rs.getInt(8)]%></td>
							</tr>
							<%
								}
							%>
						</table>
						<%
							}
						%>

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
				<span>Copyright &copy; Preatech.com</span>
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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<%
		con.close();
	%>

</body>

</html>
