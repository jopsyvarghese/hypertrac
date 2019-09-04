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
								int maxFileSize = 2000 * 1024;
								int i = 0;
								int myId = 0;

								Helper helper = new Helper();
								int id = 0;
								String comments = "";
								int dept = 0;
								int status = 0;
								HttpSession sess = request.getSession();
								int userId = (int) sess.getAttribute("loggedInUserId");
								int role = (int) sess.getAttribute("loggedInUserRole");
								int staffTo = 0;
								String currentTime = helper.getDateTime();

								try {
									myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
								} catch (NumberFormatException ne) {
									ne.printStackTrace();
								}
								if (myId == 0) {
									response.sendRedirect("../../logout.jsp");
								}

								boolean isMultipart = ServletFileUpload.isMultipartContent(request);
								if (!isMultipart) {
								} else {

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
											case "id":
												id = Integer.parseInt(item.getString());
												break;
											case "comments":
												comments = item.getString();
												break;
											case "dept":
												dept = Integer.parseInt(item.getString());
												break;
											case "status":
												status = Integer.parseInt(item.getString());
												break;
											case "staff":
												staffTo = Integer.parseInt(item.getString());
												break;
											default:
												break;
											}
										} else {
											//File Uploads Here
											try {
												String itemName = item.getName();
												File destinationDir = new File(getServletContext().getInitParameter("file-upload"));
												if (!destinationDir.exists()) {
													destinationDir.mkdir();
												}
												Timestamp timestamp = new Timestamp(System.currentTimeMillis());
												File savedFile = new File(destinationDir, "" + timestamp.getTime() + itemName);
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
									String sql = "INSERT INTO applications_comment SET app_id=?, dept_assigned=?, comment=?, comment_by=?, role=?, commented_on=?, status=?, staff_assigned=?";
									PreparedStatement ps = con.prepareStatement(sql);
									ps.setInt(1, id);
									ps.setInt(2, dept);
									ps.setString(3, comments);
									ps.setInt(4, userId);
									ps.setInt(5, role);
									ps.setString(6, currentTime);
									ps.setInt(7, status);
									ps.setInt(8, staffTo);
									int count = ps.executeUpdate();

									if (count > 0) {
										String query = "UPDATE applications SET dept = ? WHERE id = ?";
										PreparedStatement ps1 = con.prepareStatement(query);
										ps1.setInt(1, dept);
										ps1.setInt(2, id);
										int count2 = ps1.executeUpdate();
										if (count2 > 0) {
											for (int j = 0; j < savedFileName.length; j++) {
												if (savedFileName[j] == null || savedFileName[j] == "") {
													continue;
												}
												String sql3 = "INSERT INTO applications_img(fk_id, img_path, updated_at, uploaded_by) VALUES(?,?,?,?)";
												PreparedStatement ps3 = con.prepareStatement(sql3);
												ps3.setInt(1, id);
												ps3.setString(2, savedFileName[j]);
												ps3.setString(3, helper.getLocalDateTime());
												ps3.setInt(4, myId);
												if (ps3.executeUpdate() > 0) {
													status += 1;
												}
											}
											response.sendRedirect("viewApplication.jsp?id=" + id + "&status=success");
										} else {
											response.sendRedirect("viewApplication.jsp?id=" + id + "&status=failed");
										}
									} else {
										response.sendRedirect("viewApplication.jsp?id=" + id + "&status=failed");
									}
								}
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
