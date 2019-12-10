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
								Helper help = new Helper();
								boolean isMultipart = ServletFileUpload.isMultipartContent(request);
								if (!isMultipart) {
								} else {
									int id = 0;
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
									Iterator<FileItem> itr = items.iterator();
									while (itr.hasNext()) {
										FileItem item = (FileItem) itr.next();
										if (item.isFormField()) {
											id = Integer.parseInt(item.getString());
											System.out.println("Field NAME: " + item.getFieldName() + " AND VALUE IS: " + item.getString());
										} else {
											//File Uploads Here
											try {
												String itemName = item.getName();
												File destinationDir = new File(getServletContext().getInitParameter("file-upload"));

												//String relativePath = "uploads/";
												//String realPath = getServletContext().getRealPath(relativePath);
												/* String realPath = getServletContext().getRealPath("uploads");
												File destinationDir = new File(realPath); */
												if (!destinationDir.exists()) {
													destinationDir.mkdir();
												}
												Timestamp timestamp = new Timestamp(System.currentTimeMillis());
												//File savedFile = new File(realPath, itemName);
												//File savedFile = new File(realPath, ""+timestamp.getTime()+itemName);
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

									// Storing uploaded image details
									int status = 0;
									for (int j = 0; j < savedFileName.length; j++) {
										if (savedFileName[j] == null || savedFileName[j] == "") {
											continue;
										}
										System.out.println("ID IS: " + id);
										Connection con = database.getConnection();
										String sql = "INSERT INTO applications_img(fk_id, img_path, updated_at) VALUES(?,?,?)";
										PreparedStatement ps = con.prepareStatement(sql);
										ps.setInt(1, id);
										ps.setString(2, savedFileName[j]);
										ps.setString(3, help.getLocalDateTime());
										if (ps.executeUpdate() > 0) {
											status += 1;
										}
									}

									if (status > 0) {
										response.sendRedirect("history.jsp?status=success");
									} else {
										response.sendRedirect("history.jsp?status=failed");
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
