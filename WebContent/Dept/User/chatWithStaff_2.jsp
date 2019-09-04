<!DOCTYPE html>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		Helper helper = new Helper();
		Connection con = database.getConnection();
		//int majorClient = Integer.parseInt(request.getParameter("majorClient"));
		//int staffs = Integer.parseInt(request.getParameter("staffs"));
		int chatId = 0;
		int staffId = 0;
		int myId = 0;
		if (session.getAttribute("loggedInUserId") != null) {
			myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		}
		if (myId == 0) {
	%>
	<script>
		winodw.location.href = "../../logout.jsp";
	</script>
	<%
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

					<small class="pull-left"> <a href="userChat.jsp"><i
							class="fa fa-arrow-left" aria-hidden="true"></i></a>
					</small><br/>

					<div class="text-center">

						<%
							try {
								staffId = Integer.parseInt(request.getParameter("staffId"));
							} catch (NumberFormatException ne) {
								staffId = Integer.parseInt(helper.decrypt(request.getParameter("staffId")));
								ne.getLocalizedMessage();
							}

							if (staffId > 0) {
								String sql = "SELECT id FROM chat_head WHERE (c_by = ? OR c_to = ?) AND (c_by = ? OR c_to = ?) ORDER BY id DESC";
								PreparedStatement ps = con.prepareStatement(sql);
								ps.setInt(1, myId);
								ps.setInt(2, myId);
								ps.setInt(3, staffId);
								ps.setInt(4, staffId);
								ResultSet rs = null;
								ps.executeQuery();
								rs = ps.executeQuery();

								if (rs.next()) {
									chatId = rs.getInt(1);
								} else {
									String sql2 = "INSERT INTO chat_head(c_by,c_to) VALUES(?,?)";
									PreparedStatement ps2 = con.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
									ps2.setInt(1, myId);
									ps2.setInt(2, staffId);
									ps2.executeUpdate();
									ResultSet rs2 = ps2.getGeneratedKeys();
									if (rs2.next()) {
										chatId = rs2.getInt(1);
									}
								}
						%>

						<form method="post" action="chatWithStaff_3.jsp">
							<textarea name="comment" class="form-control"
								style="width: 80%; float: left;"></textarea>
							<input type="hidden" name="chatId" value="<%=chatId%>" /> <input
								type="hidden" name="c_by" value="<%=myId%>" /> <input
								type="hidden" name="staffId" value="<%=staffId%>" /> <input
								type="hidden" name="c_time" value="<%=helper.getDateTime()%>" />
							<input type="submit" class="btn btn-primary"
								style="width: 15%; margin-top: 10px;" />
						</form>
						<br />
						<br />
						<table class="table table-hover">
							<tr>
								<th>Comment</th>
								<th>By</th>
								<th>On</th>
							</tr>
							<%
								if (chatId > 0) {
										String sql3 = "SELECT * FROM chat WHERE fk_id=" + chatId + " ORDER BY id DESC";
										Statement st = con.createStatement();
										ResultSet rs3 = null;
										rs3 = st.executeQuery(sql3);
										while (rs3.next()) {
							%>
							<tr>
								<td><%=rs3.getString(3)%></td>
								<td><%=helper.getNameById(rs3.getInt(4))%></td>
								<td><%=rs3.getString(5)%></td>
							</tr>
							<%
								}
									}
							%>
						</table>
						<%
							}
						%>

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

</body>

</html>
