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
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<li><a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.jsp"> <span class="sidebar-brand-icon rotate-n-15">
						<small> <i class="fas fa-walking"></i>
					</small>
				</span> <span class="sidebar-brand-text mx-3"> Chat<sup>Now</sup>
				</span>
			</a></li>
			<!-- Divider -->
			<li><hr class="sidebar-divider my-0"></li>
			<li class="nav-item active"><a class="nav-link"
				href="../logout.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Logout</span></a></li>
			<!-- Divider -->
			<li><hr class="sidebar-divider my-0"></li>
			<!-- Divider -->
			<li><hr class="sidebar-divider d-none d-md-block"></li>

			<!-- Sidebar Toggler (Sidebar) -->
			<li class="text-center"><div class="d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div></li>
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

						<br />
							<%
								if (request.getParameter("q") != null) {
									//Decrypt User ID
									try {
										chatId = Integer.parseInt(helper.decrypt(request.getParameter("q")));

										if (chatId > 0) {
							%>

							<form method="post" action="chatNowFinal.jsp">
								<textarea name="comment" class="form-control"
									style="width: 80%; float: left;"></textarea>
								<input type="hidden" name="chatId" value="<%=chatId%>" /> <input
									type="hidden" name="c_by" value="<%=myId%>" /> <input
									type="hidden" name="hashId"
									value="<%=request.getParameter("q")%>" /> <input type="hidden"
									name="c_time" value="<%=helper.getDateTime()%>" />&nbsp; <input
									type="submit" class="btn btn-primary"
									style="width: 10%; margin-top: 10px;" value="Add" />
							</form>
							
							<table class="table table-hover">
								<tr>
									<th>Comment</th>
									<th>By</th>
									<th>On</th>
								</tr>
								<%
									if (chatId > 0) {
													String sql3 = "SELECT * FROM chat WHERE fk_id=" + chatId + " ORDER BY id DESC LIMIT 0,20";
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
										// Mark the messages as READ for current User
										String rQry = "UPDATE chat SET read_status=1 WHERE fk_id=? AND NOT c_by=?";
										PreparedStatement pst = con.prepareStatement(rQry);
										pst.setInt(1, chatId);
										pst.setInt(2, myId);
										int i = pst.executeUpdate(); // Nothing more to do
									} catch (NumberFormatException ne) {
										out.println("<h6 class='text-danger'>Sorry, Some Error Occured! Please try again later...</h6>");
									}
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
