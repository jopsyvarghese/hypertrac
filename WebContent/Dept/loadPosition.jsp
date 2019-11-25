<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%
Helper helper = new Helper();
int mcId = Integer.parseInt(request.getParameter("mcId"));
ResultSet rs = helper.getRoleByMcId(mcId);
while(rs.next()) { %>
	<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
<% } %>