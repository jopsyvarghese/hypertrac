<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
						int id = 0;
						int invitationStatus = 0;
						int docSubmit = 0;
						int ofcVisit = 0;
						int extraDocsRequired = 0;
						String extraDocs = "";
						id = Integer.parseInt(request.getParameter("id"));
						invitationStatus = Integer.parseInt(request.getParameter("invitationStatus"));
						docSubmit = Integer.parseInt(request.getParameter("docSubmit"));
						ofcVisit = Integer.parseInt(request.getParameter("ofcVisit"));
						extraDocsRequired = Integer.parseInt(request.getParameter("extraDocsRequired"));
						extraDocs = request.getParameter("extraDocs");
						//Checking the invitation details already there or not in invitation table
						String sql = "SELECT status FROM invitation WHERE app_id="+id;
						Connection con = database.getConnection();
						Statement st = null;
						st = con.createStatement();
						ResultSet rs = null;
						rs = st.executeQuery(sql);
						try {
							if(rs.next()) {
								//UPDATE
								String updateQ = "UPDATE invitation SET status=?,docs_submitted=?,ofc_visited=?,extra_docs_required=?,extra_docs=? WHERE app_id=?";
								PreparedStatement updatePs = con.prepareStatement(updateQ);
								updatePs.setInt(1, invitationStatus);
								updatePs.setInt(2, docSubmit);
								updatePs.setInt(3, ofcVisit);
								updatePs.setInt(4, extraDocsRequired);
								updatePs.setString(5, extraDocs);
								updatePs.setInt(6, id);
								updatePs.executeUpdate();
							} else {
								//INSERT 
								String updateQ = "INSERT INTO invitation(app_id,status,docs_submitted,ofc_visited,extra_docs_required,extra_docs) VALUES(?,?,?,?,?,?)";
								PreparedStatement updatePs = con.prepareStatement(updateQ);
								updatePs.setInt(1, id);
								updatePs.setInt(2, invitationStatus);
								updatePs.setInt(3, docSubmit);
								updatePs.setInt(4, ofcVisit);
								updatePs.setInt(5, extraDocsRequired);
								updatePs.setString(6, extraDocs);
								updatePs.executeUpdate();
							}
							out.print("<h4 style='color:green'>Updated Successfully</h4>");
						} catch(SQLException se) {
							se.getLocalizedMessage();
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
