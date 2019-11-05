<%@page import="java.sql.ResultSet"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.commons.Helper"%>
<html>
<head>
<title>Chat Submit</title>
</head>
<body>
	<%
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
		Helper helper = new Helper();
		String comment = request.getParameter("comment");
		int fkId = Integer.parseInt(request.getParameter("chatId"));
		int q = Integer.parseInt(request.getParameter("q"));
		String sql = "INSERT INTO chat(fk_id, comment, c_by, c_time) VALUES(?,?,?,?)";
		Connection con = database.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fkId);
		ps.setString(2, comment);
		ps.setInt(3, myId);
		ps.setString(4, helper.getDateTime());
		int i = ps.executeUpdate();
		if (i > 0) {
			response.sendRedirect("chatWithAdmin.jsp?status=success&q="+q);
		} else {
			response.sendRedirect("chatWithAdmin.jsp?status=failed&q="+q);
		}
		String chat_on = helper.getDateTime();
		int chat_by = 0;
		chat_by = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		con.close();
	%>
</body>
</html>