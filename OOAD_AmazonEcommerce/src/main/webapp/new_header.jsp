<script type="text/javascript">
function searchMe() {
	var data = $('#basedSearch').val();	
	localStorage.setItem("basedSearch",data);
	window.location.href = "tablesearch.jsp";
}

$(document).ready(function() {
	
	var udata = JSON.parse(localStorage.getItem("userdata"));
	var is_birthday = false;
	getnoofitemscart(udata.id)
	$("#noofcart").text(globalcartcount);
	
	var api;
	api = "http://localhost:8055/amazon.com/webapi/CategoryController/rootcategories";

	var myString="";


	$.get(api , function(data, status){
	   // alert("hello");
	    
	    myString = "<ul>";
	    
			
	    for(var i = 0; i < data.length; i++)
		{ 
	   	 
	    	myString = myString + "<li>";
	    	myString=myString+"<a class='dropdown-toggle' id='"+data[i].cat_id+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' onclick ='setCategory("+data[i].cat_id+");'  >"+data[i].categoryname+"</a>";
	    	
	    	var current_category = data[i].cat_id;
	    	
	    	myString = myString + getSubCat(current_category);
	    	 
	    	  myString = myString + "</li>";
	    	 
		}
	    myString = myString + "</ul>";

	    
	    $('#shopbyCat').html(myString);
	   // $('#addsupid').text(0);

			});






	});

	




	

function getSubCat(catID)
{
	/*var api1="http://localhost:8055/amazon.com/webapi/CategoryController/categories/"+catID;
	
	var myString = "";
	$.get(api1 , function(data1, status){
	    alert("hello1"+myString);    	   
	    myString = myString + "<ul class='dropdown-menu'>";
	    for(var j = 0; j < data1.length; j++)
		{ 
	   	
	    	myString = myString + "<li>";
	    	myString=myString+"<a href='#'>"+data1[j].categoryname+"</a>";
	    	 
	    	 
	    	  myString = myString + "</li>";
	    	 console.log(myString);
		}
	    
	    myString = myString + "</ul>";

	});*/
	var myString = "";

	$.ajax({
	    url: "http://localhost:8055/amazon.com/webapi/CategoryController/categories/"+catID,
	    type: 'GET',
	    async: false,
	    success: function(data1) {
		    myString = myString + "<ul>";
		    for(var j = 0; j < data1.length; j++)
			{ 
		   	
		    	myString = myString + "<li>";
		    	myString=myString+"<a href='#'  onclick ='setCategory("+data1[j].cat_id+");' >"+data1[j].categoryname+"</a>";
		    	 
		    	 
		    	  myString = myString + "</li>";
		    	 console.log(myString);
			}
		    
		    myString = myString + "</ul>";
	    }
	});
	return myString;
}
var next = 1;			// fixed, please do not modfy;
var current = 0;		// fixed, please do not modfy;
var interval = 4000;	// You can set single picture show time;
var fadeTime = 800;	// You can set fadeing-transition time;
var imgNum = 0;		

function SignOut() {
	localStorage.removeItem("userdata");
	window.location.href = "http://localhost:8055/amazon.com/";
}

function setCategory(id1) {
	localStorage.setItem("selectedcategory",id1);
	console.log('value of lc is :'+localStorage.getItem("selectedcategory"));
	window.location.href = "http://localhost:8055/amazon.com/search.jsp";
}
var globalcartcount = 0;
function getnoofitemscart(userid)
{
	var myString = "";
	$.ajax({
	    url: "http://localhost:8055/amazon.com/webapi/UserController/getnoinusercart/"+userid,
	    type: 'GET',
	    async: false,
	    success: function(data1) {
	    	console.log("value of data1 is : "+data1);
	    	globalcartcount = data1;
	    }
	});
}
</script>

<header class="section-header background-amazon">
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container row">
	<!-- Amazon Logo -->
	<div class="col-md-3">
  	<a class="navbar-brand" href="home.jsp"><img class="logo" src="images/logos/amazon.png" alt="alibaba style e-commerce html template file" title="alibaba e-commerce html css theme"></a>
    <a href="404.jsp"  data-toggle="popover" data-trigger="hover" data-title="Unlimited FREE fast delivery, videos, music & more" data-content="Prime members enjoy unlimited free, fast delivery on eligible product items, video streaming, exclusive access to deals and more." style="position:relative; left:-50px;top:10px;"><small>Try Prime</small></a>
	<br>
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
				    <input type="text" class="form-control" id="basedSearch" style="width:50%;" placeholder="Search">
				    <div class="input-group-append">
				      <button class="btn btn-warning" onClick="searchMe();" type="button">
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
			<small id="deliverTo">Deliver Here</small></br>
			<b>Bengaluru 560010</b>
		</div>
		<div class="col-sm-5 category-wrap dropdown py-1">
		<button type="button" class="btn background-amazon  dropdown-toggle" data-toggle="dropdown" ><b> Shop By Categories</b></button>
		<div class="dropdown-menu" id="shopbyCat">
			<a id="Skin Care" class="dropdown-item" href="search.jsp" onclick="setCategory(this.id);" >Skin Care </a>
			<a class="dropdown-item" href="404.jsp">Hair and Others </a> 
		</div>
	</div>
	</div>
	 
	</div>
	<!-- Nav Bar Category End -->
	<div class="col-lg-10-24 col-sm-8 small text-light">
		 <a class="text-light text-margin" href="addAddress.jsp">My Address</a> <a  class="text-light text-margin" href="customer_orders.jsp" id="myAmazon">My Orders</a> <a  class="text-light text-margin"  href="card_details.jsp">My Cards</a>  <a class="text-light text-margin" href="addprd.jsp">Sell</a> <a class="text-light text-margin" href="manage_sales.jsp">Customer Service</a> <a class="text-light text-margin" href="q1.jsp">Question 1</a> <a class="text-light text-margin" href="q2.jsp">Question 2</a> 	</div> <!-- col.// -->
	<div class="col-lg-7-24 col-sm-12">
		<div class="widgets-wrap float-right row no-gutters py-1">
			<div class="col-auto">
			<div class="widget-header dropdown">
				<a href="404.jsp" data-toggle="dropdown" data-offset="20,10">
					<div class="icontext">
						
						<div class="text-wrap text-light">
							<small> <div id="nameText">Hello, Sign In</div><b> Your Orders</b>
							<i class="fa fa-caret-down"></i> </small>	
						</div>
					</div>
				</a>
				<div class="dropdown-menu" style="width:200px; padding-bottom: 0px;">
				<ul style="padding:5px;">
					<li class="list-manager"><div class="form-group" id="signInButton"><a href="login.html"><button type="submit" class="btn btn-warning btn-block"> Sign In  </button></a></div></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/css/homepage.html/ref=nav_youraccount_ya">Your Account</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/css/order-history/ref=nav_youraccount_orders">Your Order</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/registry/wishlist/ref=nav_youraccount_wl?ie=UTF8&requiresSignIn=1">Your Wishlist</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/yourstore/ref=nav_youraccount_recs">Your Recommendations</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/primecentral/ref=nav_youraccount_prime">Your Prime Membership</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/b/ref=nav_youraccount_dvm_crs_gat_in_tn_yraccount?_encoding=UTF8&node=10882806031">Your Prime Video</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/subscribe-and-save/manage/ref=nav_youraccount_sns">Your Subscribe & save items</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/business?_encoding=UTF8&node=11476704031&ref_=nav_ya_flyout_b2b_reg">Your Amazon Business Account</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/p2p/ref=nav_youraccount_sell">Your Seller Account</a></li>
					<li class="list-manager"><a href="https://www.amazon.in/gp/digital/fiona/manage/ref=nav_youraccount_myk">Manage your content and devices</a></li>
					<li class="list-manager"><a href="#" onclick="SignOut();">Sign Out</a></li>
					

				</ul>
			</div>  <!-- widget-header .// -->
			</div> <!-- col.// -->
			
			<a href="prime.jsp" class="widget-header">
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
			<a href="wishlist.jsp" class="widget-header">
					<div class="icontext">	
					
						<div class="text-wrap text-light">
						<small>	Your <br/><b>Lists</b> <i class="fa fa-caret-down"></i> </small>	
						</div>
					</div>
				</a>
			</div>
			<div class="col-auto">
				<a href="customer_cart.jsp" class="widget-header">
					<div class="icontext">
												<div class="icon-wrap"><i class="text-light icon-sm  fa fa-shopping-cart"></i></div>
						<span id="noofcart" name = "noofcart" class="small round badge badge-secondary"></span>

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