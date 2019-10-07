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

<title>HyperTrac</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">
	<%
		Connection con = database.getConnection();
		int myId = 0;
		try {
			myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		} catch (Exception e) {
			response.sendRedirect("../logout.jsp");
		}
		String imgName = "";
		String imgQry = "SELECT pro_pic FROM auth WHERE id=?";
		PreparedStatement pImg = con.prepareStatement(imgQry);
		pImg.setInt(1, myId);
		ResultSet rs = null;
		rs = pImg.executeQuery();

		if (rs.next()) {
			imgName = rs.getString(1);
		}
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<small><i class="fas fa-walking"></i></small>
				</div>
				<div class="sidebar-brand-text mx-3">
					Hyper<sup>Trac</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="../logout.jsp">
					<i class="fas fa-fw fa-chart-area"></i> <span>Logout</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

				</nav>

				<!-- End of Topbar -->
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<%
							int maxFileSize = 2000 * 1024;
							String savedFileName = "";
							boolean isMultipart = ServletFileUpload.isMultipartContent(request);
							if (!isMultipart) {
							} else {
								FileItemFactory factory = new DiskFileItemFactory();
								ServletFileUpload upload = new ServletFileUpload(factory);
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
									} else {
										//File Uploads Here
										try {
											String itemName = item.getName();
											//File destinationDir = new File(getServletContext().getInitParameter("file-upload"));
											String realPath = getServletContext().getRealPath("images/service");
											File destinationDir = new File(realPath);
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
											savedFileName = savedFile.getName();

										} catch (Exception e) {
											e.printStackTrace();
										}
									}
								}
							}
							if (savedFileName.length() > 0) {
								String sql = "UPDATE auth SET pro_pic=? WHERE id=?";
								PreparedStatement ps = con.prepareStatement(sql);
								ps.setString(1, savedFileName);
								ps.setInt(2, myId);
								if (ps.executeUpdate() > 0) {
									//First Delete Old Image and Update Table
									/* File filePath = new File("../../../images/service/" + imgName);
									filePath.delete(); */
									response.sendRedirect("profile.jsp?status=success");
								} else {
									response.sendRedirect("profile.jsp?status=failed");
								}
							}
						%>
					</div>
					<div class="col-sm-3"></div>

				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2019</span>
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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<%
		con.close();
	%>
</body>

</html>
