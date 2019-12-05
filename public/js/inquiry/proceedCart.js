$(document).ready(function(){
	document.getElementById("billing_address_country_name").selectedIndex = "3";
    document.getElementById("shipping_address_country_name").selectedIndex = "3";
});

function onChangeCountry(obj)
{
     //console.log("onchange called");
    var value = obj.value;
    //console.log("Value is -"+value);
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/warehouse/getStateList',
        dataType: 'json',
        data : ({CountyrVal:value}),
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            $("#billing_address_state_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#billing_address_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
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
            $("#billing_address_city_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#billing_address_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}


function validateAddress(){

    var description = document.getElementById("billing_address");
   // console.log("in validateAddress field");
    var description_value = description.value;
    var description_string = description_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = description_string;
}

function onkeyupRemarks()
{
    var max_char = 100;

    var remarks = document.getElementById("billing_address");

    var remarks_len = remarks.textLength;
   
    var remaining_len = max_char - remarks_len;

    var billing_address_span = document.getElementById("billing_address_span");

    billing_address_span.innerText=remaining_len+" characters are remaining";
}



function onChangeShippingCountry(obj)
{
     //console.log("onchange called");
    var value = obj.value;
    //console.log("Value is -"+value);
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/warehouse/getStateList',
        dataType: 'json',
        data : ({CountyrVal:value}),
        success: function (resp) 
        {
            console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            $("#shipping_address_state_name").empty();
            for(var i=0;i<length;i++)
            {
                console.log("name-"+name);
               $('#shipping_address_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}

function onChangeShippingState(obj)
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
            $("#shipping_address_city_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#shipping_address_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}

function onkeyupShippingRemarks()
{
     var description = document.getElementById("shipping_address");
   // console.log("in validateAddress field");
    var description_value = description.value;
    var description_string = description_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = description_string;
}

function validateShippingAddress()
{
    var max_char = 100;

    var remarks = document.getElementById("shipping_address");

    var remarks_len = remarks.textLength;
   
    var remaining_len = max_char - remarks_len;

    var shipping_address_span = document.getElementById("shipping_address_span");

    shipping_address_span.innerText=remaining_len+" characters are remaining";
}

function sameAsBillingAddress()
{
    var checkBox = document.getElementById("myCheck");
    
    if (checkBox.checked == true)
    {
       // console.log("checked");

        var billing_pin = document.getElementById("billing_pin").value;
        document.getElementById("shipping_pin").value=billing_pin;

        var billing_address = document.getElementById("billing_address").value;
        document.getElementById("shipping_address").value=billing_address;


        var billing_country = document.getElementById("billing_address_country_name").selectedIndex;
        document.getElementById("shipping_address_country_name").selectedIndex=billing_country;

        var shipping_country = document.getElementById("shipping_address_country_name").value;
       
            $.ajax({
                type: 'GET', //THIS NEEDS TO BE GET
                url: '/warehouse/getStateList',
                dataType: 'json',
                data : ({CountyrVal:shipping_country}),
                success: function (resp) 
                {
                    //console.log('success-'+resp);
                    var length = resp.length;
                    $("#shipping_address_state_name").empty();
                    for(var i=0;i<length;i++)
                    {
                        console.log("name-"+name);
                       $('#shipping_address_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                    }
                    
                    var billing_state = document.getElementById("billing_address_state_name").selectedIndex;
                    document.getElementById("shipping_address_state_name").selectedIndex=billing_state;

                    var shipping_state = document.getElementById("shipping_address_state_name").value;
                        $.ajax({
                            type: 'GET', //THIS NEEDS TO BE GET
                            url: '/warehouse/getCityList',
                            dataType: 'json',
                            data : ({stateVal:shipping_state}),
                            success: function (resp) 
                            {
                                var length = resp.length;
                                $("#shipping_address_city_name").empty();
                                for(var i=0;i<length;i++)
                                {
                                  // console.log("name-"+name);
                                   $('#shipping_address_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                                }
                                 var billing_city = document.getElementById("billing_address_city_name").selectedIndex;
                                document.getElementById("shipping_address_city_name").selectedIndex=billing_city;
                            },
                            error:function()
                            { 
                                 console.log('error');
                            }
                        });

                },
                error:function()
                { 
                     console.log('error');
                }
            });

           
    } 
    else 
    {
        console.log("not checked");
        document.getElementById("shipping_pin").value='';
        document.getElementById("shipping_address").value='';
        document.getElementById("shipping_address_country_name").selectedIndex = "3";

         $.ajax({
            type: 'GET', //THIS NEEDS TO BE GET
            url: '/warehouse/getStateList',
            dataType: 'json',
            data : ({CountyrVal:101}),
            success: function (resp) 
            {
                //console.log('success-'+resp);
                var length = resp.length;
                $("#shipping_address_state_name").empty();
                for(var i=0;i<length;i++)
                {
                    console.log("name-"+name);
                   $('#shipping_address_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                }
                
                // var billing_state = document.getElementById("billing_address_state_name").selectedIndex;
                // document.getElementById("shipping_address_state_name").selectedIndex=billing_state;

                var shipping_state = document.getElementById("shipping_address_state_name").value;
                    $.ajax({
                        type: 'GET', //THIS NEEDS TO BE GET
                        url: '/warehouse/getCityList',
                        dataType: 'json',
                        data : ({stateVal:shipping_state}),
                        success: function (resp) 
                        {
                            var length = resp.length;
                            $("#shipping_address_city_name").empty();
                            for(var i=0;i<length;i++)
                            {
                              // console.log("name-"+name);
                               $('#shipping_address_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                            }
                            // var billing_city = document.getElementById("billing_address_city_name").selectedIndex;
                            // document.getElementById("shipping_address_city_name").selectedIndex=billing_city;
                        },
                        error:function()
                        { 
                             console.log('error');
                        }
                    });

            },
            error:function()
            { 
                 console.log('error');
            }
        });
    }
}