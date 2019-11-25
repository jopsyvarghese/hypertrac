<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	int mcId = Integer.parseInt(request.getParameter("mcId"));
	Connection con = database.getConnection();
	ResultSet rs = null;
	String sql = "SELECT id, dname FROM dept WHERE mc_id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, mcId);
	rs = ps.executeQuery();
	while (rs.next()) {
%>
<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
<%
	}
	con.close();
%>