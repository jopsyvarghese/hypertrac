<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.commons.Helper"%>
<html>
<head><title>Chat Submit</title></head>
<body>
	<%
	Helper helper = new Helper();
	String comment = request.getParameter("comment");
	String sql = "INSERT INTO chat_room(chat_by, comment, chat_on) VALUES(?,?,?)";
	String chat_on = helper.getDateTime();
	int chat_by = 0;
	chat_by = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
	
	if(chat_by != 0) {
		Connection con = database.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, chat_by);
		ps.setString(2, comment);
		ps.setString(3, chat_on);
		if (ps.executeUpdate() > 0) {
			response.sendRedirect("chatRoom.jsp?status=success");
		} else {
			response.sendRedirect("chatRoom.jsp?status=failed");
		}
		con.close();
	}
	%>
</body>
</html>