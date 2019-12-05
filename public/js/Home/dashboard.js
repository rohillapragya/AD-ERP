$(document).ready(function(){
	$.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
	    url:  '/inquiry/getCartCount',
	    dataType: 'json',
	    success: function (resp) 
	    {
        	//location.reload(true/false);
        	var cart_count = resp[0].total;
        	var userCartCount = document.getElementById("userCartCount");
            userCartCount.innerText=cart_count;
        }
    });
});