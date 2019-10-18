<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
int id = 0;
int myId = 0;		
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch(NumberFormatException ne) {
	response.sendRedirect("../../logout.jsp");
} catch(NullPointerException ne) {
	response.sendRedirect("../../logout.jsp");
}
Helper helper = new Helper();
id = Integer.parseInt(helper.decrypt(request.getParameter("id")));
if(id<=0) {
	throw new Exception("Invalid Details Supplied");
}
if(myId <=0) {
	throw new Exception("You are not logged In");
}

String sql = "DELETE FROM role WHERE id=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, id);
int i = ps.executeUpdate();
if (i > 0) {
	response.sendRedirect("manageRoles.jsp?status=success");
} else {
	response.sendRedirect("manageRoles.jsp?status=failed");
}
%>