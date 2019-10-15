<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = database.getConnection();
ResultSet rs = null;
String inTime = "";
String outTime = "";
int myId = 0;
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch (Exception e) {
	response.sendRedirect("../logout.jsp");
}

String sql = "SELECT in_time, out_time FROM login_logs WHERE id=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, myId);
rs = ps.executeQuery();
if (rs.next()) {
	inTime = rs.getString(1);
	outTime = rs.getString(2);
}
con.close();
String loggedData = "";
if (inTime !="" || inTime != null) {
	loggedData += " Last Logged In Time : " + inTime;
}
if (outTime !="" || outTime != null) {
	loggedData += " Last Logged Out Time : " + outTime;
}
out.print(loggedData);
%>
