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
				<jsp:include page="header.jsp"></jsp:include>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>
	<!-- #header -->

	<!--==========================
      Contact Section
    ============================-->
	<section id="contact">
		<div class="container-fluid">

			<div class="section-header">
				<br />&nbsp;<br />
				<h3>Contact Us</h3>
			</div>

			<div class="row wow fadeInUp">

				<!-- <div class="col-lg-6">
             <div class="map mb-4 mb-lg-0">
              <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 312px;" allowfullscreen></iframe>
            </div>
          </div> -->

				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="row">
						<div class="col-md-5 info">
							<i class="ion-ios-location-outline"></i>
							<p><strong>Nigeria:</strong> House 2, "E" close, Kado estate, FCT-Abuja.Nigeria.</p>
						</div>
						<div class="col-md-3 info">
							<i class="ion-ios-email-outline"></i>
							<p>info@hypertrac.online</p>
						</div>
						<div class="col-md-4 info">
							<i class="ion-ios-telephone-outline"></i>
							<p>+234 9019 2202 02 / +234 7088 2200 22</p>
						</div>
						
						
						<div class="col-md-5 info">
							<i class="ion-ios-location-outline"></i>
							<p><strong>UK:</strong> Flat 1, Burnell House, High Trees Bus-Stop, SW2-3PF, Tulse Hill, London.</p>
						</div>
						<div class="col-md-3 info">
							<!-- <i class="ion-ios-email-outline"></i>
							<p>info@hypertrac.online</p> -->
						</div>
						<div class="col-md-4 info">
							<!-- <i class="ion-ios-telephone-outline"></i>
							<p>+234 9019 2202 02 / +234 7088 2200 22</p> -->
						</div>
						
						<div class="col-md-5 info">
							<i class="ion-ios-location-outline"></i>
							<p><strong>India:</strong> CS-5 heavenly plaza, Civil line road Kakkanad,Cochin-21</p>
						</div>
						<div class="col-md-3 info">
							<!-- <i class="ion-ios-email-outline"></i>
							<p>info@hypertrac.online</p> -->
						</div>
						<div class="col-md-4 info">
							<i class="ion-ios-telephone-outline"></i>
							<p>+91 81053 94675</p>
						</div>
					</div>

					<div class="form">
						<form action="submitQuery.jsp" method="post" class="contactForm">
							<div class="form-row">
								<div class="form-group col-lg-6">
									<input type="text" name="name" class="form-control" id="name"
										placeholder="Your Name" data-rule="minlen:4"
										data-msg="Please enter at least 4 chars" />
								</div>
								<div class="form-group col-lg-6">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="Your Email" data-rule="email"
										data-msg="Please enter a valid email" />
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									data-rule="required" data-msg="Please write something for us"
									placeholder="Message"></textarea>
							</div>
							<div class="text-center">
								<button type="submit" title="Send Message">Send Message</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>

		</div>
	</section>
	<!-- #contact -->

	</main>

	<!--==========================
    Footer
  ============================-->
	<footer id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
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
	
	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
