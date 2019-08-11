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
<link href="css/review_product.css" rel="stylesheet"  />

<!-- custom javascript -->
<script src="js/ajax/viewProduct.js" type="text/javascript" defer></script>
<script src="js/scripts/cartManagement.js" type="text/javascript" defer></script>
<script src="js/scripts/wishManagement.js" type="text/javascript" defer></script>
<script type="text/javascript">
$(document).ready(function(){
	viewProduct();
	displayComments();


		var udata = JSON.parse(localStorage.getItem("userdata"));
		var is_birthday = false;

		if(udata == null) {
			$('#nameText').text("Hello, Sign In");
			//$('#deliverTo').text("");
			//$('#myAmazon').text("Your Amazon");m
		} else {
			$('#nameText').text("Hello, " + udata.fname);
			$('#deliverTo').text("Deliver To, " + udata.fname);
			$('#myAmazon').text(udata.fname+"'s Amazon");
			$('#signInButton').hide();
			var responsebirthdate = new Date(udata.dob);
			var currentdate = new Date ();
			
			if(currentdate.getMonth() == responsebirthdate.getMonth()+1 &&  currentdate.getDate() == responsebirthdate.getDate() ){
		//	$('#birthday_price').html("<span class=\"currency\">INR </span><span class=\"num\" id=\"discountedPrice\">"++"</span>");
			is_birthday = true;
			}
		}

	
	
});
function addcheckoutitems() {
	var product_id = localStorage.getItem("viewingProduct");
	var product_quantity = $('#product_qty').val();
	var offer_type = $('#productoffer').val();
	var offer_start_date = $('#offerStartDate').val();
	var offer_end_date = $('#offerEndDate').val();
	
	console.log(offer_type);
	localStorage.setItem("cartProduct", product_id);
	localStorage.setItem("cartProductQty", product_quantity);
	localStorage.setItem("directBuy", true);
	
	var qtyleft = localStorage.getItem('qtyleft');
	console.log("----------" + localStorage.getItem('qtyleft') + " " +  product_quantity);
	if(Number(qtyleft) >= Number(product_quantity) && (offer_type !="buy3get1" || (offer_type =="buy3get1" && !(Date.now() < offer_end_date && Date.now() >= offer_start_date))) && (offer_type !="buy1get1" || (offer_type =="buy1get1" && !(Date.now() < offer_end_date && Date.now() >= offer_start_date))) ){
		console.log("if0000");
		window.location.href="check_out.jsp";
	}
	else if(offer_type =="buy3get1" || offer_type =="buy1get1"){
		if((offer_type =="buy3get1" && product_quantity>=3)){
			product_quantity = Math.floor((Number(product_quantity)/3))+ Number(product_quantity);
			console.log(product_quantity);
			
			//Buy3Get1
			if(Number(product_quantity) > Number(qtyleft) ){
				console.log("else");
				alert("stock low return");
			}
			else{
				console.log("if0000");
				window.location.href="check_out.jsp";
			}
		} 
		else if(offer_type =="buy1get1" && product_quantity>=1){
			product_quantity = Number(product_quantity)*2;
			if(Number(product_quantity) > Number(qtyleft) ){
				console.log("else");
				alert("stock low return");
			}
			else{
				console.log("if0000");
				window.location.href="check_out.jsp";
			}
		} else {
			console.log("if0000");
			window.location.href="check_out.jsp";
		}
	}
		
	else{
		console.log("else");
		alert("stock low");
	}
		
}
function addwishlistitems() {		
			var product_id = localStorage.getItem("viewingProduct");		
			var udata = JSON.parse(localStorage.getItem("userdata"));		
			console.log(udata);		
			additemintowishlist(product_id,udata.id);		
			console.log("wishlist method was called : manpreet");		
	}
	
function addcartitems() {
	var product_id = localStorage.getItem("viewingProduct");
	var product_quantity = $('#product_qty').val();
	var udata = JSON.parse(localStorage.getItem("userdata"));
	console.log(udata);
	var qtyleft = localStorage.getItem('qtyleft');
	if((Number(qtyleft) >= Number(product_quantity)))
		additemintocart(product_id,product_quantity,udata.id);
	else
		alert("stock low");
	
	//localStorage.setItem("cartProduct", product_id);
	//localStorage.setItem("cartProductQty", product_quantity);
	//localStorage.setItem("directBuy", true);
	//window.location.href="check_out.jsp";
}

</script>

</head>
<body>
<%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">

<div class="row">
<div class="col-xl-10 col-md-9 col-sm-12">

<div id="category_display">&nbsp&nbsp</div><br>
<main class="card">
	<div class="row no-gutters">
		<aside class="col-sm-6 border-right">
<article class="gallery-wrap"> 
<div class="img-big-wrap">
  <div id="itemImage"> <a href="images/items/1.jpg" data-fancybox=""><img src="images/items/1.jpg"></a></div>
</div> <!-- slider-product.// -->
<!-- Image mini slider goes here -->

 <!-- gallery-wrap .end// -->
		</aside>
		<aside class="col-sm-6">
<article class="card-body">
<!-- short-info-wrap -->
<div id="productId">Product Id</div>
	<h3 class="title mb-3" id="productTitle">Loading...</h3>

<div class="mb-3"> 
<var class="price h5 text-danger"> 
		<del class="currency">INR  </del><del class="num" id="originalPrice"></del>
	</var> 
	<br/>
	<var class="price h3 text-success"> 
	
		<span class="currency">INR  </span><span class="num" id="discountedPrice"></span>
	</var>
	<var class="price h3 text-warning" id="birthday_price"> 
	
		
	</var> 
	 <hr/>
	 <var id="expiryDate"></var>
</div> <!-- price-detail-wrap .// -->
<dl>
  <dt>Description</dt>
  <dd><p id="description">Loading... </p></dd>
  <dt>Seller Details</dt>
  <dd><p id="sellerInfo"></p></dd>
</dl>
<dl>
	<dt>Other Info</dt>
	<div id="variableAttr">
	</div>
</dl>

<div class="rating-wrap" id="productRating">

	
	
</div> <!-- rating-wrap.// -->
<hr>
	<div class="row">
		<div class="col-sm-5">
			<dl class="dlist-inline">
			  <dt>Quantity: </dt>
			  <dd> 
			  	<input type="numeric" class="form-control" name="product_quantity" id="product_qty" value="1" />
			  </dd>
			</dl>  <!-- item-property .// -->
				<dl class="dlist-inline">
			  <dt>Quantity Left: </dt>
			  <dd> 
			  	<output type="numeric" class="form-control" name="qty_left" id="qty_left"/>
			  </dd>
			</dl>  <!-- item-property .// -->
		</div> <!-- col.// -->
		<div class="col-sm-7">
			 <!-- item-property .// -->
		</div> <!-- col.// -->
	</div> <!-- row.// -->
	<hr>
	<input type = "hidden" id="productoffer" value ="none"/>
	<input type = "hidden" id="offerStartDate" value ="none"/>
	<input type = "hidden" id="offerEndDate" value ="none"/>
	
	<div id="product_hidden"></div>
	<a href="#" class="btn  btn-warning"  onclick="addcheckoutitems();" > Buy now </a>
	<a href="#" class="btn  btn-outline-warning" onclick="addcartitems();"> <i class="fas fa-shopping-cart"></i> Add to cart </a><hr/>
<a href="#" class="btn  btn-warning"  onclick="addwishlistitems();" > Add to Wishlist </a>	
	<a href="leave_review.jsp" class="btn  btn-success" id="feedbackButton">  Leave Feedback </a>

<!-- short-info-wrap .// -->
</article> <!-- card-body.// -->


		</aside> <!-- col.// -->
		
	</div> <!-- row.// -->
	<div class="container">
    			
		<div class="row" id="myComments">
		
			
		</div>
		
    </div> <!-- /container -->	
	
</main> <!-- card.// -->

<!-- PRODUCT DETAIL -->

<!-- PRODUCT DETAIL .// -->

</div> <!-- col // -->
<aside class="col-xl-2 col-md-3 col-sm-12">

<div class="card mt-3">
	<div class="card-header">
	    You may like
	</div>
	<div class="card-body row">
<div class="col-md-12 col-sm-3">
	<figure class="item border-bottom mb-3">
			<a href="#" class="img-wrap"> <img src="images/items/2.jpg" class="img-md"></a>
			<figcaption class="info-wrap">
				<a href="#" class="title">The name of product</a>
				<div class="price-wrap mb-3">
					<span class="price-new">$280</span> <del class="price-old">$280</del>
				</div> <!-- price-wrap.// -->
			</figcaption>
	</figure> <!-- card-product // -->
</div> <!-- col.// -->
<div class="col-md-12 col-sm-3">
<figure class="item border-bottom mb-3">
		<a class="img-wrap"> <img src="images/items/3.jpg" class="img-md"></a>
		<figcaption class="info-wrap">
			<a href="#" href="#" class="title">The name of product</a>
			<div class="price-wrap mb-3">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
</figure> <!-- card-product // -->
</div> <!-- col.// -->
<div class="col-md-12 col-sm-3">
<figure class="item border-bottom mb-3">
		<a href="#" class="img-wrap"> <img src="images/items/4.jpg" class="img-md"></a>
		<figcaption class="info-wrap">
			<a href="#" class="title">The name of product</a>
			<div class="price-wrap mb-3">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
</figure> <!-- card-product // -->
</div> <!-- col.// -->
	</div> <!-- card-body.// -->
</div> <!-- card.// -->
</aside> <!-- col // -->
</div> <!-- row.// -->

</div> <!-- container .//  -->
</section>


<!-- ========================= PRODUCT REVIEW ============================= -->

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
		<button type="submit" class="btn btn-block btn-warning"> <i class="fa fa-envelope"></i> Subscribe </button>
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

<script src="js/ajax/display_review.js" type="text/javascript"></script>

</body>

</html>