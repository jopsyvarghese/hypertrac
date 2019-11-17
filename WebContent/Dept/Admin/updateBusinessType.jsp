<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String buzzName = request.getParameter("buzzName");
	String sql = "UPDATE business SET buzz_type='" + buzzName + "' WHERE id=" + id;
	Connection con = database.getConnection();
	Statement st = con.createStatement();
	int i = st.executeUpdate(sql);
	if (i > 0) {
		response.sendRedirect("businessType.jsp?status=success");
	} else {
		response.sendRedirect("businessType.jsp?status=failed");
	}
%>