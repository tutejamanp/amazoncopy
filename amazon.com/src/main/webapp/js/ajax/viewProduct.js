
function viewProduct() {
	if(localStorage.getItem("viewingProduct") != "") {
		var api = "http://localhost:8055/amazon.com/webapi/ProductController/productsById/"+localStorage.getItem("viewingProduct");
		var product;

		//Ajax Call for getting individual product
		$.get(api , function(data, status){
		    product = data[0];
		    
		    
		    console.log("product to be printed is :");
		    
		    console.log(product);
		    
		    
		    var api2 = "http://localhost:8055/amazon.com/webapi/UserController/checkSellerDetails/"+product.seller;
		    $.get(api2 , function(data, status){
		    	console.log(data);
			    $('#sellerInfo').html("Company Name : "+data.companyname+" <br/> User ID: "+data.userid+" Contact No: "+data.contact_no);
			});
		    
		    
		    localStorage.setItem("seller_id", product.seller);

		    //Inserting places to div
		    $('#productTitle').html(product.productname);
		    $('#originalPrice').html(product.price);
		    $('#discountedPrice').html(product.discountedprice);
		    $('#description').html(product.description);
		    $('#qty_left').html(product.quantityleft);
		    $('#itemImage').html("<img src='"+product.product_images[0].url+"'/>");
		    var udata = JSON.parse(localStorage.getItem("userdata"));

		    var responsebirthdate = new Date(udata.dob);
			var currentdate = new Date();

			if(product.offerType == "birthday" && currentdate.getMonth() == responsebirthdate.getMonth() &&  currentdate.getDate() == responsebirthdate.getDate() ){
				console.log("here");
				var discountRate = product.discountedprice * (100 - product.offerdiscpercent)/100;
				$('#discountedPrice').html("<del>"+product.discountedprice+"</del>");
				$('#birthday_price').html("<hr/>"+product.offerMessage+"<hr/><span class=\"currency\">INR  ₹</span><span class=\"num\" id=\"discountedPrice\">"+discountRate+"</span>");
				console.log("Works");
			}
			else if(product.offerType == "discount" && Date.now() < product.offerEndDate) {
				var discountRate = product.discountedprice * (100 - product.offerdiscpercent)/100;
			    $('#discountedPrice').html("<del>"+product.discountedprice+"</del>");
				$('#birthday_price').html("<hr/>"+product.offerMessage+"<hr/><span class=\"currency\">INR  ₹</span><span class=\"num\" id=\"discountedPrice\">"+discountRate+"</span>");
				$('#expiryDate').html("Expiring On :"+new Date(product.offerEndDate));
			}
			else if(product.offerType == "buy1get1" && Date.now() < product.offerEndDate) {
				//var discountRate = product.discountedprice * (100 - product.offerdiscpercent)/100;
			    //$('#discountedPrice').html("<del>"+product.discountedprice+"</del>");
				$('#birthday_price').html("<hr/>"+product.offerMessage+"<hr/>");
				$('#expiryDate').html("Expiring On :"+new Date(product.offerEndDate));
			}
		   // $('#product_hidden').html("<input type='hidden' name='product_id' value='"+localStorage.getItem("viewingProduct")+"' id='product_id' />");
		});
		
	} else {
		window.location.href = "404.html";
	}
}

