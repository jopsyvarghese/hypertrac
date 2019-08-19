<!DOCTYPE html>
<%@page import="com.hypertrac.commons.Helper"%>
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
		String sql = "SELECT id, fname FROM auth WHERE role=2";
		Connection con = database.getConnection();
		Statement st = null;
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		Helper helper = new Helper();
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
				<jsp:include page="topbar.jsp"></jsp:include>
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
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<h4 class="text-info">Chat With Customer Staff</h4>
								<br />
								<br />
								<form action="chatWithStaff_2.jsp" method="post"
									onsubmit="return formCheck()">
									<table>
										<tr>
											<td>Department</td>
											<td><select name="as" id="majorClient"
												class="form-control" onchange="return getStaffs()">
													<option>Select Department</option>
													<%
														while (rs.next()) {
													%>
													<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
													<% } %>
											</select></td>
										</tr>
										<tr>
											<td>Sub Department</td>
											<td><select name="sdf" id="staffs"
												class="form-control" onchange="return getStaffName()">
													<optgroup id="staffTeam">
														</option>
											</select></td>
										</tr>
										<tr>
											<td>Staff Name</td>
											<td><select name="staffId" id="staffId" class="form-control">
													<optgroup id="staffName"></optgroup>
											</select></td>
										</tr>
										<tr>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2">
												<button class="btn btn-primary">
													<span class="fa fa-comment"></span> Chat Now
												</button>
											</td>
										</tr>
									</table>
								</form>

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
		function getStaffs() {
			var deptId = document.getElementById("majorClient").value;
			$("#staffs").load("subDept.jsp?dept=" + deptId);
		}
		function getStaffName() {
			var staffId = document.getElementById("staffs").value;
			$("#staffName").load("staffDept.jsp?id=" + staffId);
		}

		function formCheck() {
			var majorClient = document.getElementById("majorClient").value;
			var staffs = document.getElementById("staffs").value;
			var staffId = document.getElementById("staffId").value;
			
			if(isNaN(majorClient) || majorClient == 0 ) {
				alert("Please Select Department");
				return false;
			}
			if(isNaN(staffs) || staffs == 0 ) {
				alert("Please select Sub-Department");
				return false;
			}
			if(isNaN(staffId) || staffId == 0 ) {
				alert("Please select Staff");
				return false;
			}
			
		}
	</script>
</body>

</html>
