<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
String fname = request.getParameter("fname");
String addr = request.getParameter("addr");
String redirectHeader = request.getParameter("redirectHeader");
Long mob = Long.parseLong(request.getParameter("mob"));
String email = request.getParameter("email");
int myId = 0;
myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());
Connection con = database.getConnection();
if(myId > 0) {
	String sql = "UPDATE auth SET fname=?, addr=?, mob=?, email=? WHERE id=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, fname);
	ps.setString(2, addr);
	ps.setLong(3, mob);
	ps.setString(4, email);
	ps.setInt(5, myId);
	int count = ps.executeUpdate();
	String status = "failed";
	if(count > 0) {
		status = "success";
		session.setAttribute("loggedInUserName", fname);
	}
	response.sendRedirect("profile.jsp?status="+status+"&q="+redirectHeader);
} else { %>
<script>window.location.href="../logout.jsp"</script>
<%
}
con.close();
%>