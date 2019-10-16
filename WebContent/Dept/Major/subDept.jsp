<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
int dept = Integer.parseInt(request.getParameter("dept"));
Connection con = com.hypertrac.dao.database.getConnection();
ResultSet rs = null;
Statement st = null;
st=con.createStatement();
String sql = "SELECT id, sname FROM dept_sub WHERE dept_id="+dept;
rs = st.executeQuery(sql);
while(rs.next()) { %>
<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
<% } %>