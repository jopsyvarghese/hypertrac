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
		//int majorClient = Integer.parseInt(request.getParameter("majorClient"));
		//int staffs = Integer.parseInt(request.getParameter("staffs"));
		int chatId = 0;
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
		int q = -1;
		try {
			q = Integer.parseInt(helper.decrypt(request.getParameter("q")));
		} catch (Exception e) {
		}

		String redirect = "";
		if (q < 0) {
			out.println(
					"<h3 class='text-danger text-center'>Sorry! Some error occured.Please contact Administrator</h3>");
		} else if (q == 1) {
			redirect = "Staff/";
		} else if (q == 2) {
			redirect = "Major/";
		} else if (q == 3) {
			redirect = "Admin/";
		} else if ((q == 4) || (q == 0)) {
			redirect = "User/";
		} else {
			throw new Exception("You are not authorized to view this page");
		}

		ResultSet rs = null;
		rs = helper.getAllChats(myId);
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
					Chat<sup>History</sup>
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

				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="bg-white mb-4">
						<div class="text-center">
							<img src="../img/logo.png" style="width: 150px; height: 40px;" />
						</div>
					</div>
					<div class="col-sm-12">
						<br /> &nbsp;&nbsp;<a href="<%=redirect%>" class="text-primary"><span
							class="fa fa-arrow-left"></span></a> <br />
						<div class="text-center">
							<h3 class="text-info">Chat History</h3>
							<table class="table table-hover">
								<tr>
									<th>Chat With</th>
									<th>Chat Now</th>
								</tr>
								<%
									String chatWith = "";
									while (rs.next()) {
										if (rs.getInt(2) != myId) {
											chatWith = helper.getNameById(rs.getInt(2));
										} else if (rs.getInt(3) != myId) {
											chatWith = helper.getNameById(rs.getInt(3));
										}
								%>
								<tr>
									<td><%=chatWith%></td>
									<td><a
										href="chatNow.jsp?q=<%=helper.encrypt("" + rs.getInt(1))%>"><i
											class="far fa-comments"></i></a></td>
								</tr>
								<%
									}
								%>
							</table>
							<br />
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
	<!-- <script>
		function update() {
			$.get("chatNowDataLoad.jsp", function(data) {
				$("#chatData").html(data);
				window.setTimeout(update, 3000);
			});
		}
		update();
	</script> -->
</body>

</html>
