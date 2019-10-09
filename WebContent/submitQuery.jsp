<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");

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
	try {
		Session sessionObj = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		Message msg = new MimeMessage(sessionObj);

		msg.setSubject("Contact Us! User Query");
		msg.setContent("<h2>" + subject + "</h2><br/>" + "<br/><strong>Name : " + name + "<br/>Email : " + email
				+ ",</strong> <br/> <h3>Subject : " + subject + "</h3><br/>" + "<h4>Message : " + message + "</h4>",
				"text/html");
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("info@hypertrac.online", false));
		msg.setSentDate(new Date());
		Transport.send(msg);
		response.sendRedirect("contact.jsp?status=success");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>