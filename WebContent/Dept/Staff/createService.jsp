<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
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
						<%
							int maxFileSize = 2000 * 1024;
							int i = 0;
							int myId = 0;
							
							try {
								myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
							} catch(NumberFormatException ne) {
								ne.printStackTrace();
							}
							if(myId == 0) {
								response.sendRedirect("../../logout.jsp");
							}
							Helper help = new Helper();
							boolean isMultipart = ServletFileUpload.isMultipartContent(request);
							ServletContext context = pageContext.getServletContext();
							String filePath = context.getInitParameter("file-upload");
							if (!isMultipart) {
							} else {
								String contractorName = "";
								String rc = "";
								String addr = "";
								String phone = "";
								String phone2 = "";
								String email = "";
								String website = "";
								int buzzType = 0;
								String docName = "";
								int majorClient = 0;
								int subDept = 0;
								FileItemFactory factory = new DiskFileItemFactory();
								ServletFileUpload upload = new ServletFileUpload(factory);
								String[] savedFileName = new String[10];
								int lastInsertedId = 0;
								List<FileItem> items = null;
								try {
									items = upload.parseRequest(request);
								} catch (FileUploadException e) {
									e.printStackTrace();
								}
								Iterator itr = items.iterator();
								while (itr.hasNext()) {
									FileItem item = (FileItem) itr.next();
									if (item.isFormField()) {

										//Form Fields are Here
										switch (item.getFieldName()) {
											case "contractorName" :
												contractorName = item.getString();
												break;
											case "rc" :
												rc = item.getString();
												break;
											case "addr" :
												addr = item.getString();
												break;
											case "phone" :
												phone = item.getString();
												break;
											case "phone2" :
												phone2 = item.getString();
												break;
											case "email" :
												email = item.getString();
												break;
											case "website" :
												website = item.getString();
												break;
											case "buzzType" :
												buzzType = Integer.parseInt(item.getString());
												break;
											case "docName" :
												docName = item.getString();
												break;
											case "majorClient" :
												majorClient = Integer.parseInt(item.getString());
												break;
											case "subDept" :
												subDept = Integer.parseInt(item.getString());
												break;
											default :
												break;
										}
									} else {
										//File Uploads Here
										try {
											String itemName = item.getName();
											File destinationDir = new File(filePath);
											if(!destinationDir.exists()) {
												destinationDir.mkdir();
											}
											Timestamp timestamp = new Timestamp(System.currentTimeMillis());
											File savedFile = new File(destinationDir, ""+timestamp.getTime()+itemName);
											try {
												long sizeInBytes = item.getSize();
												if (sizeInBytes <= maxFileSize) {
													item.write(savedFile);
												} else {
													continue;
												}
											} catch (SecurityException se) {
												se.printStackTrace();
											} catch (FileNotFoundException fne) {
												fne.printStackTrace();
											}
											savedFileName[i] = savedFile.getName();
											i++;

										} catch (Exception e) {
											e.printStackTrace();
										}
									}
								}
								Connection con = database.getConnection();
								Statement st = con.createStatement();
								ResultSet rs = null;
								String sql = "INSERT INTO applications(name_or_no, dept, subject, submitted_on, validity, status, app_by)"
										+ "VALUES(?,?,?,?,?,?,?)";
								PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
								ps.setString(1, contractorName);
								ps.setInt(2, majorClient);
								ps.setString(3, docName);
								ps.setString(4, help.getLocalDateTime());
								ps.setString(5, "15 Days");
								ps.setInt(6, 0);
								ps.setInt(7, Integer.parseInt(session.getAttribute("loggedInUserId").toString()));

								if (ps.executeUpdate() > 0) {
									rs = ps.getGeneratedKeys();
									if (rs.next()) {
										lastInsertedId = rs.getInt(1);
										// Adding other details to applications_more table
										String sql2 = "INSERT INTO applications_more(fk_id, company, comp_addr, phone, phone2, email, website, buzz_type, doc_name, major_client, sub_dept)"
												+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
										PreparedStatement ps2 = con.prepareStatement(sql2);
										ps2.setInt(1, lastInsertedId);
										ps2.setString(2, contractorName);
										ps2.setString(3, addr);
										ps2.setLong(4, Long.parseLong(phone));
										ps2.setLong(5, Long.parseLong(phone2));
										ps2.setString(6, email);
										ps2.setString(7, website);
										ps2.setInt(8, buzzType);
										ps2.setString(9, docName);
										ps2.setInt(10, majorClient);
										ps2.setInt(11, subDept);
										int status = 0;
										if (ps2.executeUpdate() > 0) {
											for (int j = 0; j < savedFileName.length; j++) {
												if (savedFileName[j] == null || savedFileName[j] == "") {
													continue;
												}
												String sql3 = "INSERT INTO applications_img(fk_id, img_path, updated_at, uploaded_by) VALUES(?,?,?,?)";
												PreparedStatement ps3 = con.prepareStatement(sql3);
												ps3.setInt(1, lastInsertedId);
												ps3.setString(2, savedFileName[j]);
												ps3.setString(3, help.getLocalDateTime());
												ps3.setInt(4,myId);
												if (ps3.executeUpdate() > 0) {
													status += 1;
												}
											}
											if (status > 0) {
												out.println(
														"<h4 style='color:green;'>Applied Successfully. Your Reference Number Is: <strong>"
																+ lastInsertedId + "</strong></h4>");
											} else {
												out.println(
														"<h4 style='color:red;'>Sorry! Unable to Complete Application at this time.</h4>");
											}

										} else {
											out.println(
													"<h4 style='color:red;'>Sorry! Unable to Complete Application at this time.</h4>");
										}
									}
								} else {
									out.println("<h4 style='color:red;'>Sorry! Unable to Create Application at this time.</h4>");
								}
							}
						%>
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
</body>

</html>
