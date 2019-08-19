<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>

<tr class="text-primary">
	<th  style="width:70% !important;">Comment</th>
	<th style="width:15% !important;">By</th>
	<th style="width:15% !important;">On</th>
</tr>

<%
	//Chat Room Data Loads Here
	String sql = "SELECT * FROM chat_room ORDER BY id DESC limit 0,10";
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
		<td>
			<small>
				<strong><%=helper.getFirstNameById(rs.getInt(2)) %></strong>
			</small>
		</td>
		<td>
			<small><%=rs.getString(4) %></small>
		</td>
	</tr>
<%
	}
	con.close();
%>