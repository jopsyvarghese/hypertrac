<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%

String email = request.getParameter("email");
int myId = 0;
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
} catch (NumberFormatException ne) {
	response.sendRedirect("../../logout.jsp");
} catch (NullPointerException ne) {
	response.sendRedirect("../../logout.jsp");
}
if(myId>0) {
	String sql = "INSERT INTO cso(mc_id, email) VALUES(?,?)";
	Connection con = database.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, myId);
	ps.setString(2, email);
	int i = ps.executeUpdate();
	if (i > 0) {
		response.sendRedirect("manageCso.jsp?status=success");
	} else {
		response.sendRedirect("manageCso.jsp?status=failed");
	}
}

%>