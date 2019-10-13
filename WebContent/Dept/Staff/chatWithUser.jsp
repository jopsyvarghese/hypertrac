<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.PreparedStatement"%>
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
Connection con = database.getConnection();
		
		String dataQ = "SELECT fname FROM auth WHERE role=0 OR role=4";
		Statement st = con.createStatement();
		ResultSet dataR = st.executeQuery(dataQ);
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
						<h4 class="text-info text-center">Search User To Chat</h4>
						<form action="#" method="get">
							<table class="table">
								<tr>
									<td>
									<input list="users" name="q" class="form-control"
									placeholder="Type a User's Name To Search">
									  <datalist id="users">
									  <%
									  	while(dataR.next()) {
									  %>
									    <option value="<%=dataR.getString(1) %>">
									    <% } %>
									  </datalist>
									</td>
									<td>
										<button class="btn btn-primary">
											<span class="fa fa-search"></span>
										</button>
									</td>
								</tr>
							</table>
						</form>

						<br />
						<table class="table table-hover">
							<%
						if(request.getParameter("q") != null) {
							//Encrypt User ID 
							
							Helper helper = new Helper();
							String user = request.getParameter("q");
							String sql = "SELECT id,fname,addr FROM auth WHERE (role=0 OR role=4) AND fname like ? ORDER BY id DESC limit 0, 10";
							PreparedStatement ps = con.prepareStatement(sql);
							ps.setString(1, "%" + user + "%");
							ResultSet rs = null;
							rs = ps.executeQuery();
							while(rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td>
								<a href="chatWithUser_2.jsp?q=<%=helper.encrypt(rs.getString(1)) %>">
									Chat Now <i class="fas fa-comments"></i>
								</a>
								</td>
							</tr>
							<%}
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

</body>

</html>
