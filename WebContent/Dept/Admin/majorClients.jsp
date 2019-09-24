<!DOCTYPE html>
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
String sql = "SELECT * FROM auth WHERE role=2";
Connection con = null;
Statement st = null;
ResultSet rs = null;
con = database.getConnection();
st = con.createStatement();
String email = "";
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
						<h3 class="text-info">Major Clients </h3><br />
					</div>
					<div class="col-sm-12">
						<a href="addClient.jsp" class="btn btn-primary btn-sm"> <span
							class="fa fa-plus-circle"></span> Add New Client
						</a> <br />
						<br />
						<table class="table-hover table-responsive">
							<tr class="table-warning">
								<th>Sl.No</th>
								<th>Major Client</th>
								<th>Address</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Operations</th>
							</tr>
							<%
							int i = 1;
							rs = st.executeQuery(sql);
							
							while(rs.next()) {
							%>
							
							<tr>
								<td><%=i %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(7) %></td>
								<td><a href="editClient.jsp?id=<%=rs.getInt(1) %>" class="btn btn-outline-primary btn-sm">
										<span class="fa fa-pencil-alt"></span>
								</a> 
								<%
								//Check Status
								int status = rs.getInt(16);
								String btnColor = "btn-outline-danger";
								String toggleStatus = "fa-toggle-off";
								if(status == 1) {
									btnColor = "btn-outline-success";
									toggleStatus = "fa-toggle-on";
								}
								%>
								<%-- <a href="../enableDisable.jsp?id=<%=rs.getInt(1) %>&redirect=Admin/majorClients.jsp"
									class="btn <%=btnColor %> btn-sm">
										<i class="fas <%=toggleStatus %>"></i>
								</a> --%>
								<a href="deleteClient.jsp?id=<%=rs.getInt(1) %>"
									class="btn btn-outline-danger btn-sm" onclick="return confirmDel();">
										<span class="fa fa-trash-alt"></span>
								</a>
								
								</td>
							</tr>
							<%								
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

	<script src="../js/common/common.js"></script>
</body>

</html>
