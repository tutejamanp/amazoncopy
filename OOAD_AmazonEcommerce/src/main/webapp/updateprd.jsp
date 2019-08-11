<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Amazon OOAD Project</title>
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	
	
	console.log("here");

 	$('#showlater').hide();

 	
	var udata = JSON.parse(localStorage.getItem("userdata"));
	var is_birthday = false;
	console.log("udata is : "+udata);
	productdropdown(udata.id);

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
	api = "http://localhost:8055/amazon.com/webapi/CategoryController/rootcategories";


	$.get(api , function(data, status){

	    var myString="";
	   myString = myString + "<option selected='default'> Select Category</option>";
			
	    for(var i = 0; i < data.length; i++)
		{
	    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
	    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
	    	 myString=myString+"<option value = '"+ data[i].cat_id +"' >"+ data[i].categoryname +"</option>";
		}
	   
	    //alert(""+myString);
	    
	    $('#category').html(myString);
	   // $('#addsupid').text(0);

			});
	
	 $('#category').change(function () { 
		
		        var cat = $(this).children("option:selected").val();
		    	api = "http://localhost:8055/amazon.com/webapi/CategoryController/categories/" +cat;


		    	$.get(api , function(data, status){
		    		/* listcat="";
		    		$('#currentCat').html(alertobjectKeys(data[0].super_cat)); */
		    		console.log(data);
		    	    var myString="";
		    	    myString = myString + "<option value='-1'>Sub Category -Default</option>";
		    			
		    	    for(var i = 0; i < data.length; i++)
		    		{
		    	    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
		    	    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
		    	    	 myString=myString+"<option value = '"+ data[i].cat_id +"'>"+ data[i].categoryname +"</option>";
		    		}
		    	    //myString = myString + "</select>"
		    	    //alert(""+myString);
		    	    
		    	    $('#subcategory').html(myString);
		    	    
		    	});
		   
	  });
	

	 $('#subcategory').change(function () { 
			
		 	
	        var cat = $(this).children("option:selected").val();
	        console.log(cat);
	    	api = "http://localhost:8055/amazon.com/webapi/CategoryController/categoryById/" +cat;


	    	$.get(api , function(data, status){
	    		console.log(data.temp1_name);
	    		console.log(status);
	    		$('#temp1_name').html(data.temp1_name);
	    		$('#temp2_name').html(data.temp2_name);
	    		$('#temp3_name').html(data.temp3_name);
	    		$('#temp4_name').html(data.temp4_name);
	    		$('#temp5_name').html(data.temp5_name);
	    		$('#temp6_name').html(data.temp6_name);
	    		$('#showlater').show();
	    	});
	 });
	    	
	    	
	
	 	
	
});



function productdropdown(sellerid){
	
	api = "http://localhost:8055/amazon.com/webapi/ProductController/sellerproducts/"+sellerid;
	$.get(api , function(data, status){

	    var myString="";
	   myString = myString + "<option selected='default'> Select Product</option>";
			
	    for(var i = 0; i < data.length; i++)
		{
	    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
	    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
	    	 myString=myString+"<option value = '"+ data[i].id +"' >"+ data[i].productname +"</option>";
		}
	   
	    //alert(""+myString);
	    
	    $('#productdropdown').html(myString);
	   // $('#addsupid').text(0);

			});
	
	
	
}


function addlabels(){
	var lname = document.getElementById("lname").value;
	var lvalue = document.getElementById("lvalue").value;
	
	var mystring = "<tr><td>" + lname + "</td><td>" + lvalue + "</td></tr>";
	
	$('#customlabels').append(mystring);
	
	 document.getElementById("lname").value = "";
     document.getElementById("lvalue").value = "";
}


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
<script src="js/scripts/addProduct.js" type="text/javascript"></script>

</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
<article class="card-body col-md-10 offset-md-1" >
	<h4 class="card-title mt-3 text-center">Update Product</h4>
	<p class="text-center">Get started with amazon sell</p>
	
	<form method="post" id="productForm">
	<div class="row">
	<!--  Image And Description -->
	<!-- <div class="col-sm-4">
	<div class="form-group">
  				<img src="images/products/default.jpg" style="width:250px;height:250px;" id="addStudentImage"><input type="file" name="addImageSelect" class="form-control" id="addStudentImageSelect" />
	</div>
	</div> -->
	<div class="col-sm-6">
	
	Product Id:
	<br>
       <input name="productid" class="form-control" type="text" id="productid" disabled="disabled">
     
    	<input type="hidden" id="prodid" class="form-control" name="id" value=""/>
    
	Product Name:
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="productname" class="form-control" type="text" id="productname">
    </div> <!-- form-group// -->
   
     <!-- form-group// -->
     <!-- form-group end.// -->
     Price:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="price" class="form-control" type="number" id="price">
    </div> <!-- form-group// -->
    Discount:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="discountedprice" class="form-control" placeholder="Discounted Price" type="number" id="discountedprice"  onchange="updatediscpercentfield(this.value)" >
        <input name="discountedpercent" class="form-control" placeholder="Discount Percent" type="number" id="discountedpercent" onchange="updatediscpricefield(this.value)">
    </div>
     <!-- form-group// -->                                      
    <!-- form-group// -->   
	
	
	
	
	<!-- /**YaminiChanges****/ -->
	
	<!-- Manufacturer Name -->
	Manufacturer Name:
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="manname" class="form-control" type="text" id="manname">
    </div>
    
    Manufacture Date:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="manDate" class="form-control" placeholder="Manufacturer Date" type="date" id="manDate">
    </div>
    
    
    <!--  Color:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="color" class="form-control" id="color">
    </div> -->
    
    Quantity:
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="quantity" class="form-control" type="number" id="quantity">
    </div>
    
    <!-- /**YaminiChanges****/ -->
    
    
	  
	Description:
	 <textarea class="form-control" name="description" rows="5" id="description" placeholder="Description"></textarea>
	<br/>
	</div>
	
	<div class="col-sm-6">
		<!-- form-group// -->
		Category:
	    <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
			</div>
			<select id="category" name="category" class="form-control" onChange="changecat(this.value);">
				<option selected="default"> Select Category</option>
				
			</select>
			<select id="productdropdown" name="productdropdown" class="form-control" onChange="loadproduct(this.value);">
				<option selected="default"> Select Product</option>
				
			</select>
	
		</div> <!-- form-group end.// -->
		
		SubCategory:
		<div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
			</div>
			<select id="subcategory" name="subcategory" class="form-control">	
	   			 <option value="-1"  selected="default">Select Sub Category</option>
			</select>
		</div>
		 
		 <div class="form-group">
        <button type="button" name="deleteproduct" class="btn btn-warning btn-block" id ="deleteproduct" onclick="deleteProduct();"> Delete </button>
        </div> 
		
		<div id="showlater">
			<div id="temp1_name"></div>
			<input name="temp1_value" class="form-control" type="text" id="temp1_value">
			<div id="temp2_name"></div>
			<input name="temp2_value" class="form-control" type="text" id="temp2_value">
			<div id="temp3_name"></div>
			<input name="temp3_value" class="form-control" type="text" id="temp3_value">
			<div id="temp4_name"></div>
			<input name="temp4_value" class="form-control" type="text" id="temp4_value">	
			<div id="temp5_name"></div>
			<input name="temp5_value" class="form-control" type="text" id="temp5_value">
			<div id="temp6_name"></div>
			<input name="temp6_value" class="form-control" type="text" id="temp6_value">
		</div>
	</div>
	</div>
	
	<!-- /**YaminiChanges****/ -->
	<div class="row">
	  <div class="col-sm-12">
		<table id = "customlabels" class="table table-striped table-bordered">
			<thead>
            <tr>
                <th>Name</th>
                <th>Value</th>
            </tr>
	        </thead>
	        <tbody id="labelList">
	        	
	        </tbody>
		</table>
	  </div>
	  </div>
	<div class="row">
	  <div class="col-sm-5">
		<div class = "form-group input-group">
			<input class = "form-control" placeholder = "Name" type="text" id="lname">
		</div>
	  </div>
	  <div class="col-sm-5">
		<div class = "form-group input-group">
			<input  class = "form-control" placeholder = "Value" type="text" id="lvalue">	
		</div>
	</div>
	
	<div class="col-sm-2">
	<div class = "form-group">
		<button type="button" name="addLabel" class="btn btn-warning btn-block" id="addLabel" onclick="addlabels();">Add Label</button>
	
	</div>
	</div>
	</div>
	<!-- /**YaminiChanges****/ -->
	
    <div class="form-group">
        <button type="button" name="updateproduct" class="btn btn-warning btn-block" id ="updateproduct" onclick="updateProduct();"> Update </button>
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