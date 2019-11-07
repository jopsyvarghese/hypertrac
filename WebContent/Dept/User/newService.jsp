<!DOCTYPE html>
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
		int id = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		String rc = helper.getRc(id);
		ResultSet rs = helper.getBuzzType();
		ResultSet majorClients = helper.getMajorClients();
		int userRole = 0;
		String userContractorName = "Company (Contractor) Name";
		String address = "Company Address";
		userRole = Integer.parseInt(session.getAttribute("loggedInUserRole").toString());
		String phone2 = "";
		if (userRole == 4) {
			userContractorName = "Full Name";
			address = "Individual Address";
			phone2 = "Optional Number";
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
						<h4>Apply For New Service</h4>
						<br />
						<form action="createService.jsp" method="post"
							enctype="multipart/form-data">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td><%=userContractorName%></td>
										<td><input type="text" class="form-control"
											name="contractorName" /></td>
									</tr>
									<%
										if (userRole == 0) {
									%>
									<tr>
										<td>RC Number</td>
										<td><input type="text" class="form-control" name="rc"
											value="<%=rc%>" readonly="readonly" /></td>
									</tr>
									<%
										}
									%>
									<tr>
										<td><%=address%></td>
										<td><textarea class="form-control" name="addr"></textarea></td>
									</tr>
									<tr>
										<td>Telephone No.</td>
										<td><input type="number" class="form-control"
											name="phone" required="required" /></td>
									</tr>
									<tr>
										<td>Telephone No.</td>
										<td><input type="number" class="form-control"
											name="phone2" placeholder="<%=phone2%>" /></td>
									</tr>
									<tr>
										<td>Email-id</td>
										<td><input type="email" class="form-control" name="email"
											required="required" /></td>
									</tr>
									<tr>
										<td>Website</td>
										<td><input type="text" class="form-control"
											name="website" /></td>
									</tr>
									<%
										if (userRole == 0) {
									%>
									<tr>
										<td>Type of Business</td>
										<td><select name="buzzType" class="form-control">
												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
												<%
													}
												%>
										</select>
									</tr>
									<%
										}
									%>
									<tr>
										<td>Document Name/Subject/ID</td>
										<td><input type="text" class="form-control"
											name="docName" /></td>
									</tr>
									<tr>
										<td>Name of Major client(s)</td>
										<td><select name="majorClient" class="form-control"
											onchange="loadDept()" id="majorClient">
												<option value="0">Select Major Client</option>
												<%
													while (majorClients.next()) {
												%>
												<option value="<%=majorClients.getInt(1)%>"><%=majorClients.getString(2)%></option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td>Department</td>
										<td><select name="dept" id="dept" class="form-control"
											onchange="loadSub()">
												<option value="0">Select Department</option>
												<optgroup label="" id="catData"></optgroup>
										</select></td>
									</tr>
									<tr>
										<td>Sub-Department</td>
										<td><select name="subDept" class="form-control">
												<option value="0">Select Sub-Department</option>
												<optgroup label="" id="subCatData"></optgroup>
										</select></td>
									</tr>
									<tr>
										<td>Upload Scanned Documents :</td>
										<td><input type="file" class="form-control" name="file"
											multiple="multiple" /></td>
									</tr>
								</tbody>
							</table>
							<input type="submit" class="btn btn-success" />
						</form>
						<br /> <br />
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
		function loadDept() {
			var mcId = document.getElementById("majorClient").value;
			$("#catData").load("dept.jsp?mcId=" + mcId);
		}
		function loadSub() {
			var deptId = document.getElementById("dept").value;
			$("#subCatData").load("subDept.jsp?deptId=" + deptId);
		}
	</script>
</body>

</html>
