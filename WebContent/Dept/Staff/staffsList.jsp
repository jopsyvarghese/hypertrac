<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
int dept = Integer.parseInt(request.getParameter("dept"));
Connection con = database.getConnection();
ResultSet rs = null;
String query = "SELECT id FROM staff WHERE dept=?";
PreparedStatement pst = con.prepareStatement(query); 
pst.setInt(1, dept);
ResultSet rst = pst.executeQuery();
int staffId = 0;
while(rst.next()) {
	staffId = rst.getInt(1);
	String sql = "SELECT id, fname FROM auth WHERE id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, staffId);
	rs = ps.executeQuery();
	while(rs.next()) { %>
<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
<% } 
}
con.close();
%>