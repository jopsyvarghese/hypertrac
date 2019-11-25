<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hypertrac.dao.database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%
Helper helper = new Helper();
int myId = 0;
Connection con = database.getConnection();
try {
	myId = Integer.parseInt(session.getAttribute("loggedInUserId").toString());	
} catch(Exception e) {
	response.sendRedirect("../logout.jsp");
}

String currentPwd = request.getParameter("oldPwd");
String newPwd = request.getParameter("newPwd");
String redirectHeader = request.getParameter("redirectHeader");

String sql = "UPDATE auth SET pwd = ? WHERE id=? AND pwd=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, helper.encryptPwd(newPwd));
ps.setInt(2, myId);
ps.setString(3, helper.encryptPwd(currentPwd));
int i = ps.executeUpdate();
String status = "failed";
if(i > 0) {
	status = "success";
	// Send Email To User that password is changed... 
	String email = helper.getEmailById(myId);
	if(email.length() > 2) {
	String host = "localhost";//or IP address  
	final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	Properties props = System.getProperties();
	props.setProperty("mail.smtp.host", "smtp.gmail.com");
	props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	props.setProperty("mail.smtp.socketFactory.fallback", "false");
	props.setProperty("mail.smtp.port", "465");
	props.setProperty("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.debug", "true");
	props.put("mail.store.protocol", "pop3");
	props.put("mail.transport.protocol", "smtp");
	final String username = "hypertracltd@gmail.com";//
	final String password = "hyper.123";
	try{
	Session sessionObj = Session.getInstance(props, 
	                     new Authenticator(){
	                        protected PasswordAuthentication getPasswordAuthentication() {
	                           return new PasswordAuthentication(username, password);
	                        }});
	Message msg = new MimeMessage(sessionObj);
	
	
  msg.setSubject("HyperTrac: Password Changed");
  msg.setContent("<h4>Hi, Your Password has been changed..!! If not done by you.. Please contact support </h4>", "text/html");
  msg.setRecipients(Message.RecipientType.TO, 
                    InternetAddress.parse(email,false));
	msg.setSentDate(new Date());
	Transport.send(msg);
	
	}catch (MessagingException e){ System.out.println("Error: " + e);}
	} else {
		System.out.println("Password Changed, But Invalid Email Address");
	}
}
response.sendRedirect("profile.jsp?status="+status+"&q="+redirectHeader);
%>