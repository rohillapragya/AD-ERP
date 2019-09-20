// console.log('This is js file.. before event');
$(document).ready(function(){
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/getMethodList',
        dataType: 'json',
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            
            $("#method").empty();
            for(var i=0;i<length;i++)
            {
               // console.log("name-"+name);
                $('#method').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/uom',
        dataType: 'json',
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            
            $("#uom").empty();
            for(var i=0;i<length;i++)
            {
               // console.log("name-"+name);
                $('#uom').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/getProductList',
        dataType: 'json',
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
           // console.log(resp[0].name);
            
            $("#product_name").empty();
            for(var i=0;i<length;i++)
            {
               // console.log("name-"+name);
                $('#product_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }

           
        },
        error:function()
        { 
             console.log('error');
        }
    });  
});

function addSampleNewRow()
{
   // console.log("btn clicked");
    var table = document.getElementById("sampleVendorItemsDetails");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);
   // console.log("Row-"+table_tr_count);
    //row_delete = table.deleteRow(index);
    var cell_sn = row.insertCell(0);
    var cell_product_name = row.insertCell(1);
    var cell_product_method = row.insertCell(2);
    var cell_product_qty = row.insertCell(3);
    var cell_product_uom = row.insertCell(4);
    var cell_product_action = row.insertCell(5);

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";

    var product_name_id = "product_name_"+table_tr_count;
    var method_id = "method_"+table_tr_count;
    var uom_id = "uom_"+table_tr_count;
    var qty_id = "qty"+table_tr_count;

    //console.log("product_name_id-"+product_name_id);

    cell_product_name.innerHTML="<select name='product_name[][product_code]' class='form-control' id='"+product_name_id+"' style='width:360px')><option value='0'>NA</option></select>";

    cell_product_method.innerHTML = "<select name='product_method[][method]' class='form-control' id='"+method_id+"' style='width:140px'><option value='0'>Select Method</option></select>";

    cell_product_qty.innerHTML = "<input class='form-control qty' id='"+qty_id+"' type='number' name='product_qty[][qty]' placeholder='qty' style='width:140px' min='1'>";

    cell_product_uom.innerHTML = "<select name='product_uom[][uom]' class='form-control' id='"+uom_id+"'><option value='1'>KG</option></select>";

    cell_product_action.innerHTML = "<span class='glyphicon glyphicon-remove' id='"+table_tr_count+"' onclick=ondeleteProductFromTable(this)></span>";

    populateInfo(table_tr_count);
    // populateProductInfoDyn(table_tr_count);
}

function populateInfo(obj)
{
    //console.log("EL-"+obj);
    $.ajax({
        type: 'GET',
        url: '/product/getProductList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#product_name_"+obj).empty();
            for(var i=0;i<length;i++){
               $("#product_name_"+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }  
        },
        error:function(){ 
             console.log('error');
        }
    });

    $.ajax({
        type: 'GET', 
        url: '/product/getMethodList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;            
            $("#method_"+obj).empty();
            for(var i=0;i<length;i++){
                $('#method_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function(){ 
             console.log('error');
        }
    });

    $.ajax({
        type: 'GET',
        url: '/product/uom',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;            
            $("#uom_"+obj).empty();
            for(var i=0;i<length;i++)
            {
                $('#uom_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function(){ 
             console.log('error');
        }
    }); 
}

function ondeleteProductFromTable(el)
{
    //console.log("ondeleteProductFromTable");

    var id = parseInt(el.id) +1;
    //console.log("id-"+id);

    var table = document.getElementById("sampleVendorItemsDetails");
    var table_tr_count = table.children[1].children.length;
    // console.log("table_tr_count-"+table_tr_count);
    //console.log("Index is-"+id);

    row_delete = table.deleteRow(id);
}
function validateAddress()
{
    var address = document.getElementById("address");
    var address_value = address.value;
   
    var address_string = address_value.replace(/[^a-zA-Z0-9]/g, ' ');
    console.log("address_string-"+address_string);
    address.value = address_string;
}