<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
int dept = Integer.parseInt(request.getParameter("dept"));
String sql = "SELECT id, fname FROM auth WHERE id=(SELECT id FROM staff WHERE dept=?)";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, dept);
ResultSet rs = null;
rs = ps.executeQuery();
while(rs.next()) { %>
	<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
<% } 
con.close();
%>