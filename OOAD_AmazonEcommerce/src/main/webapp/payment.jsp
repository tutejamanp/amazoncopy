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
			
			var udata = JSON.parse(localStorage.getItem("userdata"));
			var addr = localStorage.getItem("shippingAddress");
			alert("4444" + addr);
			console.log("-----" + localStorage.getItem("directBuy"));
			if(localStorage.getItem("directBuy") == "true"){
			console.log("**********------------if part");
			var form = new FormData();
			form.append('customerid', udata.id );
			
			
			var cartqty = localStorage.getItem("cartProductQty");
			var cartprice = localStorage.getItem("cartProductValue");
			var cost = cartqty * cartprice;
			var currprodid = localStorage.getItem("viewingProduct")
			
			form.append('cardno', $('#cardno').val());
			form.append('cvv', $('#cvv').val());
			form.append('quantity', cartqty);
			form.append('freequantity', localStorage.getItem('freequantity'));
			form.append('address', addr);
			form.append('productid',currprodid);
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
		        async: false,
		        timeout: 600000,
		        
		        success:function(result){
		        	window.alert(result);
		        	if(result == "Success")
		        		window.location.href="customer_orders.jsp";
		        	//location.reload(true);
		        },
		        error:function(result) {
		        	alert("Balance LOW!!");
		        }
		    });
			
			
			
			}
			
			else{
				console.log("*******------------else part");
				var api = "http://localhost:8055/amazon.com/webapi/UserController/getUserCart/"+udata.id;
				$.get(api , function(data, status){
					
					var allordersplaced = true;
					
						data.forEach(function(cartitem){

						    var udata = JSON.parse(localStorage.getItem("userdata"));
						    var productInfo = cartitem.product;
							var form = new FormData();
							form.append('customerid', udata.id );
							
							
							var cartqty = cartitem.quantity;
							var cartprice = productInfo.discountedprice;
							var cost = cartqty * cartprice;
							var currprodid = productInfo.id;
							var freequantity = cartitem.freequantity;
							
							form.append('cardno', $('#cardno').val());
							form.append('cvv', $('#cvv').val());
							form.append('quantity', cartqty);
							form.append('freequantity', freequantity);
							form.append('address', addr);
							form.append('productid',currprodid);
							console.log(form + "Naru Form Data");
							
							
							var data = form;
						    
						    console.log(udata.emailid);
						    $.ajax({
						    	type: "POST",
								enctype: 'multipart/form-data',
						        url: "http://localhost:8055/amazon.com/webapi/OrderController/saveorder",
						        data: data, 
						       	processData: false,
						        contentType: false,
						        cache: false,
						        async: false,
						        timeout: 600000,
						        
						        success:function(result){
						        	//window.alert(result);
						        	//if(result == "Success")
						        		//window.location.href="customer_orders.jsp";
						        	//location.reload(true);
						        },
						        error:function(result) {
						        	allordersplaced = false;
						        	alert("Balance LOW!!");
						        }
						    });
							
							
							
						});
						
						if(allordersplaced){
							
							var udata = JSON.parse(localStorage.getItem("userdata"));
							uid = udata.id;
							
							var form = new FormData();
							//form.append('orderid', orderid);
							var data = form;
							//Ajax Call for getting individual product
							
							$.ajax({
						    	type: "POST",
								enctype: 'multipart/form-data',
						        url: "http://localhost:8055/amazon.com/webapi/UserController/emptyCart/"+uid,
						        data: form, 
						       	processData: false,
						        contentType: false,
						        cache: false,
						        async: true,
						        timeout: 600000,
						        
						        success:function(result){
						        	alert("Successfully placed order from cart!!!");
						        	window.location.href="customer_orders.jsp";
						        	//window.location.href = "view.html";
						        },
						        error: function(data){
						            alert("fail");
						        }
						    });
							
							
						}
						
					   	   // $('#product_hidden').html("<input type='hidden' name='product_id' value='"+localStorage.getItem("viewingProduct")+"' id='product_id' />");
					});
				
			}
			
			
			

			//alert("Success. You've purchase the item");
			
			//localStorage.removeItem("cartProductQty");
			//localStorage.removeItem("cartProduct");
			//localStorage.removeItem("directBuy");
			//window.location.href="home.jsp";
		}
		
		else {
	          alert('Please fill all the fields');
		}
	}
</script>
</head>
<body>
<%@include file="header.jsp" %>

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
	<li class="nav-item">
		<a class="nav-link" data-toggle="pill" href="#nav-tab-paypal">
		<i class="fab fa-paypal"></i>  Paypal</a></li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="pill" href="#nav-tab-bank">
		<i class="fa fa-university"></i>  Bank Transfer</a></li>
</ul>

<div class="tab-content">
<div class="tab-pane fade active show" id="nav-tab-card">
	<p class="alert" id="error"></p>
	<form role="form" type="post" id="payment_create">
	<div class="form-group">
		<label for="username">Full name (on the card)</label>
		<input type="text" class="form-control required" name="username" id="name" placeholder="" required>
	</div> <!-- form-group.// -->

	<div class="form-group">
		<label for="cardNumber">Card number</label>
		<div class="input-group">
			<input type="text" class="form-control required" name="cardno" id="cardno"  placeholder="">
			<div class="input-group-append">
				<span class="input-group-text text-muted">
					<i class="fab fa-cc-visa"></i> &nbsp; <i class="fab fa-cc-amex"></i> &nbsp; 
					<i class="fab fa-cc-mastercard"></i> 
				</span>
			</div>
		</div>
	</div> <!-- form-group.// -->

	<div class="row">
	    <div class="col-sm-8">
	        <div class="form-group">
	            <label><span class="hidden-xs">Expiration</span> </label>
	        	<div class="input-group">
	        		<input type="number" max="12" min="1" class="form-control required" placeholder="MM" id="mm" value="1">
		            <input type="number" class="form-control required" placeholder="YY" id="yy" name="">
	        	</div>
	        </div>
	    </div>
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
	            <input type="number" name="cvv" class="form-control required" id="cvv" required="">
	        </div> <!-- form-group.// -->
	    </div>
	</div> <!-- row.// -->
	<button class="subscribe btn btn-warning btn-block" type="button" onclick="payment();"> Confirm  </button>
	</form>
</div> <!-- tab-pane.// -->
<div class="tab-pane fade" id="nav-tab-paypal">
<p>Paypal is easiest way to pay online</p>
<p>
<button type="button" class="btn btn-warning"> <i class="fab fa-paypal"></i> Log in my Paypal </button>
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