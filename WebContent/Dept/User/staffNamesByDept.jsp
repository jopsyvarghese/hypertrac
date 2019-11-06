<%@page import="java.util.ArrayList"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<option>Select Staff</option>
<%
	Helper helper = new Helper();
	int mcId = Integer.parseInt(request.getParameter("id"));
	Connection con = com.hypertrac.dao.database.getConnection();
	ResultSet rs = null;
	Statement st = null;
	st = con.createStatement();
	ArrayList<Integer> staffIds = helper.getStaffNamesByMcId(mcId);
	String staffName = "";
	for (int staffId : staffIds) {
		staffName = helper.getNameById(staffId);
%>
<option value="<%=staffId%>"><%=staffName%></option>
<%
	}
%>