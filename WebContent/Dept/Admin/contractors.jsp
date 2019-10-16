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

		Connection con = database.getConnection();
		String sql = "SELECT * FROM auth WHERE role = 0";
		Statement st = null;
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
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
						<!-- <a href="createContractor.jsp" class="btn btn-primary">Create
							Contractor <span class="fa fa-plus-circle"></span>
						</a> -->
						<h3 class="text-info">Contractors Portal</h3>
						<br />

						<table class="table table-hover table-bordered">
							<tr class="table-warning">
								<th>Sl.No</th>
								<th>Name</th>
								<th>Address</th>
								<th>Email</th>
								<th>Phone No.</th>
								<th>Operation</th>
							</tr>
							<%
								int i = 1;
								while (rs.next()) {
							%>
							<form action="deleteContractor.jsp" method="get">
								<input type="hidden" name="id" value="<%=rs.getInt(1) %>" /> <input
									type="hidden" name="redirect" value="contractors.jsp" />
								<tr>
									<td><%=i%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(7)%></td>
									<td>
										<%
								//Check Status
								int status = rs.getInt(16);
								String btnColor = "btn-outline-danger";
								String toggleStatus = "fa-toggle-off";
								if(status == 1) {
									btnColor = "btn-outline-success";
									toggleStatus = "fa-toggle-on";
								}
								%> <a
										href="../enableDisable.jsp?id=<%=rs.getInt(1) %>&redirect=Admin/contractors.jsp"
										class="btn <%=btnColor %> btn-sm"> <i
											class="fas <%=toggleStatus %>"></i>
									</a>
										<button class="btn btn-outline-danger btn-sm"
											onclick="return Confirm();">
											<span class="fa fa-trash"></span>
										</button>
									</td>
								</tr>
							</form>
							<%
								i++;
								}
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
	<script>
	function Confirm() {
		var r = confirm("Are you sure you want to delete this user? ");
		if (r == true) {
		  return true;
		} else {
		  return false;
		}
	}
</script>
</body>

</html>
