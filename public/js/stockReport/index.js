$(document).ready(function(){
    populate();
});

function populate()
{
    //console.log("on Body function called");
    var item_qty_inward_class = document.getElementsByClassName("item_qty_inward_class");

    var item_qty_inward_class_len = item_qty_inward_class.length;
  
    var item_qty_inward_control_class = document.getElementsByClassName("item_qty_inward_control_class");

    var item_qty_inward_class_diff = document.getElementsByClassName("item_qty_inward_class_diff");

    var item_qty_outward_class = document.getElementsByClassName("item_qty_outward_class");

    var item_qty_outward_control_class = document.getElementsByClassName("item_qty_outward_control_class");

    var item_qty_outward_class_diff = document.getElementsByClassName("item_qty_outward_class_diff");

    for (i = 0; i < item_qty_inward_class_len; i++) 
    {
       // console.log(i);
        var item_qty_class_value = item_qty_inward_class[i].innerText;

        var item_qty_control_class_value = item_qty_inward_control_class[i].innerText;

        var diff = item_qty_class_value - item_qty_control_class_value;

        item_qty_inward_class_diff[i].innerText = diff;

        if (diff <0) { 
            item_qty_inward_class_diff[i].parentNode.style.backgroundColor = "#fb4f14";
            item_qty_inward_control_class[i].parentNode.style.backgroundColor = "#fb4f14";
            item_qty_inward_class[i].parentNode.style.backgroundColor = "#fb4f14";
        }


        var item_qty_outward_class_value = item_qty_outward_class[i].innerText;

        var item_qty_outward_control_class_value = item_qty_outward_control_class[i].innerText;

        var diff_outward = item_qty_outward_class_value - item_qty_outward_control_class_value;

        item_qty_outward_class_diff[i].innerText = diff_outward;

        if (diff_outward <0) { 
            item_qty_outward_class_diff[i].parentNode.style.backgroundColor = "#ff7f50";
            item_qty_outward_control_class[i].parentNode.style.backgroundColor = "#ff7f50";
            item_qty_outward_class[i].parentNode.style.backgroundColor = "#ff7f50";
        }
    }
}


function onClickStockByWarehouseId()
{
    var warehouseid = document.getElementById("warehouseid");

    var warehouseValue = warehouseid.value;

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/stock/getStockByWarehouseId',
        dataType: 'json',
        data : ({warehouseID:warehouseValue}),
        success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
           // console.log(resp[0].name);
            $("#stockListTbody").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
              // $('#stockListTbody').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");

                $('#stockListTbody').append("<tr><td>"+(i+1)+"</td><td>"+resp[i].item_code+"</td><td>"+resp[i].product_name+"</td><td>"+resp[i].botanical_name+"</td><td>"+resp[i].warehouse_name+"</td><td><span class='item_qty_inward_class'>"+resp[i].Inward_item_qty+"<span></td> <td><span class='item_qty_outward_class'>"+resp[i].Inward_control_qty+"</span></td> <td><span class='item_qty_inward_control_class'>"+resp[i].Outward_item_qty+"</span></td> <td><span class='item_qty_outward_control_class'>"+resp[i].Outward_control_qty+"</span></td> <td><span class='item_qty_inward_class_diff'></span></td> <td>"+resp[i].item_uom+"</td> <td><span class='item_qty_outward_class_diff'></span></td><td>"+resp[i].control_uom+"</td></tr>");
            }
            populate();
        },
        error:function()
        { 
             console.log('error');
        }
    });
}