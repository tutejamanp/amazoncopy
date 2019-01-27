<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript"></script>


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
<link href="css/custom.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

<!-- custom javascript -->
<script src="js/script.js" type="text/javascript"></script>

<script type="text/javascript">

var next = 1;			// fixed, please do not modfy;
var current = 0;		// fixed, please do not modfy;
var interval = 4000;	// You can set single picture show time;
var fadeTime = 800;	// You can set fadeing-transition time;
var imgNum = 5;		


function nextFadeIn(){
	//make image fade in and fade out at one time, without splash vsual;
	$('.fadeImg img').eq(current).delay(interval).fadeOut(fadeTime)
	.end().eq(next).delay(interval).hide().fadeIn(fadeTime, nextFadeIn);
	    
	// if You have 5 images, then (eq) range is 0~4 
	// so we should reset to 0 when value > 4; 
	if(next < imgNum-1){ next++; } else { next = 0;}
	if(current < imgNum-1){ current++; } else { current =0; }
};
$(document).ready(function(){
console.log("here");

var api;
api = "http://localhost:8055/amazon/webapi/AdvertismentController/advertisments";


$.get(api , function(data, status){
    console.log("hello");
    myString = "";
	for(i=0;i< data.length;i++)
		{
		if(i == 0) {
			var myString = myString+ "<div class='item-slide'>		<img src='http://localhost:8055/amazon/"+data[i].url+"'>		</div>";

		} else {
			var myString = myString+ "<div class='item-slide'>		<img style='display:none' src='http://localhost:8055/amazon/"+data[i].url+"'>		</div>";
	
		}
		
		/* if(i==0){
    		 $('#carouselList').append(
    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'" class="active"></li>'
    		);
    		 $('#carouselAddArea').append(
    				 '<div class="item active">' +
    			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
    			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
    			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
    			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
    			    '</div>'
    		);
		}
		else{
			 $('#carouselList').append(
    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'"></li>'
    		);
			 $('#carouselAddArea').append(
    				 '<div class="item">' +
    			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
    			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
    			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
    			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
    			    '</div>'
    		);
		} */
		}
	$('#myAdverts').html(myString+"");
	
	$('.fadeImg').css('position','relative');
	$('.fadeImg img').css({'position':'absolute','width':'100%','height':'500px'});

	nextFadeIn();
});

});
</script>

</head>
<body>
<header class="section-header background-amazon">
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container row">
	<!-- Amazon Logo -->
	<div class="col-md-3">
  	<a class="navbar-brand" href="#"><img class="logo" src="images/logos/amazon.png" alt="alibaba style e-commerce html template file" title="alibaba e-commerce html css theme"></a>
    <a href="#"  data-toggle="popover" data-trigger="hover" data-title="Unlimited FREE fast delivery, videos, music & more" data-content="Prime members enjoy unlimited free, fast delivery on eligible product items, video streaming, exclusive access to deals and more." style="position:relative; left:-50px;top:10px;"><small>Try Prime</small></a>
	</div>
	<!-- Amazon Logo End -->
	
	<!-- Search Bar -->
    <div class="col-md-5" id="navbarTop">
		<form action="#" class="py-1">
				<div class="input-group w-100">
					<select class="custom-select"  name="category_name">
						<option value="">All type</option>
						<option value="">Special</option>
						<option value="">Only best</option>
						<option value="">Latest</option>
					</select>
				    <input type="text" class="form-control" style="width:50%;" placeholder="Search">
				    <div class="input-group-append">
				      <button class="btn btn-warning" type="submit">
				        <i class="fa fa-search"></i> Search 
				      </button>
				    </div>
			    </div>
		</form>
    </div>
	<!-- Search Bar End -->
	
	<!-- Small Ad -->
	<div class="col-md-4">
		<span class="pull-right"><img src="images/banners/nav_top_ad.jpg"/></span>
	</div>
	<!-- Small Ad End -->
  </div>
</nav>

<section class="header-main shadow-sm">
<div class="container">
<div class="row-sm align-items-center">
	
	
	<!-- Nav Bar Category & Address -->
	<div class="col-lg-7-24 col-sm-3">
	<div class="row">
		<div class="col-sm-6"><i class="fas fa-map-marker-alt"></i>
			<small>Deliver To Tushar</small></br>
			<b>Bengaluru 560010</b>
		</div>
		<div class="col-sm-5 category-wrap dropdown py-1">
		<button type="button" class="btn background-amazon  dropdown-toggle" data-toggle="dropdown" ><b> Shop By Categories</b></button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">Machinery / Mechanical Parts / Tools </a>
			<a class="dropdown-item" href="#">Consumer Electronics / Home Appliances </a>
			<a class="dropdown-item" href="#">Auto / Transportation</a>
			<a class="dropdown-item" href="#">Apparel / Textiles / Timepieces </a>
			<a class="dropdown-item" href="#">Home & Garden / Construction / Lights </a>
			<a class="dropdown-item" href="#">Beauty & Personal Care / Health </a> 
		</div>
	</div>
	</div>
	 
	</div>
	<!-- Nav Bar Category End -->
	<div class="col-lg-10-24 col-sm-8 small text-light">
		<a class="text-light" href="#">Buy Again</a> <a  class="text-light" href="#">Tushar's Amazon</a> <a  class="text-light" href="#">Today's Deals</a> <a class="text-light" href="#">Amazon Pay</a> <a class="text-light" href="#">Sell</a> <a class="text-light" href="#">Customer Service</a>	 <!-- search-wrap .end// -->
	</div> <!-- col.// -->
	<div class="col-lg-7-24 col-sm-12">
		<div class="widgets-wrap float-right row no-gutters py-1">
			<div class="col-auto">
			<div class="widget-header dropdown">
				<a href="#" data-toggle="dropdown" data-offset="20,10">
					<div class="icontext">
						
						<div class="text-wrap text-light">
							<small>Hello, Tushar<br/><b> Your Orders</b>
							<i class="fa fa-caret-down"></i> </small>	
						</div>
					</div>
				</a>
				<div class="dropdown-menu">
				 <!--  dropdown-menu .// -->
			</div>  <!-- widget-header .// -->
			</div> <!-- col.// -->
			
			<a href="#" class="widget-header">
					<div class="icontext">	
						<div class="text-wrap text-light">
						<small>
							Try <br/><b>Prime</b> <i class="fa fa-caret-down"></i> 
						</small>
						</div>
					</div>
				</a>
			</div>
			<div class="col-auto">
			<a href="#" class="widget-header">
					<div class="icontext">	
					
						<div class="text-wrap text-light">
						<small>	Your <br/><b>Lists</b> <i class="fa fa-caret-down"></i> </small>	
						</div>
					</div>
				</a>
			</div>
			<div class="col-auto">
				<a href="#" class="widget-header">
					<div class="icontext">
												<div class="icon-wrap"><i class="text-light icon-sm  fa fa-shopping-cart"></i></div>
						<span class="small round badge badge-secondary">0</span>

						<div class="text-wrap text-light">						
						<small>						
						Cart </small>
						</div>
					</div>
				</a>
			</div> <!-- col.// -->
			 <!-- col.// -->
		</div> <!-- widgets-wrap.// row.// -->
	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- container.// -->
</section> <!-- header-main .// -->
</header> <!-- section-header.// -->

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">

<div class="row row-sm">
	 <!-- col.// -->
	<div class="col-md-12">

		<div class=" fadeImg"  id="myAdverts"></div>


<!-- ================= main slide ================= -->
<!-- ================= main slide ================= -->
<!--   
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
</div> -->
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
	
</div> <!-- row.// -->
<div class="row" style="height:200px;"></div>


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION MAIN END// ========================= -->




<!-- ========================= SECTION ITEMS ========================= -->
<section class="section-request bg padding-y-sm">
<div class="container">
<div class="row-sm">
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/3.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">Good item name</a></h6>
			
			<div class="price-wrap">
				<span class="price-new">$1280</span>
				<del class="price-old">$1980</del>
			</div> <!-- price-wrap.// -->
			
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/4.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">The name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/5.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">Name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/6.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">The name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/3.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">Good item name</a></h6>
			
			<div class="price-wrap">
				<span class="price-new">$1280</span>
				<del class="price-old">$1980</del>
			</div> <!-- price-wrap.// -->
			
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/4.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">The name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/5.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">Name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="images/items/6.jpg"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#">The name of product</a></h6>
			<div class="price-wrap">
				<span class="price-new">$280</span>
			</div> <!-- price-wrap.// -->
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<!-- col // -->
</div> <!-- row.// --> 


</div><!-- container // -->
</section>
<!-- ========================= SECTION ITEMS .END// ========================= -->
<!-- ========================= SECTION RECCOMENDATIONS ====================== -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-header bg-white">Today's Deals <a href="#"><small>See All Details</small></a></div>
	<div class="card-body">
<div class="row row-sm">
	
	<div class="col-md-12">

<!-- ================= main slide ================= -->
<div class="owl-init slider-main owl-carousel" data-items="4" data-nav="true" data-dots="false">
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide3.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
</div>
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION RECCOMENDATIONS .END// =============== -->

<!-- ========================= SECTION RECCOMENDATIONS ====================== -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-header bg-white">Inspired by your browsing history</div>
	<div class="card-body">
<div class="row row-sm">
	
	<div class="col-md-12">

<!-- ================= main slide ================= -->
<div class="owl-init slider-main owl-carousel" data-items="4" data-nav="true" data-dots="false">
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide3.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
</div>
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION RECCOMENDATIONS .END// =============== -->

<!-- ========================= SECTION RECCOMENDATIONS ====================== -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-header bg-white">Related to Items You Viewed</div>
	<div class="card-body">
<div class="row row-sm">
	
	<div class="col-md-12">

<!-- ================= main slide ================= -->
<div class="owl-init slider-main owl-carousel" data-items="4" data-nav="true" data-dots="false">
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide3.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
</div>
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION RECCOMENDATIONS .END// =============== -->


<!-- ========================= SECTION RECCOMENDATIONS ====================== -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-header bg-white">Inspired by wishlist</div>
	<div class="card-body">
<div class="row row-sm">
	
	<div class="col-md-12">

<!-- ================= main slide ================= -->
<div class="owl-init slider-main owl-carousel" data-items="4" data-nav="true" data-dots="false">
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide3.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide1.jpg">
	</div>
	<div class="item-slide">
		<img src="images/banners/slide2.jpg">
	</div>
</div>
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION RECCOMENDATIONS .END// =============== -->


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

<script src="scripts/default.js" type="text/javascript"></script>

</body>

</html>