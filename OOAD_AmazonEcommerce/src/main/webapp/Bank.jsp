<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>

<script type="text/javascript">

$(document).ready(function(){
	console.log("here");

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
		console.log(responsebirthdate);
		console.log(currentdate);
		console.log(currentdate.getMonth());
		console.log(responsebirthdate.getMonth());
		console.log(currentdate.getDate());
		console.log(responsebirthdate.getDate());
		if(currentdate.getMonth() == responsebirthdate.getMonth()+1 &&  currentdate.getDate() == responsebirthdate.getDate() ){
		console.log("happy birthday");
		is_birthday = true;
		}
	}
});

</script>


<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

<!-- jQuery -->
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="js/ajax/add_money.js"></script>


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
<script src="js/scripts/addProduct.js" type="text/javascript"></script>

</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
	<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
    <div class="card-header bg-white">My Mock Bank! <a href="404.jsp" data-toggle="popover" data-trigger="hover" data-title="Mock Bank" data-content="Mock Banking System To Put In Initial Money" ><small>See All Details</small></a> Your Current Balance Is : <span id="bank_amount"></span></div>
    <div class="card-body">
<div class="row row-sm">
   
    <div class="col-md-12">
 
<!-- ================= main slide ================= -->
<form>
    <div class="form-row">
        <div class="col form-group">
            <label>First name</label>
            <input type="text" class="form-control  required" placeholder="">
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Last name</label>
            <input type="text" class="form-control  required" placeholder="">
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-group">
        <label>Email address</label>
        <input type="email" class="form-control  required" placeholder="">
        <small class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div> <!-- form-group end.// -->
   
   
    <div class="form-row">
        <div class="form-group col-md-6">
          <label>City</label>
          <input type="text" class="form-control  required">
        </div> <!-- form-group end.// -->
        <div class="form-group col-md-6">
          <label>Country</label>
          <select id="inputState" class="form-control  required">
            <option> Choose...</option>
              <option>Uzbekistan</option>
              <option>Russia</option>
              <option >United States</option>
              <option selected="">India</option>
              <option>Afganistan</option>
          </select>
        </div> <!-- form-group end.// -->
    </div> <!-- form-row.// -->
    <div class="form-group">
        <label>Amount To Add</label>
        <input class="form-control  required" name="amount" id="money" type="numeric">
    </div> <!-- form-group end.// -->  
       
    <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>          
 
 
<div class="row">
    <div class="col-sm-8">
        <div class="form-group">
            <label><span class="hidden-xs">Expiration</span> </label>
            <div class="form-inline">
                <select class="form-control  required" style="width:45%">
                  <option>MM</option>
                  <option>01 - Janiary</option>
                  <option>02 - February</option>
                  <option>03 - March</option>
                  <option>04 - April</option>
                  <option>05 - May</option>
                  <option>06 - June</option>
                  <option>07 - July</option>
                  <option>08 - August</option>
                  <option>09 - September</option>
                  <option>10 - October</option>
                  <option>11 - November</option>
                  <option>12 - December</option>
                </select>
                <span style="width:10%; text-align: center"> / </span>
                <select class="form-control required" style="width:45%">
                  <option>YY</option>
                  <option>2018</option>
                  <option>2019</option>
                  <option>2020</option>
                  <option>2021</option>
                  <option>2022</option>
                  <option>2023</option>
                  <option>2024</option>
                  <option>2025</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group">
            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
            <input class="form-control" required="" type="password">
        </div> <!-- form-group.// -->
    </div>
</div> 
 
<div class="form-group">
        <button type="button" class="btn btn-primary btn-block" onclick="add_amount()"> Add Amount  </button>
    </div> <!-- form-group// -->  
</form>
<!-- ============== main slidesow .end // ============= -->
 
    </div> <!-- col.// -->
</div> <!-- row.// -->
    </div> <!-- card-body .// -->
</div> <!-- card.// -->
 
 
</div> <!-- container .//  -->
</section>
	
	
</div> <!-- card.// -->
</div><!-- card.// -->



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