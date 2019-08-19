
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	Connection con = database.getConnection();
	String comment = request.getParameter("comment");
	int chatId = Integer.parseInt(request.getParameter("chatId"));
	int staffId = Integer.parseInt(request.getParameter("staffId"));
	int c_by = Integer.parseInt(request.getParameter("c_by"));
	String c_time = request.getParameter("c_time");
	String hashId = request.getParameter("hashId");
	Helper helper = new Helper();
	String sql = "INSERT INTO chat(fk_id, comment, c_by, c_time) VALUES (?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, chatId);
	ps.setString(2, comment);
	ps.setInt(3, c_by);
	ps.setString(4, c_time);
	ps.executeUpdate();
	response.sendRedirect("chatWithUser_2.jsp?q=" + hashId);
%>