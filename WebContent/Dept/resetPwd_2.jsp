<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
Helper helper = new Helper();
String pwd = request.getParameter("pwd");
int id = Integer.parseInt(request.getParameter("id"));
String sql = "UPDATE auth SET pwd=? WHERE id=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, helper.encryptPwd(pwd));
ps.setInt(2, id);
int i = ps.executeUpdate();
if(i>0) {
	String upQ = "UPDATE auth SET pwd_reset=?, reset_hash=? WHERE id=?";
	PreparedStatement ps2 = con.prepareStatement(upQ);
	ps2.setInt(1, 0);
	ps2.setString(2, "");
	ps2.setInt(3, id);
	int j = ps2.executeUpdate();
	if(j>0) {
		response.sendRedirect("../signin.jsp?status=success");	
	} else {
		response.sendRedirect("../signin.jsp?status=failed");
	}
	
} else {
	response.sendRedirect("../signin.jsp?status=failed");
}

con.close();
%>