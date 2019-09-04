<!DOCTYPE html>
<%@page import="java.io.File"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
		int id = Integer.parseInt(request.getParameter("id"));
		Connection con = database.getConnection();
		ResultSet imgRs = helper.getImagesByFKey(id);
		ResultSet imgRs1 = helper.getImagesByFKey(id);
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
						<div class="col-lg-9 mb-4">
							<small class="pull-left"> <a href="individualsApplications.jsp"><i
									class="fa fa-arrow-left" aria-hidden="true"></i></a>
							</small><br/>
							<%
								String appId = "";
								String query = "SELECT * FROM applications WHERE id=?";
								PreparedStatement ps = con.prepareStatement(query);
								ps.setInt(1, id);
								ResultSet rs = null;
								ResultSet rs1 = null;
								rs = ps.executeQuery();
								if (rs.next()) {
									String subQuery = "SELECT * FROM applications_more WHERE fk_id=?";
									PreparedStatement ps1 = con.prepareStatement(subQuery);
									ps1.setInt(1, id);
									rs1 = ps1.executeQuery();
									if (rs1.next()) {
							%>
							<table class="table">
								<tr>
									<th>Application Name/No.</th>
									<td><%=rs.getString(2)%></td>
									<%
										appId = rs.getString(2);
									%>
								</tr>
								<tr>
									<th>Company (Contractor) Name</th>
									<td><%=rs1.getString(3)%></td>
								</tr>
								<tr>
									<th>RC Number</th>
									<td><%=helper.getRc(rs.getInt(8))%></td>
								</tr>
								<tr>
									<th>Company Address</th>
									<td><%=rs1.getString(4)%></td>
								</tr>
								<tr>
									<th>Telephone No</th>
									<td><%=rs1.getString(5)%></td>
								</tr>
								<tr>
									<th>Email ID</th>
									<td><%=rs1.getString(7)%></td>
								</tr>
								<tr>
									<th>Website ID</th>
									<td><%=rs1.getString(8)%></td>
								</tr>
								<tr>
									<th>Type Of Business</th>
									<td><%=helper.buzzType(rs1.getInt(9))%></td>
								</tr>
								<tr>
									<th>Document Name/Subject/ID</th>
									<td><%=rs1.getString(10)%></td>
								</tr>
								<tr>
									<th>Name of Major Client(s)</th>
									<td><%=helper.getNameById(rs1.getInt(11))%></td>
								</tr>
								<tr>
									<th>Sub-Department</th>
									<td><%=helper.getSubDept(rs1.getInt(12))%></td>
								</tr>
							</table>
							<%
								}
								}
							%>
						</div>
						<div class="col-sm-3">

							<div id="demo" class="carousel slide" data-ride="carousel">

								<!-- Indicators -->
								<ul class="carousel-indicators">
									<%
										int i = 0;
										while (imgRs.next()) {
											String status = "";
											if (i == 0) {
												status = "active";
											}
									%>
									<li data-target="#demo" data-slide-to="<%=i%>"
										class="<%=status%>"></li>
									<%
										i++;
										}
									%>
								</ul>

								<!-- The slideshow -->
								<div class="carousel-inner rounded">
									<%
										int j = 0;
										while (imgRs1.next()) {
											String status = "";
											if (j == 0) {
												status = "active";
											}
									%>
									<div class="carousel-item <%=status%>">
										<img
											src="../../uploads/<%out.print("" + imgRs1.getString(1));%>"
											alt="Documents Image" class="img-fluid">
									</div>
									<%
										j++;
										}
									%>
								</div>

								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#demo" data-slide="prev">
									<span class="carousel-control-prev-icon"></span>
								</a> <a class="carousel-control-next" href="#demo" data-slide="next">
									<span class="carousel-control-next-icon"></span>
								</a>

							</div>
							<div style="margin-top: 30px; text-align: center">
								<a href="appNext.jsp?id=<%=id%>&appId=<%=appId%>"
									class="btn btn-danger">Next >></a>
							</div>
							<br />
							<br />
							<div class="text-center">
								<a href="appCommentsHistory.jsp?id=<%=id%>" target="_blank"
									class="text text-primary"> <span class="fa fa-walking"></span>
									Journey / <span class="fa fa-comment"></span> Comments
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

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
</body>

</html>
