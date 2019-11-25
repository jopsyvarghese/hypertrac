<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	Connection con = database.getConnection();
	ResultSet rs = null;
	String sql = "SELECT id, fname FROM auth WHERE role=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, 2);
	rs = ps.executeQuery();
	while (rs.next()) {
%>
<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
<%
	}
	con.close();
%>