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

<body>

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
					<li class="active"><a href="#intro">Home</a></li>
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
					<form action="SignUp" method="post" style="text-align: center" onsubmit="return validate()">
						<table>
							<tr>
								<td>Registering As</td>
								<td><select name="role" class="form-control" id="role">
										<option value="0">Contractor (Company)</option>
										<option value="4">Individual</option>
								</select></td>
							</tr>
							<tr>
								<td>(Company/Individual) Name</td>
								<td><input type="text" name="fname" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><textarea name="addr" class="form-control" required></textarea>
								</td>
							</tr>
							<tr>
								<td>Username</td>
								<td><input type="text" name="uname" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd" id="pwd" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>Confirm Password</td>
								<td><input type="password" name="cpwd" id="cpwd" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="email" name="email" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>Mobile</td>
								<td><input type="number" name="mob" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>RC Number</td>
								<td><input type="text" name="rc" id="rc" class="form-control"
									placeholder="Optional for Individuals">
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
					<%
						String status = "";
						status = (String) request.getAttribute("status");
						if (status != "" && status != null) {
							out.println(status);
						}
					%>
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
						<p>Cras fermentum odio eu feugiat lide par naso tierra. Justo
							eget nada terra videa magna derita valies darta donna mare
							fermentum iaculis eu non diam phasellus. Scelerisque felis
							imperdiet proin fermentum leo. Amet volutpat consequat mauris
							nunc congue.</p>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">About us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Terms of service</a></li>
							<li><a href="#">Privacy policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br> <strong>Phone:</strong> +1 5589 55488 55<br>
							<strong>Email:</strong> info@example.com<br>
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>

					<div class="col-lg-3 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna veniam enim veniam illum dolore legam minim quorum
							culpa amet magna export quem marada parida nodela caramase seza.</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
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
	 var role = document.getElementById("role").value;
	 var rc = document.getElementById("rc").value;
	 var pwd = document.getElementById("pwd").value;
	 var cpwd = document.getElementById("cpwd").value;
	 if(pwd != cpwd) {
		 alert("Passwords doesn't match");
		 return false; 
	 } if (role == "0" && rc.length > 2) {
		 return true;
	 } else if(role == "0" && rc.length <= 2){
		 alert("Please provide your correct RC Number");
		 return false;
	 }
	 return true;
	 
 }
</script>
</body>
</html>