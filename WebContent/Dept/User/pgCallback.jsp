<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<html>
<head></head>
<body>
	<%
	// Need to check this again.
	
		/* String gtpay_mert_id = "";
		String gtpay_tranx_id = request.getParameter("gtpay_tranx_id");
		String gtpay_tranx_amt_small_denom = request.getParameter("gtpay_tranx_amt_small_denom");
		String gtpay_tranx_status_code = request.getParameter("gtpay_tranx_status_code");
		String gtpay_tranx_curr = request.getParameter("gtpay_tranx_curr");
		String gtpay_tranx_amt = request.getParameter("gtpay_tranx_amt");
		String hashkey = "";
		String gtpay_full_verification_hash = request.getParameter("gtpay_full_verification_hash");
		String your_verification_harsh = gtpay_tranx_id + gtpay_tranx_amt_small_denom + gtpay_tranx_status_code
				+ gtpay_tranx_curr + hashkey;
		try {
		    MessageDigest md = MessageDigest.getInstance("SHA-512");
		    byte[] bytes = md.digest(your_verification_harsh.getBytes(StandardCharsets.UTF_8));
		    StringBuilder sb = new StringBuilder();
		    for(int i=0; i< bytes.length ;i++){
		       sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
		    }
		    hashkey = sb.toString();
		   } 
		  catch (NoSuchAlgorithmException e){
		   e.printStackTrace();
		  }
		your_verification_harsh = hashkey;
		String my_veri_harsh = "7155ce1725a438cbcce46e53862ace5b73cfb1e7aafa24e2e264c24ab2dc01da612ade1ff6bf56f38f78d73a6c29f9c99965a7e3ee326f9349254739e350b954";
		gtpay_full_verification_hash = gtpay_full_verification_hash.toLowerCase();
		your_verification_harsh = my_veri_harsh.toLowerCase();
		//Compare to ensure verification harsh matches
		if (gtpay_full_verification_hash == your_verification_harsh) {
			//confirm trassaction authenticity from GT Webservice
			hash_req = hash("sha512", gtpay_mert_id.gtpay_tranx_id.hashkey);
		}
		//Parameters to send to GT WebService
		//mertid, amount, tranxid, hash
		params = "mertid=" + gtpay_mert_id + "&amount=" + gtpay_tranx_amt_small_denom + "&tranxid=" + gtpay_tranx_id
				+ "&hash=" + hash_req;
		//Use e.g PHP Curl library to send request and get result
		result = "https://ibank.gtbank.com/GTPayService/gettransactionstatus.json?" + params;
		//Send request to GTWebService
		result = json_decode(result, true);
		print_r(result); */
	%>
</body>
</html>
