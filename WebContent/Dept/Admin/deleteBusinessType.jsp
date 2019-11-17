<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
int id = 0;
if(request.getParameter("id") != null || request.getParameter("id") != "") {
	id = Integer.parseInt(request.getParameter("id"));
	String sql = "DELETE FROM business WHERE id="+id;
	Connection con = database.getConnection();
	Statement st = con.createStatement();
	int i = st.executeUpdate(sql);
	if(i>0) {
		response.sendRedirect("businessType.jsp?status=success");
	} else {
		response.sendRedirect("businessType.jsp?status=failed");
	}
} else {
	out.println("Invalid Details Supplied. <a href='businessType.jsp'>Please Click here to go back</a> ");
}

%>