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

var next = 1;			// fixed, please do not modfy;
var current = 0;		// fixed, please do not modfy;
var interval = 4000;	// You can set single picture show time;
var fadeTime = 800;	// You can set fadeing-transition time;
var imgNum = 5;		


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
api = "http://localhost:8055/amazon/webapi/AdvertismentController/advertisments";


$.get(api , function(data, status){
    console.log("hello");
    myString = "";
	for(i=0;i< data.length;i++)
		{
		if(i == 0) {
			var myString = myString+ "<div class='item-slide'>		<img src='http://localhost:8055/amazon/"+data[i].url+"'>		</div>";

		} else {
			var myString = myString+ "<div class='item-slide'>		<img style='display:none' src='http://localhost:8055/amazon/"+data[i].url+"'>		</div>";
	
		}
		
		/* if(i==0){
    		 $('#carouselList').append(
    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'" class="active"></li>'
    		);
    		 $('#carouselAddArea').append(
    				 '<div class="item active">' +
    			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
    			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
    			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
    			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
    			    '</div>'
    		);
		}
		else{
			 $('#carouselList').append(
    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'"></li>'
    		);
			 $('#carouselAddArea').append(
    				 '<div class="item">' +
    			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
    			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
    			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
    			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
    			    '</div>'
    		);
		} */
		}
	$('#myAdverts').html(myString+"");
	
	$('.fadeImg').css('position','relative');
	$('.fadeImg img').css({'position':'absolute','width':'100%','height':'500px'});

	nextFadeIn();
});

});
</script>

</head>
<body>
 	    <%@include file="header.jsp" %>

<body>
<h2 align="center"> Work under progress</h2>
</body>
