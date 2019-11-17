<%@page import="java.sql.Statement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	String buzzName = "";
	if (request.getParameter("buzzName") != "" || request.getParameter("buzzName") != null) {
		buzzName = request.getParameter("buzzName");
		Connection con = database.getConnection();
		Statement st = con.createStatement();
		String sql = "INSERT INTO business(buzz_type) VALUES('" + buzzName + "')";
		int i = st.executeUpdate(sql);
		if (i > 0) {
			response.sendRedirect("businessType.jsp?status=success");
		} else {
			response.sendRedirect("businessType.jsp?status=failed");
		}

	} else {
		out.println(
				"<h3>Invalid Details Supplied... <a href='addBusinessType.jsp'>Please Click here to go back</a></h3>");
	}
%>