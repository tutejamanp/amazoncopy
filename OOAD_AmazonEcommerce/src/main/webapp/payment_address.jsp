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
		        	window.location.href="http://localhost:8055/amazon.com/leave_review.jsp";
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
 	    <%@include file="header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">


<article class="card col-md-6 offset-md-3">
<div class="myAddress">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Address</th>
  <th scope="col" width="120">Select</th>
  
</tr>
</thead>
<tbody id="address">


</tbody>
</table>


</div>
<div class="card-body p-5">

Custom Address:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="addr_line1" class="form-control" placeholder="Line 1"  id="addr_line1">
    </div> <!-- form-group// -->  
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="addr_line2" class="form-control" placeholder="Line 2" id="addr_line2">
    </div> <!-- form-group// -->  
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="street" class="form-control" placeholder="Street" id="street">
    </div> <!-- form-group// -->  
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="city" class="form-control" placeholder="City" id="city">
    </div> <!-- form-group// -->  
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="pincode" class="form-control" placeholder="PinCode" type="number" id="pincode">
    </div> <!-- form-group// -->  
    
    
    
                                        
    <div class="form-group">
        <button type="button" class="btn btn-warning btn-block" id ="registerbutton" onclick="shipToNewAddress()"> Deliver Here! </button>
    </div> <!-- form-group// -->      
    
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

<script type="text/javascript" src="js/scripts/payment_address.js"></script>
</body>
</html>