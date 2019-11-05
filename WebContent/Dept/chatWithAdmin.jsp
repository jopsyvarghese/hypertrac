<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.commons.Helper"%>
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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body id="page-top">
	<%
		Helper helper = new Helper();
		Connection con = database.getConnection();
		int chatId = 0;
		int staffId = 4;
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
		int q = 0;
		String redirect = "";
		try {
			q = Integer.parseInt(request.getParameter("q"));
		} catch (Exception e) {
			out.println("Something went wrong.. ! Please try later...");
		}
		if (q == 0 || q == 4) {
			redirect = "User/userChat.jsp";
		} else if (q == 1) {
			redirect = "Staff/";
		} else if (q == 2) {
			redirect = "Major/";
		} else if (q == 3) {
			redirect = "Admin/";
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
				href="index.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<small> <i class="fas fa-walking"></i>
					</small>
				</div>
				<div class="sidebar-brand-text mx-3">
					Chat<sup>Admin</sup>
				</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			<li class="nav-item active"><a class="nav-link"
				href="../logout.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Logout</span></a></li>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
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
				<%-- <jsp:include page="User/topbar.jsp"></jsp:include> --%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="bg-white mb-4">
						<div class="text-center">
							<img src="../img/logo.png" style="width: 150px; height: 40px;" />
						</div>
					</div>

					<div class="text-center">
						<h3>Chat With Admin</h3>
						<br />
						<div class="row">
							<div class="col-sm-3">
								<a href="<%=redirect%>" class="text-primary"><span
									class="fa fa-arrow-left"></span></a>
							</div>
							<div class="col-sm-6">
								<%
									if (request.getParameter("status") != null) {
										String status = request.getParameter("status");
										if (status.equals("success")) {
								%>
								<div class="alert alert-success alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<strong>Success!</strong> Updated your comment.
								</div>
								<%
									} else if (status.equals("failed")) {
								%>
								<div class="alert alert-danger alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<strong>Failed!</strong> Unable to Update.
								</div>
								<%
									}
									}
								%>
							</div>
							<div class="col-sm-3"></div>
						</div>

						<br />
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<%
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

								<form action="chatWithAdmin_2.jsp" method="post">
									<input type="hidden" name="chatId" value="<%=chatId %>"/>
									<input type="hidden" name="q" value="<%=q %>"/>
									<div class="text-center">
										<strong>Add your comment</strong>
									</div>
									<table class="table">
										<tr>
											<td><textarea class="form-control" name="comment"></textarea>
											</td>
											<td><button class="btn btn-primary btn-sm"
													style="margin-top: 20px;">
													Add <span class="fa fa-plus-circle"></span>
												</button></td>
										</tr>
										<tr>

										</tr>
									</table>
								</form>
							</div>
							<div class="col-sm-3"></div>

							<div class="col-sm-12 text-center">
								<table class="table table-hover table-responsive">
									<div id="chatData"></div>
								</table>
							</div>
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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<script>
		function update() {
			$.get("chatNowDataLoad.jsp?id=<%=chatId %>", function(data) {
				$("#chatData").html(data);
				window.setTimeout(update, 3000);
			});
		}
		update();
	</script>
</body>

</html>
