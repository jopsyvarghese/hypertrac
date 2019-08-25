<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hypertrac.commons.Helper"%>
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
					<div class="text-center">
						<h3 class="text-info">Individual's Application</h3>
						<table class="table table-responsive-lg">
							<tr class="table-warning">
								<th>Sl.No</th>
								<th>Applicant Name/No.</th>
								<th>Major Client Name</th>
								<th>Submitted Date</th>
								<th>Status</th>
							</tr>
							<%
								Connection con = database.getConnection();
								Statement st = null;
								ResultSet rs = null;
								ResultSet rs2 = null;
								st = con.createStatement();
								int i = 1;
								String sql = "SELECT id FROM auth WHERE role=4";

								rs = st.executeQuery(sql);
								while (rs.next()) {
									String sql2 = "SELECT * FROM applications WHERE app_by=?";
									PreparedStatement ps = con.prepareStatement(sql2);
									ps.setInt(1, rs.getInt(1));
									rs2 = ps.executeQuery();
									while (rs2.next()) {
							%>
							<tr>
								<td><%=i%></td>
								<td><%=rs2.getString(2)%></td>
								<td><%=helper.getMajorClientByDeptId(rs2.getInt(3))%></td>
								<td><%=rs2.getString(5)%></td>
								<td><a href="viewApplication.jsp?id=<%=rs2.getString(1)%>"
									class="btn-sm btn-primary">View</a></td>
							</tr>
							<%
								i++;
									}
								}
								con.close();
							%>


						</table>
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
