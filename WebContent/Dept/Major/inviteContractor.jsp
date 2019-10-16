<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
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
		Helper helper = new Helper();
		int loggedId = 0;
		try {
			if (session.getAttribute("loggedInUserId") == null) {
	%>
	<script>
		window.location = "../../logout.jsp"
	</script>
	<%
		}
			loggedId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		} catch (NullPointerException ne) {
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

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-12 mb-4">
							<h3>
								<div class="text-center text-info">Invitation to
									Contractor/Individual</div>
							</h3>
							<br />
							<table
								class="table table-hover table-responsive-lg table-bordered">
								<tr class="table-warning">
									<th>Sl. No</th>
									<th>Application ID/Name</th>
									<th>Invitation Status</th>
									<th>Document Submitted</th>
									<th>Office Visited</th>
									<th>Extra Documents</th>
									<th>Update Status</th>
								</tr>

								<%
									//GET all dept ID's
									String deptQ = "SELECT id FROM dept where mc_id=" + loggedId;
									Connection con = database.getConnection();
									Statement st = null;
									ResultSet rs = null;
									st = con.createStatement();
									rs = st.executeQuery(deptQ);
									int i = 1;
									int appId = 0;
									ArrayList<Integer> rowValues = new ArrayList<Integer>();
									while (rs.next()) {
										rowValues.add(rs.getInt(1));
									}

									for (int object : rowValues) {
										String sql = "SELECT id FROM applications WHERE dept=" + object;
										ResultSet rs1 = null;
										Statement st1 = con.createStatement();
										rs1 = st1.executeQuery(sql);
										while (rs1.next()) {
											appId = rs1.getInt(1);
								%>
								<tr>
									<td><%=i%></td>
									<td><a href="viewApplication.jsp?id=<%=appId%>"><%=appId%></a></td>
									<%
										String invitationQ = "SELECT * FROM invitation WHERE app_id=" + appId;
												Statement st3 = con.createStatement();
												ResultSet rs3 = st.executeQuery(invitationQ);
												if (rs3.next()) {
									%>
									<td>
										<% if(rs3.getInt(2) == 1){  %> <span
										class="fa fa-check-circle text-success"></span> <% } else {%> <a
										href="inviteUser.jsp?id=<%=appId %>"
										class="btn btn-warning btn-sm">Invite</a> <% } %>
									</td>

									<td>
										<% if(rs3.getInt(3) == 1){  %> <span
										class="fa fa-check-circle text-success"></span> <% } else {%> <span
										class="fa fa-times-circle text-danger"></span> <% } %>
									</td>

									<td>
										<% if(rs3.getInt(4) == 1){  %> <span
										class="fa fa-check-circle text-success"></span> <% } else {%> <span
										class="fa fa-times-circle text-danger"></span> <% } %>
									</td>

									<td>
										<% if(rs3.getInt(5) == 1){  %> <span
										class="fa fa-check-circle text-success"></span> <% } else {%> <span
										class="fa fa-times-circle text-danger"></span> <% } %>
									</td>
									<%
										} else {
											%>
									<td><a href="inviteUser.jsp?id=<%=appId %>"
										class="btn btn-warning btn-sm">Invite</a></td>
									<td><span class="fa fa-times-circle text-danger"></span></td>
									<td><span class="fa fa-times-circle text-danger"></span></td>
									<td><span class="fa fa-times-circle text-danger"></span></td>
									<%	}
									%>
									<td><a href="updateStatus.jsp?id=<%=appId %>"
										class="btn btn-info btn-sm"> Update </a></td>
								</tr>
								<%
									i++;
										}

									}
								%>
							</table>
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
