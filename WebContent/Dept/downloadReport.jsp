<%@page import="java.io.PrintWriter"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	int dept = Integer.parseInt(request.getParameter("dept"));
	String csv = "";
	Connection con = database.getConnection();
	PreparedStatement ps = null;
	String sql = "";
	Helper helper = new Helper();
	String stat[] = helper.getAppStatus();

	if (dept == 0 || dept == 4) {
		sql = "SELECT * FROM auth WHERE role=?";
	} else {
		sql = "SELECT * FROM applications_comment WHERE role=?";
	}
	ps = con.prepareStatement(sql);
	ps.setInt(1, dept);
	ResultSet rs = ps.executeQuery();
	if (dept == 0 || dept == 4) {
		csv += "App ID" + "," + "Name/No" + "," + "Subject" + "," + "Submitted On" + "," + "Status" + "\r\n";

		while (rs.next()) {
			int userId = rs.getInt(1);
			String sql2 = "SELECT * FROM applications WHERE app_by=?";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, userId);
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				csv += rs2.getInt(1) + "," + rs2.getString(2) + "," + rs2.getString(4) + "," + rs2.getString(5)
						+ "," + stat[rs2.getInt(7)] + "\r\n";

			}
		}
	} else {
		csv += "App ID" + "," + "Dept" + "," + "Assigned" + "," + "Comment" + "," + "By" + "," + "On" + ","
				+ "Status" + "\r\n";
		while (rs.next()) {

			csv += rs.getInt(2) + "," + helper.getDeptById(rs.getInt(3)) + "," + rs.getString(4) + ","
					+ helper.getNameById(rs.getInt(5)) + "," + rs.getString(7) + "," + stat[rs.getInt(8)]
					+ "\r\n";

		}
	}
	response.reset();
	response.setHeader("Content-type", "text/csv");
	response.setHeader("Content-disposition", "inline; filename=HypertracReport.csv");
	out.print(csv);
	con.close();
%>