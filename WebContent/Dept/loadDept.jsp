<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%
Helper helper = new Helper();
int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = helper.getDeptByMcId(id);
while(rs.next()) { %>
	<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
<% } %>