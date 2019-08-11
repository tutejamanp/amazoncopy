<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>

<script type="text/javscript" src="js/scripts/cartManagement.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

<!-- jQuery -->
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Bootstrap4 files-->
<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

<!-- Font awesome 5 -->
<link href="fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">

<!-- plugin: owl carousel  -->
<link href="plugins/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="plugins/owlcarousel/assets/owl.theme.default.css" rel="stylesheet">

<script src="plugins/owlcarousel/owl.carousel.min.js"></script>

<!-- custom style -->
<link href="css/ui.css" rel="stylesheet" type="text/css"/>
<link href="css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
<link href="css/custom.css" rel="stylesheet"  />
<link href="css/review.css" rel="stylesheet"  />

<!-- custom javascript -->
<script src="js/ajax/viewProduct.js" type="text/javascript" defer></script>
<script src="js/scripts/cartManagement.js" type="text/javascript" defer></script>
<script src="js/review.js"></script>
<script src="js/ajax/leaveRating.js"></script>

<script type="text/javascript">

</script>

</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">

<div class="row">
<div class="col-xl-12 col-md-12 col-sm-12">


<main class="card">
	<div class="row no-gutters">

<!------ Include the above in your HEAD tag ---------->
</head>
<body>
<div class="container">
    <div class="row">
   	<h2>Feedback</h2>
   	
   	
    <table width="100%" border="0">
      <div class="col-md-9 col-md-offset-0">
        <tr><td width="77%">
        <div class="">
          <form class="form-horizontal" id="ratingForm" method="post">
          <fieldset>
    
            <!-- Name input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="name">Full Name</label>
              <div class="col-md-9">
                <input id="name" name="headline" type="text" placeholder="Title For Review" class="form-control">
              </div>
            </div>
    
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">Your message</label>
              <div class="col-md-9">
                <textarea class="form-control" id="message" name="description" placeholder="Please enter your feedback here..." rows="5"></textarea>
              </div>
            </div>


            <!-- Rating -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">Your rating</label>
              <div class="col-md-9">
                <input id="input-21e" name="rating" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
              </div>
            </div>
			
			<div class="form-group">
              <div class="col-md-12 text-center">
                <button type="button" id="leaveRating" class="btn btn-primary btn-md" onClick="make_review();">Leave Rating</button>
                <button type="reset" class="btn btn-default btn-md">Clear</button>
              </div>
            </div>
			          </fieldset>

    </td>
    
            <!-- Form actions -->
            
          </form>
        </div>
    </div>
    </td>
    </tr>
    </table>
</div>

	</div> <!-- row.// -->
</main> <!-- card.// -->

<!-- PRODUCT DETAIL -->

<!-- PRODUCT DETAIL .// -->

</div> <!-- col // -->

</div> <!-- row.// -->

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION MAIN END// ========================= -->

<!-- ========================= SECTION SUBSCRIBE ========================= -->
<section class="section-subscribe background-amazon padding-y-lg">
<div class="container">

<p class="pb-2 text-center white">Delivering the latest product trends and industry news straight to your inbox</p>

<div class="row justify-content-md-center">
	<div class="col-lg-4 col-sm-6">
<form class="row-sm form-noborder">
		<div class="col-8">
		<input class="form-control" placeholder="Your Email" type="email">
		</div> <!-- col.// -->
		<div class="col-4">
		<button type="button" class="btn btn-block btn-warning"> <i class="fa fa-envelope"></i> Subscribe </button>
		</div> <!-- col.// -->
</form>
<small class="form-text text-white-50">We’ll never share your email address with a third-party. </small>
	</div> <!-- col-md-6.// -->
</div>
	

</div> <!-- container // -->
</section>
<!-- ========================= SECTION SUBSCRIBE END.//========================= -->

<!-- ========================= FOOTER ========================= -->
<footer class="section-footer background-amazon">
	<div class="container">
		<section class="footer-top padding-top">
			<div class="row">
				<aside class="col-sm-3"></aside>
				<aside class="col-sm-3  col-md-3 white">
					<h5 class="title">My Account</h5>
					<ul class="list-unstyled">
						<li> <a href="#"> User Login </a></li>
						<li> <a href="#"> User register </a></li>
						<li> <a href="#"> Account Setting </a></li>
						<li> <a href="#"> My Orders </a></li>
						<li> <a href="#"> My Wishlist </a></li>
					</ul>
				</aside>
				
				<aside class="col-sm-3">
					<article class="white">
						<h5 class="title">Contacts</h5>
						<p>
							<strong>Phone: </strong> +123456789 <br> 
						    <strong>Fax:</strong> +123456789
						</p>

						 <div class="btn-group white">
						    <a class="btn btn-facebook" title="Facebook" target="_blank" href="#"><i class="fab fa-facebook-f  fa-fw"></i></a>
						    <a class="btn btn-instagram" title="Instagram" target="_blank" href="#"><i class="fab fa-instagram  fa-fw"></i></a>
						    <a class="btn btn-youtube" title="Youtube" target="_blank" href="#"><i class="fab fa-youtube  fa-fw"></i></a>
						    <a class="btn btn-twitter" title="Twitter" target="_blank" href="#"><i class="fab fa-twitter  fa-fw"></i></a>
						</div>
					</article>
				</aside>
			</div> <!-- row.// -->
			<br> 
		</section>
		
	</div><!-- //container -->
</footer>
<!-- ========================= FOOTER END // ========================= -->


</body>

</html>