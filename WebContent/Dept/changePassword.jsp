<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
Helper helper = new Helper();
int myId = 0;
Connection con = database.getConnection();
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());	
} catch(Exception e) {
	response.sendRedirect("../logout.jsp");
}

String currentPwd = request.getParameter("oldPwd");
String newPwd = request.getParameter("newPwd");

String sql = "UPDATE auth SET pwd = ? WHERE id=? AND pwd=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, helper.encryptPwd(newPwd));
ps.setInt(2, myId);
ps.setString(3, helper.encryptPwd(currentPwd));
int i = ps.executeUpdate();
if(i > 0) {
	response.sendRedirect("profile.jsp?status=success");
} else {
	response.sendRedirect("profile.jsp?status=failed");
}
%>