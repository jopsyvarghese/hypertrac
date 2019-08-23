<!DOCTYPE html>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
							int id = Integer.parseInt(request.getParameter("id"));
							String comments = request.getParameter("comments");
							int dept = Integer.parseInt(request.getParameter("dept"));
							int status = 0;
							status = Integer.parseInt(request.getParameter("status"));
							int staffTo = 0;
							staffTo = Integer.parseInt(request.getParameter("staff"));
							HttpSession sess = request.getSession();
							int userId = (int) sess.getAttribute("loggedInUserId");
							int role = (int) sess.getAttribute("loggedInUserRole");
							String currentTime = helper.getDateTime();
							String sql = "INSERT INTO applications_comment SET app_id=?, dept_assigned=?, comment=?, comment_by=?, role=?, commented_on=?, status=?, staff_assigned=?";
							Connection con = database.getConnection();
							PreparedStatement ps = con.prepareStatement(sql);
							ps.setInt(1, id);
							ps.setInt(2, dept);
							ps.setString(3, comments);
							ps.setInt(4, userId);
							ps.setInt(5, 0);
							ps.setString(6, currentTime);
							ps.setInt(7, status);
							ps.setInt(8, staffTo);
							int i = ps.executeUpdate();

							if (i > 0) {
								String query = "UPDATE applications SET dept = ? WHERE id = ?";
								PreparedStatement ps1 = con.prepareStatement(query);
								ps1.setInt(1, dept);
								ps1.setInt(2, id);
								int j = ps1.executeUpdate();
								if(j > 0) {
									out.println("<h4 class='text-success'>Assigned to Department Successfully</h4>");	
								} else {
									out.println("<h4 class='text-danger'>Sorry! Unable to Update</h4>");
								}
								
							} else {
								out.println("<h4 class='text-danger'>Sorry, Unable to Update</h4>");
							}
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
