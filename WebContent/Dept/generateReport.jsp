<!DOCTYPE html>
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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Profile Pic Style -->
<style>
.propic .image {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.propic .middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
}

.propic .container:hover .image {
	opacity: 0.3;
}

.propic .container:hover .middle {
	opacity: 1;
}

.propic .text {
	/* background-color: #3b5998; */
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}
</style>

</head>

<body id="page-top">
	<%
		String cname = "";
		String addr = "";
		String mob = "";
		String email = "";
		int myId = 0;
		Connection con = database.getConnection();
		try {
			myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		} catch (Exception e) {
			response.sendRedirect("../logout.jsp");
		}
		
		String imgName = "";
		String imgQry = "SELECT pro_pic FROM auth WHERE id=?";
		PreparedStatement pImg = con.prepareStatement(imgQry);
		pImg.setInt(1, myId);
		ResultSet rsImg = null;
		rsImg = pImg.executeQuery();

		if (rsImg.next()) {
			imgName = rsImg.getString(1);
		}
		String imgUrl = "../img/img_avatar.png";
		if(imgName.length() > 0) {
			imgUrl =  "../images/service/" + imgName;
		}
		
		
		
		String sql = "SELECT fname, addr, mob, email FROM auth WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, myId);
		ResultSet rs = null;
		rs = ps.executeQuery();
		if (rs.next()) {
			cname = rs.getString(1);
			addr = rs.getString(2);
			mob = rs.getString(3);
			email = rs.getString(4);
		}
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center"
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

				<%
					if (request.getParameter("status") != null) {
						String status = request.getParameter("status");
						if (status.equals("success")) {
				%>
				<div class="alert alert-success alert-dismissible fade show">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong>Success!</strong> Updated your details.
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
				<!-- End of Topbar -->
				<div class="row">
					<div class="col-sm-2 text-center">
						<br />
						
					</div>

					<div class="col-sm-8 text-center card">
							<!-- Profile Pic -->
							<div class="container">
								<h2 class="text-primary">Generate Report</h2>
								<form action="generateReportFinal.jsp" method="post">
									<p>
									<br/>
										Select Department <select name="dept" class="form-control-sm">
											<option value="0">Contractor</option>
											<option value="1">Staff</option>
											<option value="2">Major Client</option>
											<option value="4">User</option>
										</select> <br/><br/>
										<input type="submit" class="btn btn-primary" value="Generate" />
									</p>
								</form>
							</div>
					</div>

					<div class="col-sm-2 text-center"></div>

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

	<script>
		function passwordCheck() {
			var newPwd = $("#newPwd").val();
			var confPwd = $("#confPwd").val();
			if (newPwd !== confPwd) {
				alert("Passwords Doesn't match");
				return false;
			}
			if (newPwd.length < 6) {
				alert("New Password Should be atleast 6 characters length");
				return false;
			}
			return true;
		}
	</script>
</body>

</html>
