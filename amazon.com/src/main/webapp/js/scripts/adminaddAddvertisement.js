

$(document).ready(function() {
	
	
	var api;
	api = "http://localhost:8055/amazon.com/webapi/CategoryController/allcategories";

	$.get(api , function(data, status){

	    var myString="";
	    
			
	    for(var i = 0; i < data.length; i++)
		{
	    	 //myString = myString + "<a href='#'><p onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a></p> ";
	    	 //myString = myString + "<a href='#' onclick = \"subcat('" +data[i].categoryname+"');\">"+data[i].categoryname +" </a>";
	    	 myString=myString+"<option value = '"+ data[i].cat_id +"'>"+ data[i].categoryname +"</option>";
		}
	   
	    //alert(""+myString);
	    
	    $('#category').append(myString);
	    

			});		
	
	
	
	
$('#addStudentImageSelect').change(function (e) {
	    
	    var oFReader = new FileReader();
	    oFReader.readAsDataURL(document.getElementById("addStudentImageSelect").files[0]);
	
	    oFReader.onload = function (oFREvent) {
	        document.getElementById("addStudentImage").src = oFREvent.target.result;
	    };
	});

});




function addProduct() {
	var form = $('#productForm')[0];
    var udata = new FormData(form);
    
    
    $.ajax({
    	type: "POST",
		enctype: 'multipart/form-data',
        url: "http://localhost:8055/amazon.com/webapi/AdvertismentController/addadvert",
        data: udata, 
       	processData: false,
        contentType: false,
        cache: false,
        async: true,
        timeout: 600000,
        success:function(result){
        	//window.alert(result);
        	//window.location.href="http://localhost:8055/amazon.com/";
        	alert("Success!");
        	//location.reload(true);
        }       
    });
}