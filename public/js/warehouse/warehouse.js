// console.log("this is warehouse.js");
$(document).ready(function(){

	var value = '1';
	//console.log("Value is -"+value);
	$.ajax({
	    type: 'GET', //THIS NEEDS TO BE GET
	    url: '/warehouse/getCityList',
	    dataType: 'json',
	    data : ({stateVal:value}),
	    success: function (resp) 
	    {
	       // console.log('success-'+resp);
	        var length = resp.length;
	        //console.log(resp[0].name);
	       	$("#warehouseCity").empty();
	       	for(var i=0;i<length;i++)
	        {
	          // console.log("name-"+name);
	           $('#warehouseCity').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
	       	}
	    },
	    error:function()
	    { 
	         console.log('error');
	    }
	});
	
});


function validateAddress()
{
    var address = document.getElementById("warehouse_address");
   
    var address_value = address.value;
   
    var address_string = address_value.replace(/[^a-zA-Z0-9]/g, ' ');
   
    address.value = address_string;
}


function onChangeState(obj)
{
	//console.log("onchange called");
	var value = obj.value;
	//console.log("Value is -"+value);
	$.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/warehouse/getCityList',
        dataType: 'json',
        data : ({stateVal:value}),
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
           	$("#warehouseCity").empty();
           	for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#warehouseCity').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
           	}
        },
        error:function()
        { 
             console.log('error');
        }
    });
}