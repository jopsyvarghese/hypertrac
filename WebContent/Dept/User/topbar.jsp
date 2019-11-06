<html>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<head>
<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

		<%
			Helper helper = new Helper();
			Connection con = database.getConnection();
			int loggedInId = 0;
			try {
				if (session.getAttribute("loggedInUserId") == null
						|| session.getAttribute("loggedInUserId").equals("")) {
		%>
		<script>
			window.location = "../../logout.jsp"
		</script>
		<%
			} else {
					loggedInId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
				}
			} catch (NumberFormatException ne) {
				out.println("Sorry! Invalid Login Details Supplied");
			} catch (NullPointerException npe) {
				out.println("Sorry! You're not Logged In");
			}
			if (loggedInId == 0) {
				response.sendRedirect("../../logout.jsp");
			}

			String sql = "SELECT DISTINCT id, c_by, c_to FROM chat_head WHERE c_to=? OR c_by=? ORDER BY id DESC LIMIT 0,8";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, loggedInId);
			ps.setInt(2, loggedInId);
			ResultSet rs = ps.executeQuery();
			PreparedStatement psC = con.prepareStatement(sql);
			psC.setInt(1, loggedInId);
			psC.setInt(2, loggedInId);
			ResultSet rsC = psC.executeQuery();
			int totalMessages = 0;
		%>
		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
			<!-- Nav Item - Messages -->
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-comment"
					aria-hidden="true"></i> <!-- Counter - Messages --> <%
 	while (rsC.next()) {
 		String sqlCount = "SELECT count(*) FROM chat WHERE chat.fk_id=? AND chat.read_status=? AND NOT chat.c_by=?";
 		PreparedStatement psCount = con.prepareStatement(sqlCount);
 		psCount.setInt(1, rsC.getInt(1));
 		psCount.setInt(2, 0);
 		psCount.setInt(3, loggedInId);
 		ResultSet rsCount = psCount.executeQuery();
 		if (rsCount.next()) {
 			if (rsCount.getInt(1) > 0) {
 				totalMessages++;
 			}
 		}
 	}
 	if (totalMessages > 0) {
 %> <span class="badge badge-danger badge-counter"><%=totalMessages%></span>
					<%
						}
					%> </span>
			</a> <!-- Dropdown - Messages -->
				<div
					class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="messagesDropdown">
					<h6 class="dropdown-header">Chats & Messages</h6>
					<%
						while (rs.next()) {
							String sql2 = "SELECT chat.comment, chat.c_by,chat.c_time, auth.pro_pic, auth.fname FROM chat INNER JOIN auth ON chat.c_by=auth.id WHERE chat.fk_id=? AND chat.read_status=? AND NOT chat.c_by=?";
							PreparedStatement ps2 = con.prepareStatement(sql2);
							ps2.setInt(1, rs.getInt(1));
							ps2.setInt(2, 0);
							ps2.setInt(3, loggedInId);
							ResultSet rs2 = ps2.executeQuery();

							String countQ = "SELECT count(*) FROM chat WHERE fk_id=? AND read_status=?";
							PreparedStatement psQ = con.prepareStatement(countQ);
							psQ.setInt(1, rs.getInt(1));
							psQ.setInt(2, 0);
							ResultSet rsQ = psQ.executeQuery();
							String count = "";
							if (rsQ.next()) {
								count = "(" + rsQ.getInt(1) + ")";
							}

							if (rs2.next()) {
					%>
					<a class="dropdown-item d-flex align-items-center" target="_blank"
						href="../chatNow.jsp?q=<%=helper.encrypt(rs.getString(1))%>">
						<div class="dropdown-list-image mr-3">
							<img class="rounded-circle"
								src="../../files/<%=rs2.getString(4)%>" alt="">
							<div class="status-indicator bg-success"></div>
						</div>
						<div class="font-weight-bold">
							<%=rs2.getString(1)%>
							<%=count%>
							<div class="text-truncate"></div>
							<div class="small text-gray-500"><%=rs2.getString(5)%>
								·
								<%=rs2.getString(3)%></div>
						</div>
					</a>
					<%
						}
						}
					%>

					<a class="dropdown-item text-center small text-gray-500"
						href="../readMore.jsp?q=<%=helper.encrypt("4")%>">Read
						More Messages</a>
				</div></li>


			<div class="topbar-divider d-none d-sm-block"></div>
			<%
				String myId = "";
				String myImg = "";
				try {
					if (session.getAttribute("loggedInUserName") == null) {
			%>
			<script>
				window.location = "../../logout.jsp"
			</script>
			<%
				}
					myId = session.getAttribute("loggedInUserName").toString();
					myImg = session.getAttribute("myImg").toString();
				} catch (NullPointerException ne) {
				}
			%>
			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small"> <strong><%=myId%></strong>
						<img class="img-profile rounded-circle"
						src="../../files/<%=myImg%>" />
				</span> <span class="myProfile">Logout</span>
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item"
						href="../profile.jsp?q=<%=helper.encrypt("4")%>"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						<div class="dropdown-divider"></div> <a class="dropdown-item"
						href="../../logout.jsp"> <i
							class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout
					</a>
				</div></li>

		</ul>

	</nav>
</body>
</html>
