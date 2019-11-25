<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
String uname = request.getParameter("uname");
String sql = "SELECT id FROM auth WHERE uname=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uname);
ResultSet rs = ps.executeQuery();
if(rs.next()) {
	return "taken";
} else {
	return "not_taken";	
}
%>