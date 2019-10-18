<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String sql = "UPDATE role SET role=? WHERE id=?";
int id = 0;
String role = "";
int myId = 0;		
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch(NumberFormatException ne) {
	response.sendRedirect("../../logout.jsp");
} catch(NullPointerException ne) {
	response.sendRedirect("../../logout.jsp");
}

id = Integer.parseInt(request.getParameter("id"));
role = request.getParameter("role");
if(id<=0) {
	throw new Exception("Invalid Details Supplied");
}
if(myId <=0) {
	throw new Exception("You are not logged In");
}

Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, role);
ps.setInt(2, id);
int i = ps.executeUpdate();
if (i > 0) {
	response.sendRedirect("manageRoles.jsp?status=success");
} else {
	response.sendRedirect("manageRoles.jsp?status=failed");
}
%>