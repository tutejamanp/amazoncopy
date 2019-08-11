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

	var filteredData = [];

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
	$("#priceError").hide();
	
	/* loadGenericFilter("color", 'Color'); */
	loadGenericFilter("temp1_value", "temp1_valuedropdown");
	loadGenericFilter("temp2_value", "temp2_valuedropdown");
	loadGenericFilter("temp3_value", "temp3_valuedropdown");
	loadGenericFilter("temp4_value", "temp4_valuedropdown");
	loadGenericFilter("temp5_value", "temp5_valuedropdown");
	loadGenericFilter("temp6_value", "temp6_valuedropdown");
	loadListings();

});

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
<script src="js/scripts/viewProductDetail.js" type="text/javascript"></script>

<script type="text/javascript">

var next = 1;			// fixed, please do not modfy;
var current = 0;		// fixed, please do not modfy;
var interval = 4000;	// You can set single picture show time;
var fadeTime = 800;	// You can set fadeing-transition time;
var imgNum = 5;		

function SignOut() {
	localStorage.removeItem("userdata");
	window.location.href = "http://localhost:8055/amazon.com/";
}


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
var currentCount = 0;
var items = "<div class='row-sm' data-jplist-group='group1' >";
api = "http://localhost:8055/amazon.com/webapi/ProductController/productsByCategory/"+localStorage.getItem("selectedcategory");
console.log("selected category is : "+localStorage.getItem("selectedcategory"));
console.log("the api is : "+api);
$.get(api , function(data, status){
	filteredData = data;
	console.log("output data is :"+data);
	$('#count').html(data.length+" results found.")
	
	$('#categoryHeader').html(
			 "<li class='breadcrumb-item'><a href='#'>" + data[0].category.super_cat.categoryname +"</a></li>" + 
			 "<li class='breadcrumb-item'><a href='#'>" + data[0].category.categoryname +"</a></li>"
			    )
	
    while(currentCount < data.length) {
    	if(currentCount % 4 == 0) {
    		if(currentCount != 0) {
    			items = items + "</div><div class='row-sm' >";
    		}
    	}
    		console.log(data[currentCount].productname);
    		items = items + "<div class='col-sm-3' data-jplist-item><figure class='card card-product' onclick='viewProductDetails("+data[currentCount].id+");''>";
    		
    		//inserting image
    		items = items + "<div class='img-wrap'><img src='"+data[currentCount].product_images[0].url+"' /></div>";
    		
    		items = items + "<figcaption class='info-wrap'><a href='#' class='title'>"+data[currentCount].productname+"</a>";
    		items = items + "<div class='price-wrap h5'><a href='#' class='price-new'>"+data[currentCount].discountedprice+"</a><small><br/><del class='price-old'>"+data[currentCount].price+"</del></small></div></figcaption>";
    		items = items + "</figure></div>";
    		currentCount++;	
    }
    	
    
    items = items + "</div>";
    $('#dynamicSearch').html(items);
});


});

$("#applyFilter").click(function(){
	var maxVal = parseInt($("#MaxPrice").val());
	var minVal = parseInt($("#MinPrice").val());
	//swal(minVal + " " + maxVal)
	if(minVal>maxVal){
		$("#MinPrice").val("0");
		$("#priceError").show();
	}
	else {
		$("#priceError").hide();
	}
});



function load(data) { 
	
	var api;
	var currentCount = 0;
	var items = "<div class='row-sm' data-jplist-group='group1' >";
	filteredData = data;
		$('#count').html(data.length+" results found.")
	    while(currentCount < data.length) {
	    	if(currentCount % 4 == 0) {
	    		if(currentCount != 0) {
	    			items = items + "</div><div class='row-sm' >";
	    		}
	    	}
	    		console.log(data[currentCount].productname);
	    		items = items + "<div class='col-sm-3' data-jplist-item><figure class='card card-product' onclick='viewProductDetails("+data[currentCount].id+");''>";
	    		
	    		//inserting image
	    		items = items + "<div class='img-wrap'><img src='"+data[currentCount].product_images[0].url+"' /></div>";
	    		
	    		items = items + "<figcaption class='info-wrap'><a href='#' class='title'>"+data[currentCount].productname+"</a>";
	    		items = items + "<div class='price-wrap h5'><a href='#' class='price-new'>"+data[currentCount].discountedprice+"</a><small><br/><del class='price-old'>"+data[currentCount].price+"</del></small></div></figcaption>";
	    		items = items + "</figure></div>";
	    		currentCount++;	
	    }
	    	
	    
	    items = items + "</div>";
	    $('#dynamicSearch').html(items);

  
} 


function loadListings(){
	   
	$('#dynamicSearch').empty();
	var data = [];
    	    $.ajax(
	        		{
	        			type : 'GET',
	        			contentType : 'application/json',
	        			url : "http://localhost:8055/amazon.com/webapi/ProductController/productsByCategory/"+localStorage.getItem("selectedcategory"),
	        			async : false,
	        			dataType : "json", // data type of response
	        			success : function(result){
	        				var testAPi = "http://localhost:8055/amazon.com/webapi/CategoryController/isSuperCat/"+localStorage.getItem("selectedcategory");
	        				console.log(result);
	        				$.get(testAPi, function(data, status){
	        					console.log(data);
	        				    if(data == true) {
	        						$('#isSuperCat').hide();
	        				    }
	        				  });
	        				document.getElementById('temp1_namelabel').innerHTML = result[0].category.temp1_name + "&nbsp";
        					document.getElementById('temp2_namelabel').innerHTML = result[0].category.temp2_name + "&nbsp";
        					document.getElementById('temp3_namelabel').innerHTML = result[0].category.temp3_name + "&nbsp";
        					document.getElementById('temp4_namelabel').innerHTML = result[0].category.temp4_name + "&nbsp";
        					document.getElementById('temp5_namelabel').innerHTML = result[0].category.temp5_name + "&nbsp";
        					document.getElementById('temp6_namelabel').innerHTML = result[0].category.temp6_name + "&nbsp";
        					for (var i in result){
	        					
	        					//var ActualPrice = Math.round(result[i].price - (result[i].discount/100)*result[i].price);
	        					if(result[i].discountedprice <  $("#MinPrice").val() || result[i].discountedprice > $("#MaxPrice").val() 
/* 	        							|| ($("#color_Filter option:selected").text().toLowerCase() != result[i].color.toLowerCase() && $("#color_Filter").val()!=0)
 */	        							|| ($("#temp1_valuedropdown option:selected").text().toLowerCase() != result[i].temp1_value.toLowerCase() && $("#temp1_valuedropdown option:selected").text().toLowerCase() != "none" )
	        							|| ($("#temp2_valuedropdown option:selected").text().toLowerCase() != result[i].temp2_value.toLowerCase() && $("#temp2_valuedropdown option:selected").text().toLowerCase() != "none" )
	        							|| ($("#temp3_valuedropdown option:selected").text().toLowerCase() != result[i].temp3_value.toLowerCase() && $("#temp3_valuedropdown option:selected").text().toLowerCase() != "none" )
	        							|| ($("#temp4_valuedropdown option:selected").text().toLowerCase() != result[i].temp4_value.toLowerCase() && $("#temp4_valuedropdown option:selected").text().toLowerCase() != "none" )
	        							|| ($("#temp5_valuedropdown option:selected").text().toLowerCase() != result[i].temp5_value.toLowerCase() && $("#temp5_valuedropdown option:selected").text().toLowerCase() != "none" )
	        							|| ($("#temp6_valuedropdown option:selected").text().toLowerCase() != result[i].temp6_value.toLowerCase() && $("#temp6_valuedropdown option:selected").text().toLowerCase() != "none" ))
	        						continue;
	        					data.push(result[i]);
	        				/* $.ajax(
	        						{
	        							type : 'GET',
	        							contentType : 'application/json',
	        							url : "http://localhost:8055/amazon.com/webapi/ProductController/productsById/"+result[i].id,
	        							dataType : "json", // data type of response
	        							success : function(result1){
	        								alert("Now here");
	        								result_objects.push(result1);
	        							},
	        					    	error:function(err) {
	        					    		swal(err);
	        					    	}
	        						}); */
	        				}
	        				//alert(data[0].id);
	        				var currentCount = 0;
	        				var items = "<div class='row-sm' data-jplist-group='group1' >";
	        				$('#count').html(data.length+" results found.")
	        			    while(currentCount < data.length) {
	        			    	if(currentCount % 4 == 0) {
	        			    		if(currentCount != 0) {
	        			    			items = items + "</div><div class='row-sm' >";
	        			    		}
	        			    	}
	        			    		console.log(data[currentCount].productname);
	        			    		items = items + "<div class='col-sm-3' data-jplist-item><figure class='card card-product' onclick='viewProductDetails("+data[currentCount].id+");''>";
	        			    		
	        			    		//inserting image
	        			    		items = items + "<div class='img-wrap'><img src='"+data[currentCount].product_images[0].url+"' /></div>";
	        			    		
	        			    		items = items + "<figcaption class='info-wrap'><a href='#' class='title'>"+data[currentCount].productname+"</a>";
	        			    		items = items + "<div class='price-wrap h5'><a href='#' class='price-new'>"+data[currentCount].discountedprice+"</a><small><br/><del class='price-old'>"+data[currentCount].price+"</del></small></div></figcaption>";
	        			    		items = items + "</figure></div>";
	        			    		currentCount++;	
	        			    }
	        			    	
	        			    
	        			    items = items + "</div>";
	        			    $('#dynamicSearch').html(items);
	        	            
	        	    	},
	        	    	error:function(){
	        	    		swal("error occurred");
	        	        	
	        	    	}
	        		});
    	    filteredData = data;
 }


function loadGenericFilter(prop, dropdown)
{		$.ajax(
        		{
        			type : 'GET',
        			contentType : 'application/json',
        			url : "http://localhost:8055/amazon.com/webapi/ProductController/productsByCategory/"+localStorage.getItem("selectedcategory"),
        			async : false,
        			dataType : "json", // data type of response
        			success : function(result){
        				var uniqueProp = [];
        				for(i = 0; i< result.length; i++){    
        				    if(result[i][prop]!= null && uniqueProp.indexOf(result[i][prop].toLowerCase()) === -1){
        				        uniqueProp.push(result[i][prop].toLowerCase());        
        				    }        
        				}
        				console.log("prop"+ uniqueProp);
        				var data="<div style='text-align:center;'><select id='"+prop+"_Filter' onchange='loadListings();'>"+"<option value='0'>None</option>";
        	            for(i=0;i<uniqueProp.length;i++){
        	               data+="<option value='"+(i+1)+"'>"+uniqueProp[i].toLowerCase()+"</option>";
        	            }
        	            data += "</select></div>";
        	            $('#' + dropdown).append(data);
        	            //dropdown.append(data);
        	    	},
        	    	error:function(){
        	    		swal("error occurred");
        	        	
        	    	}
        		});
}



function SortAsscending(prop)
{
	console.log(filteredData);
	$('#dynamicSearch').empty();
	
        $.ajax(
        		{
        			type : 'GET',
        			contentType : 'application/json',
        			url : api = "http://localhost:8055/amazon.com/webapi/ProductController/productsByCategory/"+localStorage.getItem("selectedcategory"),
    			dataType : "json", // data type of response
    			success : function(result){
    				//alert("hello sort");
    				filteredData.sort(GetSortOrderAsscending(prop));//Pass the attribute to be sorted on
    				load(filteredData);
    	    	},
    	    	error:function(){
    	    		swal("error occurred");
    	        	
    	    	}
    		});
}

function GetSortOrderAsscending(prop) { 
    return function(a, b) {  
        if (a[prop] > b[prop]) {  
            return 1;  
        } else if (a[prop] < b[prop]) {  
            return -1;  
        }  
        return 0;  
    }  
} 


function SortDescending(prop)
{
	$('#dynamicSearch').empty();
	
        $.ajax(
        		{
        			type : 'GET',
        			contentType : 'application/json',
        			url : api = "http://localhost:8055/amazon.com/webapi/ProductController/productsByCategory/"+localStorage.getItem("selectedcategory"),
    			dataType : "json", // data type of response
    			success : function(result){
    				//alert("hello sort");
    				filteredData.sort(GetSortOrderDescending(prop));//Pass the attribute to be sorted on
    				load(filteredData);
    	    	},
    	    	error:function(){
    	    		swal("error occurred");
    	        	
    	    	}
    		});
}

function GetSortOrderDescending(prop) { 
    return function(a, b) {  
        if (a[prop] < b[prop]) {  
            return 1;  
        } else if (a[prop] > b[prop]) {  
            return -1;  
        }  
        return 0;  
    }  
    
    
    
		function displayListings(result)
		{
		    var data="";
			data+="<div class='col-sm-4, box'><a href='item.jsp?id="+result.id+
			"'> <div style=''>"+
			"<img class='listingImage' style='display: block; object-fit: contain; width: 250px; height: 250px;' src='"+
			imgServerURL+result.imgUrl+"' alt=''></div>"+
	        "<div style = 'font-size:15px; text-align:center'>"+result.listingName+"</div>"+
	        "<div style = 'font-size:10px; text-align:left; font-family:verdana;display:inline-block;margin-right:10px;color:green'>"+
	        result.discount+"% off</div><br/>"+
	        "<div style = 'font-size:15px; position:left; font-family:verdana;margin-right:10px;display:inline-block'>"+
	        "<i class='fa fa-inr' style='font-size:15px'></i>"+result.ActualPrice+"</div>"+
	       	"<del style = 'font-size:10px; text-align:left; font-family:verdana; color:grey;margin-right:10px;display:inline-block'>"+
	       	"<i class='fa fa-inr' style='font-size:10px'></i>"+result.price+"</del>"+
	       	"("+result.manufacture_Date+")"+
	       	"</div>";
	       	$('#listing').append(data);
		
	}
	    
}  
</script>




    


</head>
<body>
 	    <%@include file="new_header.jsp" %>

<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<section class="section-content bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-body">
<div class="row">
	<div class="col-md-3-24"> <strong>Your are here:</strong> </div> <!-- col.// -->
	<nav class="col-md-18-24"> 
	<ol class="breadcrumb" id="categoryHeader">
	    <li class="breadcrumb-item"><a href="#">Home</a></li>
	    <li class="breadcrumb-item"><a href="#">Category name</a></li>
	    <li class="breadcrumb-item"><a href="#">Sub category</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Items</li>
	</ol>  
	</nav> <!-- col.// -->
	
</div> <!-- row.// -->
<hr>
<div class="row">
	<div class="col-md-3-24"> <strong>Filter by:</strong> </div> <!-- col.// -->
	<div class="col-md-21-24"> 
		<ul class="list-inline">
		  <div id="isSuperCat">
<!-- 		  <label>Color:</label><li class="list-inline-item dropdown"><a href="#" id="Color"></a></li> -->
		  <label id="temp1_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp1_valuedropdown"></a></li>
		  <label id="temp2_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp2_valuedropdown"></a></li>
		  <label id="temp3_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp3_valuedropdown"></a></li>
		  <label id="temp4_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp4_valuedropdown"></a></li>
		  <label id="temp5_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp5_valuedropdown"></a></li>
		  <label id="temp6_namelabel">name:</label><li class="list-inline-item dropdown"><a href="#" id="temp6_valuedropdown"></a></li>
		  </div>
		  <li class="list-inline-item">
		  	<div class="form-inline">
		  		<label class="mr-2">Price</label>
				<input id="MinPrice" class="form-control form-control-sm" placeholder="Min" type="number" value="0">
					<span class="px-2"> - </span>
				<input id="MaxPrice" class="form-control form-control-sm" placeholder="Max" type="number" value="10000000">
				<div id="priceError" style="font-size:15px;color:red">Minimum price cannot be larger than maximum price</div>
				<button id="applyFilter" type="submit" class="btn btn-sm ml-2" onclick="loadListings();">Ok</button>
			</div>
		  </li>
		  <!-- <li class="list-inline-item dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Sort by</a>
		  	<div class="dropdown-menu">
				<a id="h2l" class="dropdown-item" onclick="sortBy(this.id);" >Price: High To Low</a>
				<a id="l2h" class="dropdown-item" onclick="sortBy(this.id);">Price: Low To High</a> 
				<a id="avg_review" class="dropdown-item" onclick="sortBy(this.id);">Avg. Customer review</a> 
			</div>
		  </li>  -->
		  
		  
		   <li class="list-inline-item dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">  Sort by </a>
            <div class="dropdown-menu p-3" style="max-width:400px;">	
		      <!-- <label class="form-check">
		      	<a class="dropdown-item">Sort By</a>
		      </label>
		       --><label class="form-check">
		      	<a class="dropdown-item" onclick ="SortAsscending('discountedprice');">Price: Low to High</a>
		      </label>
		      <label class="form-check">
		      	<a class="dropdown-item" onclick ="SortDescending('discountedprice');">Price: High To Low</a>
		      </label>
		      <label class="form-check">
		      	<a class="dropdown-item" onclick ="SortDescending('starratings');">Avg.Customer Review</a>
		      </label>
		      <label class="form-check">
		      	<a class="dropdown-item" onclick ="SortDescending('manufactured_date');">Newest Arrivals</a>

		      </label>
		      
		      
            </div> <!-- dropdown-menu.// -->
	      </li>
		  
		 
                            
								

								
                           
                                

                                

                                
                           
                     
                        
                        
                     
                     


           
                        
                        
		</ul>
	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->

<div class="padding-y-sm">
<span id="count"> </span>	
</div>


	
</div><!-- card.// -->

<!-- Get Search Based Items  -->
<div id="dynamicSearch">


</div>

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