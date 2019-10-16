<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
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

<title>HyperTrac</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<small> <i class="fas fa-walking"></i>
					</small>
				</div>
				<div class="sidebar-brand-text mx-3">
					Reset<sup>Now</sup>
				</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%-- <jsp:include page="User/topbar.jsp"></jsp:include> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="bg-white mb-4">
						<div class="text-center">
							<img src="../img/logo.png" style="width: 150px; height: 40px;" />
						</div>
					</div>

					<div class="text-center">
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<%
							String hash = request.getParameter("q");
							String email = request.getParameter("email");
							String sql = "SELECT id FROM auth WHERE email=? AND reset_hash=?";
							Connection con = database.getConnection();
							PreparedStatement ps = con.prepareStatement(sql);
							ps.setString(1, email);
							ps.setString(2, hash);
							ResultSet rs = null;
							rs = ps.executeQuery();
							int id = 0;
							if(rs.next()) {
								id = rs.getInt(1);								
							}
							if(id > 0) { %>
								<h4 class="text-info text-center">Reset Password</h4>
								<form action="resetPwd_2.jsp" method="post"
									onsubmit="return validatePwd()">
									<input type="hidden" name="id" value="<%=id%>" />
									<table class="table">
										<tr>
											<td>New Password</td>
											<td><input type="password" name="pwd" id="pwd"
												class="form-control" /></td>
										</tr>
										<tr>
											<td>Confirm Password</td>
											<td><input type="password" name="cpwd" id="cpwd"
												class="form-control" /></td>
										</tr>
										<tr>
											<td colspan="2"><input type="submit"
												class="btn btn-primary" value="Update" /></td>
										</tr>
									</table>
								</form>
								<% } else { %>
								<h4 class="text-danger" style="margin-top: 100px;">Request
									Expired / Invalid Details Supplied</h4>
								<%} %>





							</div>
							<div class="col-sm-3"></div>
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


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<script>
		function validatePwd() {
			var newPwd = $("#pwd").val();
			var confPwd = $("#cpwd").val();
			if(newPwd!==confPwd) {
				alert("Passwords Doesn't match");
				return false;
			}
			if(newPwd.length < 6) {
				alert("New Password Should be atleast 6 characters length");
				return false;
			}
			return true;
		}
	</script>
</body>

</html>
