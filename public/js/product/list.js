$(document).ready(function(){
	onClickCategory(1);

	//var cartid = document.getElementById('cartid').value;
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
	        	for(var i=0;i<length;i++)
	        	{
	        		$("#home").append("<div class='form-group row'>"+ 
	        				"<div class='card card-class' style='width: 775px;'>"+
	        					"<div class='card-header card_header'> "+resp[i].name+" </div>"+
	        					"<div class='card-body'>"+
	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Code </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'>"+resp[i].code+"</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>BOTANICAL Name </div>"+
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

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Price </div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'><i style='font-size:15px' class='fa fa-inr'></i> "+resp[i].min_price+" - "+resp[i].max_price+" KG</div>"+ 
	        						"</div>"+

	        						"<div class='row'>"+ 
	        							"<div class='col-md-4' style='font-size: 15px;font-weight: 600;margin-top: 1%;text-transform: uppercase;'>Price Valid Till</div>"+
	        							"<div class='col-md-8' style='font-size: 15px;margin-top: 1%;text-transform: capitalize;'> "+resp[i].valid_till+" (YYYY/MM/DD)</div>"+ 
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