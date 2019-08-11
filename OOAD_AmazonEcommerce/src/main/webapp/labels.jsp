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

	var product_id = localStorage.getItem("viewingProduct");
	
	
	var api;
	api = "http://localhost:8055/amazon.com/webapi/LabelController/allLabels/"+product_id;


	
	$.get(api , function(data, status){

	   	
		data.forEach(function(item){
    		$('#labelList').append("<tr><td>"+item.lname+"</td><td>"+item.lvalue+"</td><td>	</td></tr>")
		});	
	});
		
		
	    $('#addLabel').click(function(){
	        //Some code
	    
	        var form = $('#labelForm')[0];
	    	var data = new FormData(form);
	   
		    $.ajax({
		    	type: "POST",
				enctype: 'multipart/form-data',	
		        url: "http://localhost:8055/amazon.com/webapi/LabelController/addLabel/"+product_id,
		        data: data, 
		       	processData: false,
		        contentType: false,
		        cache: false,
		        async: true,
		        timeout: 600000,
		        
		        success:function(result){
		        	alert("Success");
		        	//window.alert(result);
		        	//window.location.href="http://localhost:8055/amazon.com/";
		        	//location.reload(true);
		        }
		    });
	    });
});

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
<script src="js/scripts/addProduct.js" type="text/javascript"></script>

</head>
<body>

 	    <%@include file="new_header.jsp" %>


<!-- ========================= SECTION MAIN ========================= -->
<section class="section-main bg padding-y-sm">
<div class="container">
<div id="code_register_2">
<div class="card">
<article class="card-body col-md-8 offset-md-2" >
	<h4 class="card-title mt-3 text-center">Add Product</h4>
	<p class="text-center">Get started with amazon sell</p>
	
	<table id="labelTable" class="table table-striped table-bordered" style="width:80%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Value</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="labelList">
        	
        </tbody>
  </table>
	
	<form method="post" id="labelForm">
		
	<div class="row">
	  <div class="col-sm-5">
		<div class = "form-group input-group">
			<input name="name" class = "form-control" placeholder = "Name" type="text" id="name">
		</div>
	  </div>
	  <div class="col-sm-5">
		<div class = "form-group input-group">
			<input name="value" class = "form-control" placeholder = "Value" type="text" id="value">	
		</div>
	</div>
	
	<div class="col-sm-2">
	<div class = "form-group">
		<button type="button" name="addLabel" class="btn btn-warning btn-block" id="addLabel">Add Label</button>
	
	</div>
	
	</div>
	
	
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