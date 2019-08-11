<!DOCTYPE HTML>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="`-ecommerce by Vosidiy">

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




<script src="scripts/default.js" type="text/javascript"></script>






<!-- jQuery -->

<!-- Data Table -->
		<script src="js/jquery.dataTables.js" type="text/javascript"></script>
		<link type="text/css" rel="stylesheet" href="css/jquery.dataTables.css">
<script type="text/javascript">
$(document).ready(function() {  	
		$('#showLater').hide();
    	
		
});

function showitems(){
	var i =1;
	$('#filtereddata').html("");
	$('#prod_sellerList').html("");
	$('#showLater').show();
	var userId = $('#sellerid').val();
	var api = "http://localhost:8055/amazon.com/webapi/AdminController/displayprodseller/"+userId;
	$.get(api , function(data, status){
	    data.forEach(function(prod){
	    	
	    	var api2 = "http://localhost:8055/amazon.com/webapi/OrderController/getOrdersOfSeller/"+userId;
	    	$.get(api2 , function(data2, status){
	    		var qtysold = 0;
	    	    data2.forEach(function(order){
	    	    	var items = order.ordereditemlist;
	    	    	items.forEach(function(item){	
	    	    		//item.status == "DELIVERED"
	    	    		if(item.productid == prod.id && item.status == "DELIVERED"){
	    	    			qtysold += (item.quantity + item.freequantity);
	    	    		}
	    	    	});
	    	    });	
	    	    $('#prod_sellerList').append("<tr><td>"+i+"</td><td>"+prod.id+"</td><td>"+prod.productname+"</td><td>"+qtysold+"</td></tr>")
				i++;
	    	});
	    	
	    
				
	    });		
	});
}

function loadListings(){
	var i =1;
	var userId = $('#sellerid').val();
	var minqty = $('#MinQty').val();
	var maxqty = $('#MaxQty').val();
	$('#filtereddata').html("");
	var api = "http://localhost:8055/amazon.com/webapi/AdminController/displayprodseller/"+userId;
	$.get(api , function(data, status){
	    data.forEach(function(prod){
	    	console.log(prod);
	    	var api2 = "http://localhost:8055/amazon.com/webapi/OrderController/getOrdersOfSeller/"+userId;
	    	$.get(api2 , function(data2, status){
	    		var qtysold = 0;
	    	    data2.forEach(function(order){
	    	    	var items = order.ordereditemlist;
	    	    	items.forEach(function(item){	
	    	    		//item.status == "DELIVERED"
	    	    		if(item.productid == prod.id && item.status == "DELIVERED"){
	    	    			qtysold += (item.quantity + item.freequantity);
	    	    		}
	    	    	});
	    	    });	
	    	    
	    	    if(qtysold >= minqty && qtysold <= maxqty){
		    	    $('#filtereddata').append(
						"<div class='col-md-4'>" +
							"<figure class= 'card card-product'>" +
        						"<div class='img-wrap'> <img src='"+prod.product_images[0].url+"'> </div>" +
        				
            					"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspid:" + prod.id + "</br>" +
            					"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspQty Sold:" + qtysold + "</br>" +
            					"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPrice:" + prod.discountedprice + "</br>" +
           						
    						"</figure>"+
   
						"</div>"
	    	    );
		    	    
		    	    
	    		}	
	    	});
	    	
	    
				
	    });		
	});
}
</script>

<!--  <script src="js/admin_layout.js" type="text/javascript"></script>  -->
</head>
<body>
 <%@include file="header.jsp" %>
<div id="admin_header_container">

        

</div>
<!--  --------------------------------------------main    body------------------------------------------------------------   -->
 <section class="section-main bg padding-y-sm">
<div class="card">
  <div class="card-body" >
  
  <table>
  <tr>
  <td>Enter Seller id:</td>
  <td><input name="sellerid" class="form-control"  id="sellerid"></td>
  <td><button type="button" name="Submit" class="btn btn-warning btn-block" id ="addaddress" onclick="showitems();"> Submit </button></td>
  </tr>
  </table>
  <br/>
  
  <table id="prod_sellertable" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Sr No</th>
                <th>Item Id</th>
                <th>Item Name</th>
                <th>QtyItem Sold</th>
            </tr>
        </thead>
        <tbody id="prod_sellerList">
        	
        </tbody>
  </table>
  	
  	<div id='showLater'>
  		<li class="list-inline-item">
		  	<div class="form-inline">
		  		<label class="mr-2">Range QtyItem Sold:</label>
				From<input id="MinQty" class="form-control form-control-sm" placeholder="Min" type="number" value="0">
					<span class="px-2"> - </span>
				To<input id="MaxQty" class="form-control form-control-sm" placeholder="Max" type="number" value="10">
				<button id="applyFilter" type="submit" class="btn btn-sm ml-2" onclick="loadListings();">Submit</button>
			</div>
		 </li>
  	</div>
    <br/><br/>
    <div class="row-sm" id='filtereddata'>
    
    </div>
    
    
    
    
</section>

 <!--  ---------------------------------------------main    body  end---------------------------------------------------------  -->
 


<div id="admin_footer_container">

</div>
<!-- ========================= FOOTER END // ========================= -->


</body>

</html>
