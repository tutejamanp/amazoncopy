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
$(document).ready(function() {
	displayCards();
});
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


</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION MAIN END// ========================= -->


<!-- ========================= SECTION CONTENT ========================= -->
<!-- ========================= SECTION CONTENT ========================= -->
<section class='section-content bg padding-y border-top'>
<div class='container'>

<div class='row'>
	<main class='col-sm-12'>

<div class='card text-center'>
<p class="alert alert-warning" id="card-info" ><a href="addcard.jsp">Add New Card</a></p>
<div id="userBalance"></div>
<table class='table table-hover shopping-cart-wrap' id="cardManage">
<thead class='text-muted'>
<tr>
  <th scope='col'>Card Number</th>
  <th scope='col' width='120'>CVV</th>
  <th scope='col' width='120'>Balance</th>
  <th scope='col' width='120'>Add Money!</th>
  <th scope='col' class='text-right' width='200'>Action</th>
</tr>
</thead>
<tbody id="cardHolder">


	
</tbody>
</table>
</div> <!-- card.// -->

	</main> <!-- col.// -->
	
</div>

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION  ========================= -->

<!-- ========================= SECTION  END// ========================= -->

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