<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
int client = Integer.parseInt(request.getParameter("client"));
int dept = Integer.parseInt(request.getParameter("dept"));
String subDept = request.getParameter("subDept");

String sql = "UPDATE dept_sub SET dept_id=?,sname=? WHERE id=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, dept);
ps.setString(2, subDept);
ps.setInt(3, id);
int i = ps.executeUpdate();
if (i > 0) {
	response.sendRedirect("subDeptMain.jsp?status=succes");
} else {
	response.sendRedirect("subDeptMain.jsp?status=failed");
}
%>