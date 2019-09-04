<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.commons.Helper"%>
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

					<div class="text-center">
						<%
							Helper helper = new Helper();
							String cName = request.getParameter("cName");
							String addr = request.getParameter("addr");
							String email = request.getParameter("email");
							Long phone = Long.parseLong(request.getParameter("phone"));
							String pwd = request.getParameter("pwd");
							String uname = request.getParameter("uname");
							String createdAt = helper.getDateTime().toString();

							String sql = "INSERT INTO auth(fname, addr, uname, pwd, email, mob, role, created_at, rc, mob2, created_by) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
							Connection con = null;
							con = database.getConnection();
							PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
							ps.setString(1, cName);
							ps.setString(2, addr);
							ps.setString(3, uname);
							ps.setString(4, helper.encryptPwd(pwd));
							ps.setString(5, email);
							ps.setLong(6, phone);
							ps.setInt(7, 2);
							ps.setString(8, createdAt);
							ps.setString(9, "");
							ps.setInt(10, 0);
							ps.setInt(11, Integer.parseInt(session.getAttribute("loggedInUserId").toString()));
							if (ps.executeUpdate() > 0) {
								ResultSet rs = null;
								rs = ps.getGeneratedKeys();
								if (rs.next()) {
									int authId = rs.getInt(1);
									if (authId > 0) {
										response.sendRedirect("majorClients.jsp?status=success");
									} else {
										response.sendRedirect("majorClients.jsp?status=failed");
									}
								}
							}
							con.close();
						%>
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
