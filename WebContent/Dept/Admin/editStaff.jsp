<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.ResultSet"%>
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
		int id = Integer.parseInt(request.getParameter("id"));
		Helper helper = new Helper();
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		con = database.getConnection();
		int loggedId = 0;
		int mcId = 0;
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

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2" style="height: 40px;">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<jsp:include page="header.jsp"></jsp:include>
					</ul>
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
							<small class="pull-left"> <a href="staffs.jsp"><i
									class="fa fa-arrow-left" aria-hidden="true"></i></a>
							</small>
						</div>
						<div class="col-lg-8 mb-4">
							<h3 class="text-center">Edit Staff</h3>
							<%
								if (request.getAttribute("status") != null) {
							%>
							<div class="alert alert-danger alert-dismissible fade show">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<strong>Sorry! You Cannot Use this User name /Email ID</strong>
								Please type another one
							</div>
							<%
								}
								String sql = "SELECT * FROM auth WHERE id=?";
								String sql2 = "SELECT * FROM staff WHERE id=?";
								String sql3 = "SELECT id, dname FROM dept";
								PreparedStatement ps = con.prepareStatement(sql);
								PreparedStatement ps2 = con.prepareStatement(sql2);
								PreparedStatement ps3 = con.prepareStatement(sql3);
								ps.setInt(1, id);
								ps2.setInt(1, id);
								rs = ps.executeQuery();
								rs2 = ps2.executeQuery();
								rs3 = ps3.executeQuery();
							%>
							<form action="editStaff_2.jsp" method="post"
								onsubmit="return testFunction()">
								<table class="table">
									<%
										if (rs.next()) {
									%>

									<tr>
										<th>Name</th>
										<td><input type="text" name="firstName"
											class="form-control" value="<%=rs.getString(2)%>" /></td>
									</tr>
									<tr>
										<th>User Name</th>
										<td><input type="text" name="userName" id="userName"
											class="form-control" value="<%=rs.getString(4)%>" /><input
											type="hidden" name="id" value="<%=id%>" /></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" name="email" class="form-control"
											value="<%=rs.getString(6)%>" /></td>
									</tr>
									<tr>
										<th>Phone</th>
										<td><input type="number" name="phone"
											class="form-control" value="<%=rs.getString(7)%>" /></td>
									</tr>
									<%-- <tr>
										<th>Password</th>
										<td><input type="password" name="pwd"
											class="form-control" value="<%=rs.getString(5)%>" /></td>
									</tr>
									<tr>
										<th>Confirm Password</th>
										<td><input type="password" name="cpwd"
											class="form-control" value="<%=rs.getString(5)%>" /></td>
									</tr> --%>
									<%
										}

										if (rs2.next()) {
											rs4 = helper.getRoleByMcId(rs2.getInt(5));
									%>


									<tr>
										<th>Department</th>
										<td><select name="dept" id="dept" class="form-control" onchange="return loadSubDept()">
												<option value="0">Select Department</option>
												<%
													while (rs3.next()) {
															String selected = "";
															if (rs3.getInt(1) == rs2.getInt(2)) {
																selected = "selected='selected'";
															}
												%>
												<option value="<%=rs3.getInt(1)%>" <% //out.print(selected);%>><%=rs3.getString(2)%></option>
												<%
													}
												%>
										</select> <%-- <input type="text" name="dept" class="form-control"
											value="<%=helper.getDeptById(rs2.getInt(2)) %>" /> --%></td>
									</tr>
									<tr>
										<th>Sub Department</th>
										<td><select name="subDept" class="form-control">
												<optgroup label="Select Sub Department" id="subDeptData"></optgroup>
										</select></td>
									</tr>
									<tr>
										<th>Position</th>
										<td><select name="position" class="form-control">
												<option value="0">Select Position</option>
												<%
													while (rs4.next()) {
															String selected = "";
															if (rs4.getInt(1) == rs2.getInt(3)) {
																selected = "selected='selected'";
															}
												%>
												<option value="<%=rs4.getInt(1)%>" <%out.print(selected);%>><%=rs4.getString(2)%></option>
												<%
													}
												%>
										</select>
									</tr>
									<%
										}
									%>
									<tr>
										<th colspan="2" class="text-center">
											<button class="btn btn-success">
												<span class="fa fa-pen-square"></span> Update Staff
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
	function loadSubDept() {
		var dept = $("#dept").val();
		$("#subDeptData").load("../Major/subDept.jsp?dept="+dept);
	}
	</script>
</body>

</html>
