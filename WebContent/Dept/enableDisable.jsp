<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
String redirect = request.getParameter("redirect");
int status = 0;
String sql = "SELECT status FROM auth WHERE id=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
if(rs.next() && rs.getInt(1) == 0) {
	status = 1;
}

int loggedId = 0;
try {
	if(session.getAttribute("loggedInUserId") == null) {
		%>
		<script>window.location="../../logout.jsp"</script>
		<%
	}
	loggedId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());	
} catch(NullPointerException ne){}

if (loggedId > 0) {
	String query = "UPDATE auth SET status=? WHERE id=?";
	PreparedStatement ps2 = con.prepareStatement(query);
	ps2.setInt(1, status);
	ps2.setInt(2, id);
	int i = ps2.executeUpdate();
	String updateStatus = "failed";
	if (i > 0) {
		updateStatus = "success";
	}
	response.sendRedirect(redirect+"?status="+updateStatus);
}
%>