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

<script src="scripts/cardManagement.js" type="text/javascript"></script>

<script type="text/javascript">
	function payment() {
		var filled = true;
		
		var userdata = JSON.parse(localStorage.getItem("userdata"));
		var balance = userdata.bank.amount;
		var cartqty = localStorage.getItem("cartProductQty");
		var cartprice = localStorage.getItem("cartProductValue");
		console.log("balance = " + userdata.bank.amount);
	//	if(balance < cartqty * cartprice){
	//		alert('Your account balance is low!!');
	//	}
		
		$('.required').each(function(){
	        if( $(this).val() == "" ){
			  filled = false;
	          return false;
	        }  
	    });
		
		if(filled == true) {
			console.log("Here");
			var form = new FormData();
			var udata = JSON.parse(localStorage.getItem("userdata"));
			form.append('customerid', udata.id );
			var cartqty = localStorage.getItem("cartProductQty");
			var cartprice = localStorage.getItem("cartProductValue");
			var cost = cartqty * cartprice;
			form.append('quantity', cartqty);
			form.append('productid', localStorage.getItem("viewingProduct"));
			console.log(form);
			
			var data = form;
		    
		    var udata = JSON.parse(localStorage.getItem("userdata"));
		    console.log(udata.emailid);
		    $.ajax({
		    	type: "POST",
				enctype: 'multipart/form-data',
		        url: "http://localhost:8055/amazon.com/webapi/OrderController/saveorder",
		        data: data, 
		       	processData: false,
		        contentType: false,
		        cache: false,
		        async: true,
		        timeout: 600000,
		        
		        success:function(result){
		        	window.alert("Successfully Purchased! :D");
		        	window.location.href="http://localhost:8055/amazon.com/review.html";
		        	//location.reload(true);
		        },
		        error:function(result) {
		        	alert("Balance LOW!!");
		        }
		    });
			//alert("Success. You've purchase the item");
			
			//localStorage.removeItem("cartProductQty");
			//localStorage.removeItem("cartProduct");
			//localStorage.removeItem("directBuy");
			//window.location.href="home.jsp";
		} else {
	          alert('Please fill all the fields');
		}
	}
</script>
</head>
<body>


<script type="text/javascript">


function SignOut() {
	localStorage.removeItem("userdata");
	window.location.href = "http://localhost:8055/amazon.com/";
}

function setCategory(id1) {
	localStorage.setItem("selectedcategory",id1);
	console.log('value of lc is :'+localStorage.getItem("selectedcategory"));
	window.location.href = "http://localhost:8055/amazon.com/search.jsp";
}

	$(document).ready(function(){
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
		
		
		var api;
		api = "http://localhost:8055/amazon.com/webapi/CategoryController/allcategories";


		$.get(api , function(data, status){

		    var myString="";
		   //myString = myString + "<option selected='default'> Select Category</option>";
				
		    for(var i = 0; i < data.length; i++)
			{
		    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
		    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
		    	 myString=myString+"<option class='dropdown-item' value = '"+ data[i].cat_id +"' onclick= 'setCategory("+data[i].cat_id+");'>"+ data[i].categoryname +"</option>";
				console.log(myString);
			}
		   
		    //alert(""+myString);
		    
		    $('#shopbyCat').html(myString);
		   // $('#addsupid').text(0);

				});
	});
</script>
 	    <%@include file="new_header.jsp" %>




<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">


<article class="card col-md-6 offset-md-3">
<div class="card-body p-5">

<ul class="nav bg radius nav-pills nav-fill mb-3" role="tablist">
	<li class="nav-item">
		<a class="nav-link active show" data-toggle="pill" href="#nav-tab-card">
		<i class="fa fa-credit-card"></i> Credit Card</a></li>
	
</ul>

<div class="tab-content">
<div class="tab-pane fade active show" id="nav-tab-card">
	<p class="alert alert-warning" id="card-pane">Add New Card</p>
	<form role="form" method="post" id="cardAdd">
	<div class="form-group">
		<label for="username">Full name (on the card)</label>
		<input type="text" class="form-control" name="cardholdername" placeholder="" required="">
	</div> <!-- form-group.// -->

	<div class="form-group">
		<label for="cardNumber">Card number</label>
		<div class="input-group">
			<input type="text" class="form-control" name="cardno" placeholder="">
			<div class="input-group-append">
				<span class="input-group-text text-muted">
					<i class="fab fa-cc-visa"></i> &nbsp; <i class="fab fa-cc-amex"></i> &nbsp; 
					<i class="fab fa-cc-mastercard"></i> 
				</span>
			</div>
		</div>
	</div> <!-- form-group.// -->

	<div class="row">
	    
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
					<input type="number" name="cvv" class="form-control" required="">
	        </div> <!-- form-group.// -->
	    </div>
		<div class="col-sm-6">
			<div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="Money in card">Balance <i class="fa fa-question-circle"></i></label>
					<input type="number" name="balance" class="form-control" required="">
	        </div> <!-- form-group.// -->
		</div>
	</div> <!-- row.// -->
	<button class="subscribe btn btn-warning btn-block" onclick="addNewCard();" type="button"> Confirm  </button>
	</form>
</div> <!-- tab-pane.// -->
<div class="tab-pane fade" id="nav-tab-paypal">
<p>Paypal is easiest way to pay online</p>
<p>
<button type="button" class="btn btn-warning"> <i class="fab fa-paypal"></i> Paypal </button>
</p>
<p><strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. </p>
</div>
<div class="tab-pane fade" id="nav-tab-bank">
<p>Bank accaunt details</p>
<dl class="param">
  <dt>BANK: </dt>
  <dd> THE WORLD BANK</dd>
</dl>
<dl class="param">
  <dt>Accaunt number: </dt>
  <dd> 12345678912345</dd>
</dl>
<dl class="param">
  <dt>IBAN: </dt>
  <dd> 123456789</dd>
</dl>
<p><strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. </p>
</div> <!-- tab-pane.// -->
</div> <!-- tab-content .// -->

</div> <!-- card-body.// -->
</article> <!-- card.// -->


</div><!-- card.// -->
</div>
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