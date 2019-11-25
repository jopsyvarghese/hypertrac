<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.ResultSet"%>
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

		Helper helper = new Helper();
		Connection con = database.getConnection();
		Statement st = null;
		st = con.createStatement();
		String sql = "SELECT id, dname FROM dept WHERE mc_id=" + loggedId;
		ResultSet rs = st.executeQuery(sql);
		ResultSet rs1 = helper.getRoleByMcId(loggedId);
		String firstName = "";
		String lastName = "";
		String userName = "";
		String email = "";
		String status = "";
		String pwd = "";
		String phone = "";
		String dob = "";

		if (request.getParameter("firstName") != null && request.getParameter("firstName") != "") {
			firstName = request.getParameter("firstName");
			lastName = request.getParameter("lastName");
			userName = request.getParameter("userName");
			email = request.getParameter("email");
			pwd = request.getParameter("pwd");
			phone = request.getParameter("phone");
			dob = request.getParameter("dob");
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
						<div class="col-lg-2 mb-4">
							<small class="pull-left"> <a href="manageStaff.jsp"><i
									class="fa fa-arrow-left" aria-hidden="true"></i></a>
							</small>
						</div>
						<div class="col-lg-8 mb-4">
							<h3 class="text-info text-center">Staff Registration</h3>
							<br />

							<%
								if (request.getParameter("status") != null) {
									status = request.getParameter("status");
									if (status.equals("success")) {
							%>
							<div class="alert alert-success alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<strong>Success!</strong> Added Successfully.
							</div>
							<%
								} else if (status.equals("failed")) {
							%>
							<div class="alert alert-danger alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<strong>Failed!</strong> Username or Email Already Taken .
							</div>
							<%
								}
								}
							%>

							<form action="addStaff_2.jsp" method="post"
								onsubmit="return passwordCheck()">
								<table class="table">
									<tr>
										<th>First Name</th>
										<td><input type="text" name="firstName"
											class="form-control" value="<%=firstName%>" required/></td>
									</tr>
									<tr>
										<th>Last Name</th>
										<td><input type="text" name="lastName"
											class="form-control" value="<%=lastName%>" /></td>
									</tr>
									<tr>
										<th>User Name</th>
										<td><input type="text" name="userName"
											class="form-control" value="<%=userName%>" required /></td>
									</tr>
									<tr>
										<th>Department</th>
										<td><select name="dept" id="dept" class="form-control"
											onchange="return loadSub()">
												<option value="0">Select Department</option>
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
										</select></td>
									</tr>

									<tr>
										<th>Sub Department</th>
										<td><select name="subDept" class="form-control">
												<option value="0">Select Sub Department</option>
												<optgroup label="" id="subCatData"></optgroup>
										</select></td>
									</tr>

									<tr>
										<th>Position</th>
										<td><select name="position" class="form-control">
												<option value="0">Select Position</option>
												<%
													while (rs1.next()) {
												%>
												<option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2)%></option>
												<%
													}
												%>

										</select></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" name="email" class="form-control"
											value="<%=email%>" required/></td>
									</tr>
									<tr>
										<th>Phone</th>
										<td><input type="number" name="phone"
											class="form-control" value="<%=phone%>" required/></td>
									</tr>
									<tr>
										<th>Date Of Birth</th>
										<td><input type="date" name="dob" class="form-control"
											required value="<%=dob%>" required/></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" name="pwd" id="pwd"
											class="form-control" value="<%=pwd%>" required/></td>
									</tr>
									<tr>
										<th>Confirm Password</th>
										<td><input type="password" name="cpwd" id="cpwd"
											class="form-control" value="<%=pwd%>" /></td>
									</tr>
									<tr>
										<th colspan="2" class="text-center">
											<button class="btn btn-success">
												<span class="fa fa-plus-circle"></span> Register Now
											</button>
										</th>
									</tr>
								</table>
							</form>
						</div>
						<div class="col-lg-2 mb-4"></div>
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
		function loadSub() {
			var deptId = document.getElementById("dept").value;
			$("#subCatData").load("subDept.jsp?dept=" + deptId);
		}
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
