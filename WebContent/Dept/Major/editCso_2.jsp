<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String sql = "UPDATE cso SET email=? WHERE id=?";
int id = 0;
String email = "";
int myId = 0;		
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch(NumberFormatException ne) {
	response.sendRedirect("../../logout.jsp");
} catch(NullPointerException ne) {
	response.sendRedirect("../../logout.jsp");
}

id = Integer.parseInt(request.getParameter("id"));
email = request.getParameter("email");
if(id<=0) {
	throw new Exception("Invalid Details Supplied");
}
if(myId <=0) {
	throw new Exception("You are not logged In");
}

Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, email);
ps.setInt(2, id);
int i = ps.executeUpdate();
if (i > 0) {
	response.sendRedirect("manageCso.jsp?status=success");
} else {
	response.sendRedirect("manageCso.jsp?status=failed");
}
%>