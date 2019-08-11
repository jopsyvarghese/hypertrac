<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<option>Select Staff</option>
<%
Helper helper = new Helper();
int staffs = Integer.parseInt(request.getParameter("id"));
Connection con = com.hypertrac.dao.database.getConnection();
ResultSet rs = null;
Statement st = null;
st=con.createStatement();
rs=helper.getStaffNameByDeptId(staffs);
while(rs.next()) { %>
	<option value="<%=rs.getInt(1) %>"><%=rs.getString(2)+ " " +rs.getString(3) %></option>
<% } %>