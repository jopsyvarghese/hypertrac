<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>

<tr class="text-primary">
	<th style="width: 70% !important;">Comment</th>
	<th style="width: 15% !important;">By</th>
	<th style="width: 15% !important;">On</th>
</tr>

<%
	int chatId = Integer.parseInt(request.getParameter("id"));
	String sql = "SELECT * FROM chat WHERE fk_id="+chatId+" ORDER BY id DESC limit 0,20";
	Helper helper = new Helper();
	Connection con = database.getConnection();
	Statement st = null;
	st = con.createStatement();
	ResultSet rs = null;
	rs = st.executeQuery(sql);
	while(rs.next()) {
%>
<tr>
	<td><%=rs.getString(3) %></td>
	<td><small> <strong><%=helper.getFirstNameById(rs.getInt(4)) %></strong>
	</small></td>
	<td><small><%=rs.getString(5) %></small></td>
</tr>
<%
	}
	con.close();
%>