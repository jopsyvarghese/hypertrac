<html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%
	int myId = 0;
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());

	if (myId == 0) {
		response.sendRedirect("../../logout.jsp");
	}

	ResultSet rs = null;
	String sql = "SELECT fname FROM auth WHERE id=?";
	Connection con = database.getConnection();
	Helper helper = new Helper();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, myId);
	rs = ps.executeQuery();
	String fname = "";
	if (rs.next()) {
		fname = rs.getString(1);
	}
	int mertId = 824;
	String txnId = "HT" + helper.getTimeStamp();
	int txnAmount = 500;
	int txnCurrency = 826;
	String redirectUrl = "http://hypertrac.biz/txnSuccess.jsp";
	String gTPayKEY = helper.getGTTxnKey();
	String custId = "HT0C"+myId;
	String stringToHash = mertId+txnId+txnAmount+txnCurrency+custId+redirectUrl+gTPayKEY;
	String finalHash = helper.encryptPwd(stringToHash);
%>
<body onload="document.submit2gtpay_form.submit()">
	<form name="submit2gtpay_form" action="http://gtweb.gtbank.com//GTPay/Tranx.aspx" target="_self" method="post">
		<input type="hidden" name="gtpay_mert_id" value="<%=mertId %>" />
		<input type="hidden" name="gtpay_tranx_id" value="<%=txnId %>" />
		<input type="hidden" name="gtpay_tranx_amt" value="<%=txnAmount %>" />
		<input type="hidden" name="gtpay_tranx_curr" value="<%=txnCurrency %>" />
		<input type="hidden" name="gtpay_cust_id" value="<%=custId %>" />
		<input type="hidden" name="gtpay_cust_name" value="<%=fname %>" />
		<input type="hidden" name="gtpay_tranx_memo" value="" />
		<input type="hidden" name="gtpay_echo_data" value="<% out.print(myId+";"+fname); %>" />
		<input type="hidden" name="gtpay_gway_name" value="webpay" />
		<input type="hidden" name="gtpay_hash" value="<%=finalHash %>" />
		<input type="hidden" name="gtpay_tranx_noti_url" value="<%=redirectUrl %>" />
		<input type="hidden" name="gtpay_echo_data" value="<% out.print(myId+";"+fname); %>">
</form>
</body>

</html>