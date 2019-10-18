<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%

String role = request.getParameter("role");
int myId = 0;
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch (NumberFormatException ne) {
	response.sendRedirect("../../logout.jsp");
} catch (NullPointerException ne) {
	response.sendRedirect("../../logout.jsp");
}
if(myId>0) {
	String sql = "INSERT INTO role(role) VALUES(?)";
	Connection con = database.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, role);
	int i = ps.executeUpdate();
	if (i > 0) {
		response.sendRedirect("manageRoles.jsp?status=success");
	} else {
		response.sendRedirect("manageRoles.jsp?status=failed");
	}
}

%>