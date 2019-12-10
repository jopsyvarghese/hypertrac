<!DOCTYPE html>
<%@page import="javax.mail.internet.MimeMessage.RecipientType"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>

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
		String sql = "SELECT * FROM applications WHERE id=?";
		Helper helper = new Helper();
		Connection con = database.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		int app_by = 0;
		int myId = 0;
		try {
			myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		} catch (NumberFormatException ne) {
			response.sendRedirect("../../logout.jsp");
		}
		String sql2 = "SELECT * FROM cso WHERE mc_id=?";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1, myId);
		ResultSet rsCso = ps2.executeQuery();
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
						<div class="col-lg-2 mb-3"></div>
						<div class="col-lg-8 mb-6">
							<%
								if (request.getParameter("dept") == null) {
							%>
							<form action="#" method="post">
								<input type="hidden" name="id" value="<%=id%>" />
								<table class="table">

									<tr>
										<td>Department To Visit</td>
										<td><select name="dept" class="form-control">
												<option value="0">Select Any Department</option>
												<%
													ResultSet rsDept = helper.getDeptByMcId(myId);
														while (rsDept.next()) {
												%>
												<option value="<%=rsDept.getInt(1)%>"><%=rsDept.getString(2)%></option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td>Message</td>
										<td><textarea name="message" class="form-control" rows=10></textarea></td>
									</tr>
									<tr>
										<td>CSO Email</td>
										<td><select name="cso" class="form-control">
												<%
													while (rsCso.next()) {
												%>
												<option value="<%=rsCso.getString(3)%>"><%=rsCso.getString(3)%></option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td colspan="2" class="text-center"><input type="submit"
											class="btn btn-primary" value="Invite"/></td>
									</tr>
								</table>
							</form>
							<%
								} else {
									int dept = Integer.parseInt(request.getParameter("dept"));
									String csoEmail = request.getParameter("cso");
									String message = request.getParameter("message");

									String host = "localhost";//or IP address  
									final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
									Properties props = System.getProperties();
									props.setProperty("mail.smtp.host", "smtp.gmail.com");
									props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
									props.setProperty("mail.smtp.socketFactory.fallback", "false");
									props.setProperty("mail.smtp.port", "465");
									props.setProperty("mail.smtp.socketFactory.port", "465");
									props.put("mail.smtp.auth", "true");
									props.put("mail.debug", "true");
									props.put("mail.store.protocol", "pop3");
									props.put("mail.transport.protocol", "smtp");
									final String username = "hypertracltd@gmail.com";//
									final String password = "hyper.123";
									try {
										Session sessionObj = Session.getInstance(props, new Authenticator() {
											protected PasswordAuthentication getPasswordAuthentication() {
												return new PasswordAuthentication(username, password);
											}
										});

										// -- Create a new message --
										Message msg = new MimeMessage(sessionObj);
										if (rs.next()) {
											String sqlEmail = "SELECT email FROM applications_more WHERE fk_id = " + id;
											Statement st = con.createStatement();
											ResultSet rs2 = st.executeQuery(sqlEmail);

											// -- Set the FROM and TO fields --
											msg.setFrom(new InternetAddress("hypertracltd@gmail.com"));
											if (rs2.next()) {
												msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(rs2.getString(1), false));
											} else {
												out.println("<strong class='text-center text-warning'>Unable to Send Invitation... Invalid Email ID Supplied..</strong>");
											}

											msg.setSubject("HyperTrac: Invitation Against Your Application");
											msg.setContent("<h2 style='color:darkblue'>" + rs.getString(4) + "</h2><br/>"
													+ "<h3 style='color:orange'>For Application ID: " + id + "</h3><br/>" + "<h4>" + message
													+ "</h4><br/>", "text/html");
											/* msg.addRecipient(RecipientType.BCC, new InternetAddress(
											        "your@email.com")); */
											msg.addRecipient(RecipientType.CC, new InternetAddress(csoEmail));
										}

										msg.setSentDate(new Date());
										Transport.send(msg);
										//Check app_by exists in inviation
										String appQuery = "SELECT status FROM invitation WHERE app_id=" + id;
										Statement stQuery = con.createStatement();
										ResultSet rsQuery = stQuery.executeQuery(appQuery);
										if (rsQuery.next()) {
											String sqlInv = "UPDATE invitation SET invite_by=?,for_dept=?,extra_docs=?,status=? WHERE app_id=?";
											PreparedStatement psInv = con.prepareStatement(sqlInv);
											psInv.setInt(1, myId);
											psInv.setInt(2, dept);
											psInv.setString(3, message);
											psInv.setInt(4, 1);
											psInv.setInt(5, id);
											int j = psInv.executeUpdate();
											if (j > 0) {
												out.println(
														"<h5 class='text-success'>Email Invitation Sent Successfully and Details Updated</h4>");
											} else {
												out.println(
														"<h5 class='text-warning'>Email Invitation Sent Successfully, Details Not Updated</h4>");
											}
										} else {
											String sqlInv = "INSERT INTO invitation(app_id, status, docs_submitted, ofc_visited, extra_docs_required," +
										" extra_docs, invite_by, for_dept) VALUES(?,?,?,?,?,?,?,?)";
											PreparedStatement psInv = con.prepareStatement(sqlInv);
											psInv.setInt(1, id);
											psInv.setInt(2, 1);
											psInv.setInt(3, 0);
											psInv.setInt(4, 0);
											psInv.setInt(5, 0);
											psInv.setInt(6, 0);
											psInv.setInt(7, myId);
											psInv.setInt(8, dept);
											int j = psInv.executeUpdate();
											if (j > 0) {
												out.println(
														"<h5 class='text-success'>Email Invitation Sent Successfully and Details Updated</h4>");
											} else {
												out.println(
														"<h5 class='text-warning'>Email Invitation Sent Successfully, Details Not Updated</h4>");
											}
										}

									} catch (MessagingException e) {
										System.out.println("Error cause: " + e);
									}
								}
							%>

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

</body>

</html>
