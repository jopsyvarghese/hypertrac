<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
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
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException ne) {
			ne.printStackTrace();
		}

		if (id == 0) {
			throw new Exception("Invalid Major Client");
		}

		String sql = "SELECT * FROM auth WHERE id=?";
		Connection con = null;
		con = database.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = null;
		rs = ps.executeQuery();
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
					<div class="col-sm-12">
						<small class="pull-left"> <a href="majorClients.jsp"><i
								class="fa fa-arrow-left" aria-hidden="true"></i></a>
						</small>
						<div class="text-center">
						<h3 class="text-info">Edit Major Client </h3><br/>
							<form action="editClient_2.jsp" method="post"
								onsubmit="return passwordCheck()">
								<%
									if (rs.next()) {
								%>
								<table class="table table-hover table-sm">
									<input type="hidden" name="id" value="<%=rs.getInt(1)%>" />
									<tr>
										<th>Major Client Name</th>
										<td><input type="text" class="form-control" name="fName"
											value="<%=rs.getString(2)%>" /></td>
									</tr>
									<tr>
										<th>Address</th>
										<td><textarea class="form-control" name="addr"><%=rs.getString(3)%></textarea>
										</td>
									</tr>
									<tr>
										<th>Email-id</th>
										<td><input type="email" class="form-control" name="email"
											value="<%=rs.getString(6)%>" /></td>
									</tr>
									<tr>
										<th>Telephone No.</th>
										<td><input type="number" class="form-control"
											name="phone" value="<%=rs.getString(7)%>" /></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											name="pwd" id="pwd" value="<%-- <%=rs.getString(5)%> --%>" /></td>
									</tr>
									<tr>
										<th>Confirm Password</th>
										<td><input type="password" class="form-control"
											name="cpwd" id="cpwd" value="<%-- <%=rs.getString(5)%> --%>" /></td>
									</tr>
								</table>
								<%
									}
								%>
								<button type="submit" class="btn btn-primary">
									<span class="fa fa-pencil-alt"></span>&nbsp; Update Client
								</button>
								<br /> <br />
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
					<a class="btn btn-primary" href="../../logout.jsp">Logout</a>
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
		function passwordCheck() {
			var newPwd = $("#pwd").val();
			var confPwd = $("#cpwd").val();
			if (newPwd !== confPwd) {
				alert("Passwords Doesn't match");
				return false;
			}
			if (newPwd.length < 6) {
				alert("New Password Should be atleast 6 characters length");
				return false;
			}
			return true;
		}
	</script>
</body>

</html>
