<!DOCTYPE html>
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
	Connection con = database.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	int app_by = 0;
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
						<div class="col-lg-3 mb-4"></div>
						<div class="col-lg-6 mb-4">
						<%
						  String to = "jopsyvarghese@gmail.com";
					      String from = "jopsy777@gmail.com";  
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
					      try{
					      Session sessionObj = Session.getInstance(props, 
					                           new Authenticator(){
					                              protected PasswordAuthentication getPasswordAuthentication() {
					                                 return new PasswordAuthentication(username, password);
					                              }});

					    // -- Create a new message --
					      Message msg = new MimeMessage(sessionObj);
					      if(rs.next()){
					    	  String sql2 = "SELECT email FROM auth WHERE id = "+rs.getInt(8);
					    	  Statement st = con.createStatement();
					    	  ResultSet rs2 = st.executeQuery(sql2);
					    	  
					   // -- Set the FROM and TO fields --
					      msg.setFrom(new InternetAddress("hypertracltd@gmail.com"));
					      if(rs2.next()){
					    	  msg.setRecipients(Message.RecipientType.TO, 
				                       InternetAddress.parse(rs2.getString(1),false));  
				    	  } else {
				    		  throw new Exception("Invalid Email ID");
				    	  }
					      
					    	  msg.setSubject("HyperTrac: Invitation Against Your Application");
					    	  msg.setContent("<h4>"+rs.getString(4)+"</h4>"+
					    			  "<i>Requesting you to visit our office for further processing of your application</i><br/>" +
					    			  "Application ID: "+id
					    			  , "text/html");
					      }
					      
					      msg.setSentDate(new Date());
					      Transport.send(msg);
					      out.println("<h4>Email Invitation Sent Successfully</h4>");
					   }catch (MessagingException e){ System.out.println("Erreur d'envoi, cause: " + e);}
						%>
						
						</div>
						<div class="col-lg-3 mb-4"></div>
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
