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
String email = request.getParameter("email");
String sql = "SELECT id FROM auth WHERE email=?";
Connection con = database.getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, email);
ResultSet rs = null;
rs = ps.executeQuery();
int id = 0;
Date date= new Date();
long time = date.getTime();
String input = "Rd#dlksjdfoueworslf" + time;
String hashtext = "";
//Creating Hash for Password

 try { 
       // getInstance() method is called with algorithm SHA-512 
       MessageDigest md = MessageDigest.getInstance("SHA-512"); 

       // digest() method is called 
       // to calculate message digest of the input string 
       // returned as array of byte 
       byte[] messageDigest = md.digest(input.getBytes()); 

       // Convert byte array into signum representation 
       BigInteger no = new BigInteger(1, messageDigest); 

       // Convert message digest into hex value 
       hashtext = no.toString(16); 

       // Add preceding 0s to make it 32 bit 
       while (hashtext.length() < 32) { 
           hashtext = "0" + hashtext; 
       }
     } catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 

if(rs.next()) {
	id = rs.getInt(1);
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
	
	
  msg.setSubject("HyperTrac: Reset Your Password");
  msg.setContent("<h4>Confidential: Your New Password</h4>"+
		  "Please click below Link to Update your Password<br/> <h3><a href='http://hypertrac.online/Dept/resetPwd.jsp?q="+hashtext+"&email="+email+"'>Reset Password</a></h3>"
		  , "text/html");
  msg.setRecipients(Message.RecipientType.TO, 
                    InternetAddress.parse(email,false));
	msg.setSentDate(new Date());
	Transport.send(msg);
	//Storing Credentials in Table
	String query = "UPDATE auth SET reset_hash=?, pwd_reset=? WHERE id=?";
	PreparedStatement pQuery = con.prepareStatement(query);
	pQuery.setString(1, hashtext);
	pQuery.setInt(2, 1);
	pQuery.setInt(3, id);
	int j = pQuery.executeUpdate();
	if(j > 0) {
		response.sendRedirect("forgotPwd.jsp?status=success");
	} else {
		response.sendRedirect("forgotPwd.jsp?status=failed");	
	}	
	}catch (MessagingException e){ System.out.println("Error: " + e);}
} else {
	response.sendRedirect("forgotPwd.jsp?status=failed");
	out.println("Sorry Not able to send email");
}
con.close();
			
%>