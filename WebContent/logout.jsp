<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<%
		int id = 0;
		Connection con = database.getConnection();
		ResultSet rs = null;
		Helper helper = new Helper();

		try {
			if (session.getAttribute("loggedInUserId") == null) {
	%>
	<script>
		window.location = "index.jsp"
	</script>
	<%
		}
			id = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
		} catch (NullPointerException ne) {
		}

		String sql = "SELECT in_time FROM login_logs WHERE id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		rs = ps.executeQuery();
		if (rs.next()) {
			String query = "UPDATE login_logs SET out_time=? WHERE id=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, helper.getDateTime());
			pst.setInt(2, id);
			pst.executeUpdate();
		} else {
			String query = "INSERT INTO login_logs(id, in_time, out_time) VALUES (?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			pst.setString(2, helper.getDateTime());
			pst.setString(3, helper.getDateTime());
			pst.executeUpdate();
			System.out.println(query + "=>" + helper.getDateTime());
		}

		session.invalidate();
		response.sendRedirect("./");
	%>
</body>
</html>