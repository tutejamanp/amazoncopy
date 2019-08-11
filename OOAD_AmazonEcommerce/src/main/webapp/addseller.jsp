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

$(document).ready(function() {
	var userid = JSON.parse(localStorage.getItem("userdata")).id;

	var api = "http://localhost:8055/amazon.com/webapi/UserController/checkSellerDetails/"+userid;
	var product;

	//Ajax Call for getting individual product
	$.get(api , function(data, status){
	    if(data != 0) {
	    	
		    	$('#register').hide();
		    	alert("You already have uploaded your user details :) !!");
	    } 
	});
	
	
	
	
    console.log(userid);
    $("#registerbutton").click(function(event){
    	
    	//alert("Call success");
    	console.log($("#companyname").val());
    	var obj = {
    			userid		: userid,
    			companyname	: $("#companyname").val(),
    			gstin		: $("#gstin").val(),
    			pan 		: $("#pan").val(),
    			address 	: $("#address").val(),
    			contactno	: $("#contactno").val(),
    			cardno		: $('#cardno :selected').text(),
    			cvv			: $("#cvv").val()
    	};

    	var form = $('#register')[0];
    	data = new FormData(form);
		data.append('userid',userid);
    	  $.ajax({
		    	type: "POST",
				enctype: 'multipart/form-data',
		        url: "http://localhost:8055/amazon.com/webapi/UserController/saveSeller",
		        data: data, 
		       	processData: false,
		        contentType: false,
		        cache: false,
		        async: true,
		        timeout: 600000,
		        
		        success: function(data){
		        	//alert("hi");
		        	window.alert(data);
		        	if(data == "Success")
		        		window.location.href="http://localhost:8055/amazon.com/addprd.jsp";
		        				        	//location.reload(true);
		        },
		        error : function(jqXHR, textStatus, errorThrown) {
		        	alert(jqXHR + textStatus +errorThrown);
					$("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
				}
		    });
    	
		});
    
    var api;
    api = "http://localhost:8055/amazon.com/webapi/CardController/getCards/" + userid;
    $.get(api , function(data, status){
        var myString="";
        //myString = myString + "<select onchange = 'subcat(this)'> <option>-Default-</option>";
    		
        for(var i = 0; i < data.length; i++)
    	{
        	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
        	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
        	 myString=myString+"<option value = '"+ data[i].cardno +"'>"+ data[i].cardno +"</option>";
    	}
        //myString = myString + "</select>"
        //alert(""+myString);
        
        $('#cardno').html(myString);
    		});
 });
//jquery end
</script>


</head>
<body>

 	    <%@include file="new_header.jsp" %>


<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
<article class="card-body col-md-4 offset-md-4" >
	<h4 class="card-title mt-3 text-center">Register Seller</h4>
	
	<form method="post" id="register">
	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="companyname" class="form-control" placeholder="Company Name" type="text" id="companyname">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="gstin" class="form-control" placeholder="GST Number" type="text" id="gstin">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="pan" class="form-control" placeholder="PAN Number" type="text" id="pan">
    </div> <!-- form-group// -->
 	<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="address" class="form-control" placeholder="Address" type="text" id="address">
    </div> <!-- form-group// -->
    	<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="contactno" class="form-control" placeholder="Contact Number" type="number" id="contactno">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <select class="form-control" name="cardno" id="cardno">
        	<option>Test</option>
        </select>
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="cvv" class="form-control" placeholder="CVV" type="text" id="cvv">
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <button type="button" class="btn btn-warning btn-block" id ="registerbutton"> Register </button>
    </div> <!-- form-group// -->                                                                    
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