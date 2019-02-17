
function viewProduct() {
	if(localStorage.getItem("viewingProduct") != "") {
		var api = "http://localhost:8055/amazon.com/webapi/ProductController/productsById/"+localStorage.getItem("viewingProduct");
		var product;

		//Ajax Call for getting individual product
		$.get(api , function(data, status){
		    product = data[0];


		    //Inserting places to div
		    $('#productTitle').html(product.productname);
		    $('#originalPrice').html(product.price);
		    $('#discountedPrice').html(product.discountedprice);
		    $('#description').html(product.description);
		    $('#itemImage').html("<img src='"+product.product_images[0].url+"'/>");
		    var udata = JSON.parse(localStorage.getItem("userdata"));

		    var responsebirthdate = new Date(udata.dob);
			var currentdate = new Date();

			if(currentdate.getMonth() == responsebirthdate.getMonth()+1 &&  currentdate.getDate() == responsebirthdate.getDate() ){
				console.log(product.bdayprice);

				$('#birthday_price').html("<span class=\"currency\">INR  ₹</span><span class=\"num\" id=\"discountedPrice\">"+product.bdayprice+"</span>");
				console.log("Works");
			}
		   // $('#product_hidden').html("<input type='hidden' name='product_id' value='"+localStorage.getItem("viewingProduct")+"' id='product_id' />");
		});
		
	} else {
		window.location.href = "404.html";
	}
}

