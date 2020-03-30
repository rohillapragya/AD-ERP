$(document).ready(function(){
    populate();
});

function populate()
{
    var item_qty_inward_class = document.getElementsByClassName("item_qty_inward_class");

    var item_qty_inward_class_len = item_qty_inward_class.length;
  
    var item_qty_inward_control_class = document.getElementsByClassName("item_qty_inward_control_class");

    var item_qty_inward_class_diff = document.getElementsByClassName("item_qty_inward_class_diff");

    var item_qty_outward_class = document.getElementsByClassName("item_qty_outward_class");

    var item_qty_outward_control_class = document.getElementsByClassName("item_qty_outward_control_class");

    for (i = 0; i < item_qty_inward_class_len; i++) 
    {
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

        if (diff_outward <0) 
        { 
            item_qty_outward_control_class[i].parentNode.style.backgroundColor = "#ff7f50";
            item_qty_outward_class[i].parentNode.style.backgroundColor = "#ff7f50";
        }
    }
}


function onClickStockByWarehouseId()
{
    var warehouseid = document.getElementById("warehouseid");

    var warehouseValue = warehouseid.value;

    var productCode = document.getElementById("productCode");

    var productCodeValue = productCode.value;


    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/stock/getStockByWarehouseId',
        dataType: 'json',
        data : ({warehouseID:warehouseValue,productCode:productCodeValue}),
        success: function (resp) 
        {
            var length = resp.length;
            $("#stockListTbody").empty();

            if(length > 0)
            {
                for(var i=0;i<length;i++)
                {
                  $('#stockListTbody').append("<tr><td>"+(i+1)+"</td><td>"+resp[i].item_code+"</td><td>"+resp[i].product_name+"</td><td>"+resp[i].botanical_name+"</td><td>"+resp[i].warehouse_name+"</td><td style='text-align: right'><span class='item_qty_inward_class'>"+resp[i].Inward_item_qty+"<span></td> <td style='text-align: right'><span class='item_qty_outward_class'>"+resp[i].Inward_control_qty+"</span></td> <td style='text-align: right'><span class='item_qty_inward_control_class'>"+resp[i].Outward_item_qty+"</span></td> <td style='text-align: right'><span class='item_qty_outward_control_class'>"+resp[i].Outward_control_qty+"</span></td> <td style='text-align: right'><span class='item_qty_inward_class_diff'></span></td> <td style='text-align: right'>"+resp[i].item_uom+"</td></tr>");
                }
                populate();
            }
            else
            {
                $('#stockListTbody').append("<tr><td colspan='12' class='no-data-found'>No record(s) found</td></tr>");
            }
            
        },
        error:function()
        { 
             console.log('error');
        }
    });
}