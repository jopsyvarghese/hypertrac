<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@ page import="java.util.*,com.hypertrac.dao.*,com.hypertrac.beans.*"%>
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
<link href="../css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<%
		Helper helper = new Helper();
		int pageid = 1;
		int itemCount = -1;
		if (request.getParameter("page") == null) {
			pageid = 1;
		} else {
			pageid = Integer.parseInt(request.getParameter("page"));
		}
		int total = 15;
		int start = 0;
		if (pageid <= 1) {
			pageid = 1;
		} else {
			start = (pageid - 1) * total + 1;
		}
		List<Applications> list = ApplicationsDao.getRecordsByRole(start, total, 4);
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
					<div class="text-center">
						<h3 class="text-info">Individual's Application</h3>
					</div>
					<br />
					<table class="table table-responsive-lg">
						<tr class="table-warning">
							<th>Sl.No</th>
							<th>Company Name/No.</th>
							<th>Major Client Name</th>
							<th>Submitted Date</th>
							<th>Status</th>
						</tr>
						<%
							int i = 1;
							for (Applications e : list) {
								if (itemCount < 0) {
									itemCount = e.getItemCount();
								}
						%>
						<tr>
							<td><%=i%></td>
							<td><%=e.getNameOrNo()%></td>
							<td><%=helper.getMajorClientByDeptId(e.getDept())%></td>
							<td><%=e.getSubmitted_on()%></td>
							<td><a href="viewApplication.jsp?id=<%=e.getId()%>"
								class="btn-sm btn-outline-primary"><span class="fa fa-eye"></span></a></td>
						</tr>
						<%
							i++;
							}
							int noOfPages = (int) Math.ceil(itemCount * 1.0 / total);
						%>
					</table>
					<div class="text-center">
						<%
							if (pageid > 1) {
						%>
						<a class="btn btn-outline-primary btn-sm"
							href="applications.jsp?page=<%=pageid - 1%>">Previous</a>
						<%
							}
							if (pageid < noOfPages) {
						%>&nbsp;&nbsp;
						<a class="btn btn-outline-primary btn-sm"
							href="applications.jsp?page=<%=pageid + 1%>">Next</a>
						<%
							}
						%><br/><br/><br/><br/>
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

</body>

</html>
