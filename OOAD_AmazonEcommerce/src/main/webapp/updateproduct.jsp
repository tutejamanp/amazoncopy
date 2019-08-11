<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>

<script type="text/javascript">

$(document).ready(function(){
	var productid = localStorage.getItem("update_prod_id");
	console.log(productid);
	var api = "http://localhost:8055/amazon.com/webapi/ProductController/productsById/"+productid;	
	$.get(api , function(product, status){
			document.getElementById("productname").value = product[0].productname;
			document.getElementById("price").value = product[0].price;
			document.getElementById("discountedprice").value = product[0].discountedprice;
			document.getElementById("quantityleft").value = product[0].quantityleft;
			document.getElementById("description").value = product[0].description;
			document.getElementById("addStudentImage").src = "images/products/" + product[0].productname + ".jpg";
			updatediscpercentfield(product[0].discountedprice);
			console.log("product is : ");
			console.log(product);		
	});
	
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
<script src="js/scripts/updateproduct.js" type="text/javascript"></script>

</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
<article class="card-body col-md-8 offset-md-2" >
	<h4 class="card-title mt-3 text-center">Update Product Details</h4>
	
	<form method="post" id="productForm">
	<div class="row">
	<!--  Image And Description -->
	 <div class="col-sm-6">
	<div class="form-group">
  				<img src="images/products/default.jpg" style="width:250px;height:250px;" id="addStudentImage">
	</div>
	</div> 
	<div class="col-sm-6">
	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="productname" class="form-control" placeholder="Product Name" type="text" id="productname">
    </div> <!-- form-group// -->
   
     <!-- form-group// -->
     <!-- form-group end.// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="price" class="form-control" placeholder="Price" type="number" id="price">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="discountedprice" class="form-control" placeholder="Discounted Price" type="number" id="discountedprice"  onchange="updatediscpercentfield(this.value)" >
        <input name="discountedpercent" class="form-control" placeholder="Discount Percent" type="number" id="discountedpercent" onchange="updatediscpricefield(this.value)">
    </div>
     <!-- form-group// -->                                      
    <!-- form-group// -->   
	
	<!-- form-group end.// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="quantityleft" class="form-control" placeholder="Quantity" type="number" id="quantityleft">
    </div> <!-- form-group// -->
	
	<!-- <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		<select id="subcategory" name="subcategory" class="form-control">	
   			 <option value="" disabled selected>Select</option>
		</select>
	</div> form-group end.// -->
	
	  		<textarea class="form-control" name="description" rows="5" id="description" placeholder="Description"></textarea>
	<br/>
	</div>
	</div>
    <div class="form-group">
        <button type="button" name="Update" class="btn btn-warning btn-block" id ="updateproduct" onclick="updateProduct();"> Update </button>
    </div> 	                                                      
</form>
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