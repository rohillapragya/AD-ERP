$(document).ready(function(){
	onClickCategory(1);

	var cartid = document.getElementById('cartid').value;
	//console.log("Cart Id-"+cartid);
});
function onClickCategory(id)
{
	var home = document.getElementById("home");
	//console.log("Category Id is-"+id);
	home.innerText=''; // clear all text inside
	//home.append("hello");
	var div = document.createElement("div");

	home.appendChild(div);

	$.ajax({
	    type: 'GET', //THIS NEEDS TO BE GET
	    url: '/product/getProductByCategoryId',
	    dataType: 'json',
	    data : ({category:id}),
	    success: function (resp) 
	    {
	       // console.log('success-'+resp);
	        var length = resp.length;
	       // console.log(resp[0]);

	        if(length>0)
	        {
	        	// $("#home").append("<div style='font-size: 16px;color: #e76908;'>Oops !!!! ...  product found under this category.</div>"); 
	        	// $("#home").append("<div class='form-group row'> <div class='card card-class'><div class='card-header card_header'>"+resp[0].category_name+" </div>"); 

	        	for(var i=0;i<length;i++)
	        	{
	        		var product_id ='product_'+resp[i].id;

	        		var add_as_inquiry_id ='product_button_'+resp[i].id;

	        		$("#home").append("<div class='form-group row'>"+ 
	        				"<div class='card card-class' style='width: 775px;'>"+
	        					"<div class='card-header card_header'> "+resp[i].name+" </div>"+
	        					"<div class='card-body'>"+
	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>botanical Name </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].scrientific_name+"</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Method </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].method_name+"</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Specification </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].specification+"</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Application </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].application+"</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>HSN Code </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].hsn_code+"</div>"+ 
	        						"</div>"+

	        						"<div class='row' style='margin-top: 4%'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Quantity </div>"+
	        							"<div class='col-md-8 card-block-detail'> <input type='number' id="+product_id+" class='form-control' placeholder='qty' style='width: 30%' min='0'> </div>"+ 
	        						"</div>"+

	        						"<div class='row' style='margin-top: 4%'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'> </div>"+
	        							"<div class='col-md-8 card-block-detail'> <button type='button' class='btn btn-success' onClick='onCLickAddAsInquiry("+resp[i].id+")' style='width: 40%' id="+add_as_inquiry_id+">Add As Inquiry</button> </div>"+ 
	        						"</div>"+

	        					"</div>"+ 
	        				"</div>");
	        	}
	        }
	        else
	        {
	        	// div.append("<div>Oops !!!! ... No product found under this category. Please try either with another Category or add as Wish.</div>");
	        	$("#home").append("<div style='font-size: 16px;color: #e76908;'>Oops !!!! ... No product found under this category. Please try either with another Category or add as Wish.</div>"); 
	        }
	       
	    },
	    error:function()
	    { 
	         console.log('error');
	    }
	});
}


function onCLickAddAsInquiry(product_id)
{
	//console.log("product Id-"+product_id);

	var el_id = "product_"+product_id;

	var btn_id ="product_button_"+product_id;

	var product_qty = document.getElementById(el_id).value;

	//console.log("product_qty-"+product_qty);

	var cart_id = cartid.value;

	if(product_qty)
	{
		// console.log("cartid-"+cart_id);
		// console.log("product_id-"+product_id);
		// console.log("product_qty-"+product_qty);
		$.ajax({
	        type: 'POST', 
	        url: '/inquiry/addProductInCart',
	        dataType: 'json',
	        data : ({cart_id:cart_id,product_id:product_id,product_qty:product_qty}),
	        beforeSend: function (request) {
	            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
	        },
	        success: function (resp) 
	        {
            	//location.reload(true/false);
            	//console.log("resp-"+resp);
            	var cart_count = resp[0].total;
            	//console.log("btn-"+btn_id);

            	var btn = document.getElementById(btn_id);
            	btn.innerText="ADDED";
            	btn.style.backgroundColor="#4d4d33";

            	var userCartCount = document.getElementById("userCartCount");
            	userCartCount.innerText=cart_count;

            	console.log("el_id-"+el_id);
            	document.getElementById(el_id).readOnly = true
	        }
	    });
	}
}