<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HyperTrac</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<!-- =======================================================
        Theme Name: HyperTrac
        Theme URL: http://www.preatech.com/HyperTrac-bootstrap-business-template/
        Author: BootstrapMade.com
        License: http://www.preatech.com/license/
      ======================================================= -->
</head>

<body onload="onLoadFunc()">
<%
String fname = "";
String addr = "";
String email = "";
String mob = "";
String dob = "";
String uname = "";
String pwd = "";
int role = 0;
String rc = "";
String status = "";
	if(request.getParameter("fname") !=null) {
		fname = request.getParameter("fname");
	}
	if(request.getParameter("addr") != null) {
		addr = request.getParameter("addr");
	}
	if(request.getParameter("email") != null) {
		email = request.getParameter("email");
	}
	if(request.getParameter("mob") != null) {
		mob = request.getParameter("mob");
	}
	if(request.getParameter("dob") != null) {
		dob = request.getParameter("dob");
	}
	if(request.getParameter("uname") != null) {
		uname = request.getParameter("uname");
	}
	if(request.getParameter("role") != null) {
		role = Integer.parseInt(request.getParameter("role"));
	}
	if(request.getParameter("rc") != null) {
		rc = request.getParameter("rc");
	}
%>
	<!--==========================
Header
============================-->
	<header id="header" class="fixed-top">
		<div class="container">

			<div class="logo float-left">
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <h1 class="text-light"><a href="#header"><span>HyperTrac</span></a></h1> -->
				<a href="#intro" class="scrollto"> <img src="img/logo.png"
					alt="" class="img img-fluid">
				</a>
			</div>

			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li class="active"><a href="index.jsp">Home</a></li>
					<li class="drop-down"><a href="">My Account</a>
						<ul>
							<li><a href="signin.jsp">Login</a></li>
							<li><a href="register.jsp">Register</a></li>
							<!-- <li><a href="#">Drop Down 5</a></li> -->
						</ul></li>
				</ul>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>
	<!-- #header -->

	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div style="margin-top: 100px; margin-bottom: 100px;">
					<h3 class="text-center">Register Now</h3>
					
					<%
						if(email.length() > 0 || uname.length() > 0) {
					%>
					<div class="alert alert-danger alert-dismissible fade show">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>Email ID / Username </strong>  Already Taken. Please try different one.
					</div>
					<%
						}
					%>
					
					
					
					<form action="SignUp" method="post" style="text-align: center"
						onsubmit="return validate()">
						<table>
							<tr>
								<td>Registering As</td>
								<td><select name="role" class="form-control" id="role"
									onchange="checkRc()">
										<option value="">Please Select Type</option>
										<option value="0" <% if(role==0) out.print("selected"); %>>Contractor (Company)</option>
										<option value="4" <% if(role==4) out.print("selected"); %>>Individual</option>
								</select></td>
							</tr>
							<tr>
								<td>(Company/Individual) Name</td>
								<td><input type="text" name="fname" class="form-control"
									required value="<%=fname%>"></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><textarea name="addr" class="form-control" required><%=addr%></textarea>
								</td>
							</tr>
							<tr>
								<td>Username</td>
								<td><input type="text" name="uname" id="uname"
									class="form-control" required  value="<%=uname%>"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" id="pwd"
									class="form-control" required style="width: 85%; float: left;"><a
									class="form-control"><i class="fa fa-eye"
										style="width: 4%;" onclick="mouseoverPass();"></i></a></td>
							</tr>
							<tr>
								<td>Confirm Password</td>
								<td><input type="password" name="cpwd" id="cpwd"
									class="form-control" required style="width: 85%; float: left;"><a
									class="form-control"><i class="fa fa-eye"
										style="width: 4%;" onclick="mouseoverPass2();"></i></a></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="email" name="email" id="email"
									class="form-control" required  value="<%=email%>"></td>
							</tr>
							<tr>
								<td>Mobile</td>
								<td><input type="number" name="mob" id="mob"
									class="form-control" required  value="<%=mob%>"></td>
							</tr>
							<tr id="dobTr">
								<td>Date Of Birth</td>
								<td><input type="date" name="dob" class="form-control" value="<%=dob%>"></td>
							</tr>
							<tr id="rcTr">
								<td>RC Number</td>
								<td><input type="text" name="rc" id="rc"
									class="form-control"  value="<%=rc%>" placeholder="Optional for Individuals">
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="Register"
									class="btn btn-success" /></td>
							</tr>
						</table>


					</form>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<!--==========================
Footer
============================-->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-6 footer-info">
						<h3>HyperTrac</h3>
						<p>HYPERTRAC helps in reducing the stress of following the
							update of your file thereby making individuals always going to
							the office premises which can lead to health problems or cause
							accidents as the case may be. In this case your files are being
							monitored remotely from the convenience of your home or office
							giving you actual and detailed updates of your work.</p>
						<div class="footer-newsletter">
							<small>Subscribe to our news letter for latest updates</small>
							<form action="newsLetter.jsp" method="post">
								<input type="email" name="email" required
									placeholder="Type Your Email ID..."><input
									type="submit" value="Subscribe">
							</form>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Link</h4>
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">About us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Terms of service</a></li>
							<li><a href="#">Privacy policy</a></li>
						</ul>
					</div>

					<div class="col-lg-5 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							<small><strong>Nigeria</strong>: House 2,"E" close, Kado
								estate, FCT-Abuja.Nigeria. </small><br /> <span class="fa fa-phone"></span>
							+234 9019 2202 02 / +234 7088 2200 22<br /> <small><strong>UK</strong>:
								Flat 1, Burnell House, High Trees Bus-Stop, SW2-3PF, Tulse Hill,
								London.</small><br /> <span class="fa fa-phone"></span> +44 7956 674946<br />
							<small><strong>India</strong>: CS-5 heavenly plaza, Civil
								line road Kakkanad,Cochin-21.</small><br /> <span class="fa fa-phone"></span>
							+91 8105394675 <br /> <small><strong>Email:
									info@hypertrac.online</strong></small><br />
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>Preatech Technologies Pvt Ltd</strong>.
			</div>
			<div class="credits"></div>
		</div>
	</footer>
	<!-- #footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/mobile-nav/mobile-nav.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<script>
		function validate() {
			var regEx = /(?=^.{6,20}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$/;
			var role = document.getElementById("role").value;
			var rc = document.getElementById("rc").value;
			var pwd = document.getElementById("pwd").value;
			var cpwd = document.getElementById("cpwd").value;
			var email = document.getElementById("email").value;
			var mob = document.getElementById("mob").value;
			var uname = document.getElementById("uname").value;
			if (pwd != cpwd) {
				alert("Passwords doesn't match");
				return false;
			}
			if (!pwd.match(regEx)) {
		        alert("Password Should be combination of Capital letter,Small letter,Number and/or Special Characters");
		        return false;
		    }
			if (role == "0" && rc.length > 2) {
				return true;
			} else if (role == "0" && rc.length <= 2) {
				alert("Please provide your correct RC Number");
				return false;
			}
			return true;

		}
		async function mouseoverPass(obj) {
			var x = document.getElementById("pwd");
			  if (x.type === "password") {
			    x.type = "text";
			    await sleep(1000);
			    x.type = "password";
			  } else {
			    x.type = "password";
			  }
		}
		async function mouseoverPass2(obj) {
			var x = document.getElementById("cpwd");
			  if (x.type === "password") {
			    x.type = "text";
			    await sleep(1000);
			    x.type = "password";
			  } else {
			    x.type = "password";
			  }
		}
		function sleep(ms) {
			  return new Promise(resolve => setTimeout(resolve, ms));
		}
		function checkRc() {
			var role = document.getElementById("role").value;
			if (role == 4) {
				document.getElementById("rcTr").style.visibility = "collapse";
				document.getElementById("dobTr").style.visibility = "visible";
			} if (role == 0) {
				document.getElementById("rcTr").style.visibility = "visible";
				document.getElementById("dobTr").style.visibility = "collapse";
			}
		}
		function onLoadFunc() {
			//document.getElementById("dobTr").style.display="collapse";
			var role = document.getElementById("role").value;
			if (role == 4) {
				document.getElementById("rcTr").style.visibility = "collapse";
				document.getElementById("dobTr").style.visibility = "visible";
			} if (role == 0) {
				document.getElementById("rcTr").style.visibility = "visible";
				document.getElementById("dobTr").style.visibility = "collapse";
			} 
		}
	</script>
</body>
</html>