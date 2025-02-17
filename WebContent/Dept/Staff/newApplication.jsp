<!DOCTYPE html>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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

<title>HyperTrac Staff</title>

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
		Connection con = database.getConnection();
		int id = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		long rc = 0L;
		ResultSet rs = helper.getBuzzType();
		ResultSet majorClients = helper.getMajorClients();
		long rcSearch = 0L;
		String contractorName = "";
		String addr = "";
		Long phone = 0L;
		Long phone2 = 0L;
		String website = "";
		String email = "";
		int userId = 0;

		// Check RC Search for fetching user data
		if (request.getParameter("rcSearch") != null && request.getParameter("rcSearch") != "") {
			rcSearch = Long.parseLong(request.getParameter("rcSearch"));
			if (rcSearch > 0) {
				rc = rcSearch;
				userId = helper.getIdByRc(rc);
				if (userId > 0) {
					String rcQry = "SELECT company, comp_addr, phone, phone2, email, website FROM applications_more WHERE fk_id=(SELECT id FROM applications WHERE app_by=? ORDER BY id DESC limit 0,1) ORDER BY id DESC limit 0,1";
					PreparedStatement psQ = con.prepareStatement(rcQry);
					psQ.setInt(1, userId);
					ResultSet rsQ = null;
					rsQ = psQ.executeQuery();
					while (rsQ.next()) {
						contractorName = rsQ.getString(1);
						addr = rsQ.getString(2);
						phone = rsQ.getLong(3);
						phone2 = rsQ.getLong(4);
						email = rsQ.getString(5);
						website = rsQ.getString(6);
					}
				} else {
					out.println("<script>alert('Invalid RC Given')</script>");
				}
			}
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

					<div class="text-center">
						<h4 class="text-info">Apply For New Service</h4>
						<br />

						<!-- Auto fill Data With RC Number Search -->
						<div class="bg-white" style="padding: 20px">
							<form action="#" method="get">
								<small class="text-warning">Search With RC Number for
									Auto-Populating data</small><br /> <input type="text" name="rcSearch"
									class="form-control"
									placeholder="Type RC No. to Auto-Populate below details"
									style="width: 90%; float: left;" />
								<button type="submit" class="btn btn-primary">
									<span class="fa fa-search"></span>
								</button>
								<br /> <br />
							</form>
						</div>



						<form action="createService.jsp" method="post"
							enctype="multipart/form-data">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td>Company (Contractor) Name</td>
										<td><input type="text" class="form-control"
											name="contractorName" value="<%=contractorName%>" /></td>
									</tr>
									<tr>
										<td>RC Number</td>
										<td><input type="text" class="form-control" name="rc"
											value="<%=rc%>"/></td>
									</tr>
									<tr>
										<td>Company Address</td>
										<td><textarea class="form-control" name="addr"><%=addr%></textarea></td>
									</tr>
									<tr>
										<td>Telephone</td>
										<td><input type="number" class="form-control"
											name="countryCode" required="required"
											style="width: 30%; float: left;" placeholder="ISD Code" /> <input
											type="number" class="form-control" name="phone"
											required="required" style="width: 70%" value="<%=phone%>" /></td>
									</tr>
									<tr>
										<td>Telephone</td>
										<td><input type="number" class="form-control"
											name="countryCode2" style="width: 30%; float: left;"
											placeholder="ISD Code" /> <input type="number"
											class="form-control" name="phone2" style="width: 70%"
											value="<%=phone2%>" /></td>
									</tr>
									<tr>
										<td>Email-id</td>
										<td><input type="email" class="form-control" name="email"
											value="<%=email%>" /></td>
									</tr>
									<tr>
										<td>Website</td>
										<td><input type="text" class="form-control"
											name="website" value="<%=website%>" /></td>
									</tr>
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
										<td>Sub-Department(Optional)</td>
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
			$("#catData").load("../User/dept.jsp?mcId=" + mcId);
		}
		function loadSub() {
			var deptId = document.getElementById("dept").value;
			$("#subCatData").load("../User/subDept.jsp?deptId=" + deptId);
		}
	</script>
</body>

</html>
