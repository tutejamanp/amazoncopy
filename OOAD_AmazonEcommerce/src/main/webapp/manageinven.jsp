<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>


<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

<!-- jQuery -->
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

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

<!-- custom javascript -->
<script src="js/script.js" type="text/javascript"></script>
<script src="js/scripts/manageinventory.js" type="text/javascript"></script>

<script type="text/javascript">

</script>

</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
	<main class="col-sm-12">

<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Product</th>
  <th scope="col" width="120">Price</th>
  <th scope="col" width="120">Quantity</th>
  <th scope="col" class="text-right" width="200">Action</th>
</tr>
</thead>
<tbody id="shipments">


</tbody>
</table>
</div> <!-- card.// -->

	</main> <!-- col.// -->
	
</div>

</div> <!-- container .//  -->
</section>

 


<!-- ========================= FOOTER ========================= -->
<footer class="section-footer background-amazon">
	<div class="container">
		<section class="footer-top padding-top">
			<div class="row">
				<aside class="col-sm-3"></aside>
				<aside class="col-sm-3  col-md-3 white">
					<h5 class="title">My Account</h5>
					<ul class="list-unstyled">
						<li> <a href="404.jsp"> User Login </a></li>
						<li> <a href="404.jsp"> User register </a></li>
						<li> <a href="404.jsp"> Account Setting </a></li>
						<li> <a href="404.jsp"> My Orders </a></li>
						<li> <a href="404.jsp"> My Wishlist </a></li>
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
						    <a class="btn btn-facebook" title="Facebook" target="_blank" href="404.jsp"><i class="fab fa-facebook-f  fa-fw"></i></a>
						    <a class="btn btn-instagram" title="Instagram" target="_blank" href="404.jsp"><i class="fab fa-instagram  fa-fw"></i></a>
						    <a class="btn btn-youtube" title="Youtube" target="_blank" href="404.jsp"><i class="fab fa-youtube  fa-fw"></i></a>
						    <a class="btn btn-twitter" title="Twitter" target="_blank" href="404.jsp"><i class="fab fa-twitter  fa-fw"></i></a>
						</div>
					</article>
				</aside>
			</div> <!-- row.// -->
			<br> 
		</section>
		
	</div><!-- //container -->
</footer>
<!-- ========================= FOOTER END // ========================= -->

<script src="scripts/default.js" type="text/javascript"></script>

</body>

</html>