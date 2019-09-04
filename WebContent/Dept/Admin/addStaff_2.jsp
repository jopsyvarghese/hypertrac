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
int loggedId = 0;
try {
	if(session.getAttribute("loggedInUserId") == null) {
		%>
		<script>window.location="../../logout.jsp"</script>
		<%
	}
	loggedId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());	
} catch(NullPointerException ne){}
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
						<div class="col-lg-3 mb-4"></div>
						<div class="col-lg-6 mb-4">
						<%
						Helper helper = new Helper();
						Connection con = null;
						int lastInsertedId = 0;
						ResultSet rs = null;
						String firstname = request.getParameter("firstName");
						String lastname = request.getParameter("lastName");
						int random = (int)(Math.random() * 50000 + 1);
						String username = request.getParameter("userName")+random;
						int dept = Integer.parseInt(request.getParameter("dept"));
						int subDept = Integer.parseInt(request.getParameter("subDept"));
						int position = Integer.parseInt(request.getParameter("position"));
						String email =  request.getParameter("email");
						Long phone =  Long.parseLong(request.getParameter("phone"));
						String pwd =  request.getParameter("pwd");					
						con = database.getConnection();
						
						String sql = "INSERT INTO auth(fname, addr, uname, pwd, email, mob, role, created_at, rc, mob2, created_by)" +
						"VALUES(?,?,?,?,?,?,?,?,?,?,?)";
						PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						ps.setString(1, firstname);
						ps.setString(2, "");
						ps.setString(3, username);
						ps.setString(4, pwd);
						ps.setString(5, email);
						ps.setLong(6, phone);
						ps.setInt(7, 1);
						ps.setString(8, helper.getDateTime());
						ps.setInt(9, 0);
						ps.setInt(10, 0);
						ps.setInt(11, Integer.parseInt(session.getAttribute("loggedInUserId").toString()));
						if (ps.executeUpdate() > 0) {
							rs = ps.getGeneratedKeys();
							if (rs.next()) {
								lastInsertedId = rs.getInt(1);
								String sql2 = "INSERT INTO staff(id, dept, position, sub_dept_id, mc_id) VALUES (?,?,?,?,?)";
								PreparedStatement ps2 = con.prepareStatement(sql2);
								ps2.setInt(1, lastInsertedId);
								ps2.setInt(2, dept);
								ps2.setInt(3, position);
								ps2.setInt(4, subDept);
								ps2.setInt(5, loggedId);
								if(ps2.executeUpdate() != 0){
									response.sendRedirect("staffs.jsp?status=success");
								} else {
									response.sendRedirect("staffs.jsp?status=failed");
								}
							} else {
								response.sendRedirect("staffs.jsp?status=failed");
							}
						} else {
							response.sendRedirect("staffs.jsp?status=failed");
						}
						%>
						
						
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
