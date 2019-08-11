<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<%
//This is the GTPay-wide unique identifier of merchant, assigned by //GTPay and communicated to merchant by GTBank after merchant //registration. gtpay_mert_id = "";
// The code used to denote the currency in which transaction was //carried out (566 or 844) gtpay_tranx_curr = "";
//The total monetary value of transaction in Naira or Dollars (not in //kobo or cents as sent in the transaction request) gtpay_tranx_amt = "";
// The merchant-wide unique transaction identifier, sent by merchant in //the transaction request sent gtpay_tranx_id = "";
String gtpay_cust_name = "Sam Jacob"; //Name of the customer
String gtpay_tranx_noti_url = "http://www.hypertrac.biz/"; //url for transaction notification
//Will be provided on setup. Please keep the value secure hashkey = "";
// The merchant-wide unique identifier for the payer gtpay_cust_id = "";
// The miscellaneous data merchant sent earlier and wants returned at
//transaction completion
String gtpay_echo_data = "DEQFOOIPP0;REG13762;John Adebisi: 2nd term school and accomodation fees;XNFYGHT325541;1209";
// The name of the gateway that serviced transaction. This will be //either webpay, migs or ibank
String gtpay_gway_name = "webpay";
// This describes the transaction to the customer. For example,
//gtpay_tranx_memo = "John Adebisi (REG13762) : 2nd Term School Fees
//Payment"
//If not sent, "Purchase from [Business-Name-Of-Merchant]" will be //used
int gtpay_mert_id = 824;
String gtpay_tranx_memo = "John Adebisi (REG13762) : 2nd Term School Fees";
int gtpay_tranx_amt = 200;
String gtpay_tranx_id = "99029223234";
int gtpay_tranx_curr = 826;
int gtpay_cust_id = 1;
String hashkey = "";
String gTPayKey = "D3D1D05AFE42AD50818167EAC73C109168A0F108F32645C8B59E897FA930DA44F9230910DAC9E20641823799A107A02068F7BC0F4CC41D2952E249552255710F";
// Merchants are required to perform a sha512* hash of
//[gtpay_mert_id,gtpay_tranx_id,gtpay_tranx_amt,gtpay_tranx_curr,gtp
//ay_cust_id,gtpay_tranx_noti_url,hashkey]		
		
String gtpayHash=gtpay_mert_id+gtpay_tranx_id+gtpay_tranx_amt+gtpay_tranx_curr+gtpay_cust_id+gtpay_tranx_noti_url+gTPayKey;

try {
    MessageDigest md = MessageDigest.getInstance("SHA-512");
    byte[] bytes = md.digest(gtpayHash.getBytes(StandardCharsets.UTF_8));
    StringBuilder sb = new StringBuilder();
    for(int i=0; i< bytes.length ;i++){
       sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
    }
    hashkey = sb.toString();
   } 
  catch (NoSuchAlgorithmException e){
   e.printStackTrace();
  }
String val = "cc8cbcba8ba975d887e90c5e76aef155c63c9f365127e4a038775f658550ad2d5f59ae31e8f47b4f5ed54690f48c9b170b2fccb3b29274763a81b784d1bae72d";
%>
Html Form Code
<html>
<body onload="document.submit2gtpay_form.submit()">
<form name="submit2gtpay_form" action="https://ibank.gtbank.com/GTPay/Tranx.aspx" target="_self" method="post">
<input type="hidden" name="gtpay_mert_id" value="<%=gtpay_mert_id %>" />
<input type="hidden" name="gtpay_tranx_id" value="<%=gtpay_tranx_id %>" />
<input type="hidden" name="gtpay_tranx_amt" value="<%=gtpay_tranx_amt %>" />
<input type="hidden" name="gtpay_tranx_curr" value="<%=gtpay_tranx_curr %>" />
<input type="hidden" name="gtpay_cust_id" value="<%=gtpay_cust_id %>" />
<input type="hidden" name="gtpay_cust_name" value="<%=gtpay_cust_name %>" />
<input type="hidden" name="gtpay_tranx_memo" value="<%=gtpay_tranx_memo %>" />
<input type="hidden" name="gtpay_echo_data" value="<%=gtpay_echo_data %>" />
<input type="hidden" name="gtpay_gway_name" value="webpay" />
<input type="hidden" name="gtpay_hash" value="<%=val %>" />
<input type="hidden" name="gtpay_tranx_noti_url" value="<%=gtpay_tranx_noti_url %>" />
<input type="hidden" name="gtpay_echo_data" value="<%=gtpay_echo_data %>">
</form>
</body>
</html>