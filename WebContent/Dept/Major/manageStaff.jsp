<!DOCTYPE html>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
							<div class="text-center">

								<h3 class="text-info">Manage Staff</h3>
								<br /> <a href="addStaff.jsp" class="btn btn-primary btn-sm">
									<span class="fa fa-plus-circle"></span> New Staff
								</a>
							</div>
							<br />
							<table class="table table-hover table-bordered">
								<tr class="table-warning">
									<th>Sl.No</th>
									<th>Staff Name</th>
									<th>Department</th>
									<th>Position</th>
									<th>Email</th>
									<th>Phone No.</th>
									<th>Operation</th>
								</tr>
								<%
									String deptQ = "SELECT * FROM staff where mc_id=" + loggedId;
									Connection con = database.getConnection();
									Statement st = null;
									ResultSet rs = null;
									st = con.createStatement();
									rs = st.executeQuery(deptQ);
									int i = 1;
									int staffId = 0;
									String email = "";
									String mobile = "";
									String name = "";
									String deptName = "";
									String position = "";
									int status = 0;
									while (rs.next()) {
										staffId = rs.getInt(1);
										email = helper.getEmailById(staffId);
										mobile = helper.getPhoneById(staffId);
										name = helper.getNameById(staffId);
										deptName = helper.getDeptById(rs.getInt(2));
										position = helper.getPositionById(rs.getInt(3));
										String stQry = "SELECT state FROM auth WHERE id=" + staffId;
										Statement stm = null;
										stm = con.createStatement();
										ResultSet rst = stm.executeQuery(stQry);
										if (rst.next()) {
											status = rst.getInt(1);
										}
								%>
								<tr>
									<td><%=i%></td>
									<td><%=name%></td>
									<td><%=deptName%></td>
									<td><%=position%></td>
									<td><%=email%></td>
									<td><%=mobile%></td>
									<td><a href="editStaff.jsp?id=<%=staffId%>" class="btn btn-outline-primary btn-sm"><span
											class="fa fa-pen"></span></a> <%
 	//Check Status
 		String btnColor = "btn-outline-danger";
 		String toggleStatus = "fa-toggle-off";
 		if (status == 1) {
 			btnColor = "btn-outline-success";
 			toggleStatus = "fa-toggle-on";
 		}
 %> <a
										href="../enableDisable.jsp?id=<%=staffId%>&redirect=Major/manageStaff.jsp"
										class="btn <%=btnColor%> btn-sm"> <i
											class="fas <%=toggleStatus%>"></i>
									</a> <a href="deleteStaff.jsp?id=<%=staffId%>"
										onclick="return confirmDelete();" class="btn btn-sm btn-outline-danger"><span
											class="fa fa-trash-alt"></span></a></td>
								</tr>
								<%
									i++;
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

	<script>
		function confirmDelete() {
			var r = confirm("Are you sure you want to Delete? !");
			if (r == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>

</html>
