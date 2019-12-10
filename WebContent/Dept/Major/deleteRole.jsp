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
try {
	id = Integer.parseInt(request.getParameter("id"));
} catch(NumberFormatException nex){}
catch(NullPointerException npe){}
if(id <= 0) {	
	out.println("Invalid Details Supplied");
}
if(myId <=0) {
	out.println("You are not logged In");
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