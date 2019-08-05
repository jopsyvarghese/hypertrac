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
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException ne) {
			ne.printStackTrace();
		}
		String apQ = "SELECT * FROM applications WHERE id=?";
		String apMoreQ = "SELECT * FROM applications_more WHERE fk_id=?";
		Connection con = database.getConnection();
		PreparedStatement apPs = con.prepareStatement(apQ);
		PreparedStatement apMorePs = con.prepareStatement(apMoreQ);
		apPs.setInt(1, id);
		apMorePs.setInt(1, id);
		ResultSet rs = null;
		ResultSet rs2 = null;
		rs = apPs.executeQuery();
		rs2 = apMorePs.executeQuery();

		String name_or_no = "";
		int dept = 0;
		String subject = "";
		int app_by = 0;
		String company = "";
		String comp_addr = "";
		String phone = "";
		String phone2 = "";
		String email = "";
		String website = "";
		int buzz_type = 0;
		String doc_name = "";
		int major_client = 0;
		int sub_dept = 0;
		String rc = "";

		while (rs.next()) {
			name_or_no = rs.getString(2);
			dept = rs.getInt(3);
			subject = rs.getString(4);
			app_by = rs.getInt(8);
		}

		while (rs2.next()) {
			company = rs2.getString(3);
			comp_addr = rs2.getString(4);
			phone = rs2.getString(5);
			phone2 = rs2.getString(6);
			email = rs2.getString(7);
			website = rs2.getString(8);
			buzz_type = rs2.getInt(9);
			doc_name = rs2.getString(10);
			major_client = rs2.getInt(11);
			sub_dept = rs2.getInt(12);
		}
		rc = helper.getRc(app_by);
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
							<form action="updateHistory.jsp" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="id" value="<%=id%>" />
								<table class="table">
									<tr>
										<th>RC Number</th>
										<td><%=rc%></td>
									</tr>
									<tr>
										<th>Company Address</th>
										<td><%=company + ", " + comp_addr%></td>
									</tr>
									<tr>
										<th>Telephone No.</th>
										<td><%=phone%></td>
									</tr>
									<tr>
										<th>Telephone No.</th>
										<td><%=phone2%></td>
									</tr>
									<tr>
										<th>Email-id</th>
										<td><%=email%></td>
									</tr>
									<tr>
										<th>Website</th>
										<td><%=website%></td>
									</tr>
									<tr>
										<th>Type of Business</th>
										<td><%=helper.buzzType(buzz_type)%></td>
									</tr>
									<tr>
										<th>Document Name/Subject/ID</th>
										<td><%=doc_name%></td>
									</tr>
									<tr>
										<th>Name of Major client(s)</th>
										<td><%=helper.getMajorClient(major_client)%></td>
									</tr>
									<tr>
										<th>Sub-Department</th>
										<td><%=helper.getSubDept(sub_dept)%></td>
									</tr>
									<tr>
										<th>Upload Scanned Documents</th>
										<td><input type="file" name="docs" /></td>
									</tr>

								</table>
								<div class="text-center">
									<input type="submit" class="btn btn-danger" value="Ok" />
								</div>
							</form>

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
