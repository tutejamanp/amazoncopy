<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>

<!-- jQuery -->
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

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
	
	
	var api;
	api = "http://localhost:8055/amazon.com/webapi/CategoryController/allcategories";


	$.get(api , function(data, status){

	    var myString="";
	   myString = myString + "<option selected='default'> Select Category</option>";
			
	    for(var i = 0; i < data.length; i++)
		{
	    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
	    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
	    	 myString=myString+"<option value = '"+ data[i].cat_id +"'>"+ data[i].categoryname +"</option>";
		}
	   
	    //alert(""+myString);
	    
	    $('#category').html(myString);
	   // $('#addsupid').text(0);

			});

	
});


function updatediscpercentfield(price){
	var actprice = document.getElementById("price").value;
	//console.log(price + "-" + globaldiscountedprice);
	document.getElementById("discountedpercent").value = ((actprice -price)/actprice) * 100;
	
}

function updatediscpricefield(disc){
	var price = document.getElementById("price").value;
	//console.log(price + "+" + disc);
	document.getElementById("discountedprice").value = price - ((disc*price)/100);
	
}


</script>


<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">


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
<script src="js/scripts/addAddress.js" type="text/javascript"></script>

</head>
<body>
<%@include file="new_header.jsp" %>


<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
<article class="card-body col-md-8 offset-md-2" >
	<h4 class="card-title mt-3 text-center">Add New Address</h4>
	
	<form method="post" id="addressForm">
	<div class="row">
	<!--  Image And Description -->
	
	<div class="col-sm-6">
	
	 Address:
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
     <!-- form-group// -->                                      
    <!-- form-group// -->   
	
	
	
	<!-- <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		<select id="subcategory" name="subcategory" class="form-control">	
   			 <option value="" disabled selected>Select</option>
		</select>
	</div> form-group end.// -->
	
	<br/>
	</div>
	</div>
    <div class="form-group">
        <button type="button" name="Add" class="btn btn-warning btn-block" id ="addaddress" onclick="addAddress();"> Add </button>
    </div> 	                                                      
</form>


<div class="myAddress">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Address</th>
  
</tr>
</thead>
<tbody id="myAddress">

</tbody>
</table>
</div>

</article>







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