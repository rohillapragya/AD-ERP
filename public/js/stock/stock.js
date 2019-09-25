$(document).ready(function(){
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/getMethodList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#method").empty();
            for(var i=0;i<length;i++) { $('#method').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
        },
        error:function() {  console.log('error');}
    });

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/uom',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#uom").empty();
            $("#product_sample_uom").empty();

            for(var i=0;i<length;i++) {
                $('#uom').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                $('#product_sample_uom').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function() {   console.log('error');}
    });

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/product/getProductList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#product_name").empty();
            for(var i=0;i<length;i++) { $('#product_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>"); }      
        },
        error:function()   { console.log('error');  }
    });  
});

function addSampleNewRow()
{
    var table = document.getElementById("stockItemsDetails");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);

    var cell_sn = row.insertCell(0);
    var cell_product_name = row.insertCell(1);
    var cell_product_method = row.insertCell(2);
    var cell_product_qty = row.insertCell(3);
    var cell_product_uom = row.insertCell(4);
    var cell_product_sample_qty = row.insertCell(5);
    var cell_product_sample_uom = row.insertCell(6);
    var cell_product_action = row.insertCell(7);

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";

    var product_name_id = "product_name_"+table_tr_count;
    var method_id = "method_"+table_tr_count;
    var uom_id = "uom_"+table_tr_count;
    var qty_id = "qty"+table_tr_count;
    var product_sample_qty = "product_sample_qty_"+table_tr_count;
    var product_sample_uom = "product_sample_uom_"+table_tr_count;

    cell_product_name.innerHTML="<select name='product_name[][product_code]' class='form-control' id='"+product_name_id+"' style='width:250px')><option value='0'>NA</option></select>";

    cell_product_method.innerHTML = "<select name='product_method[][method]' class='form-control' id='"+method_id+"' style='width:150px'><option value='0'>Select Method</option></select>";

    cell_product_qty.innerHTML = "<input class='form-control qty' id='"+qty_id+"' type='number' name='product_qty[][qty]' placeholder='qty' min='0'>";

    cell_product_uom.innerHTML = "<select name='product_uom[][uom]' class='form-control' id='"+uom_id+"'><option value='1'>KG</option></select>";

    cell_product_sample_qty.innerHTML = "<input class='form-control qty' id='"+product_sample_qty+"' type='number' name='product_sample_qty[][product_sample_qty]' placeholder='sample qty' min='0'>";

    cell_product_sample_uom.innerHTML = "<select name='product_sample_uom[][product_sample_uom]' class='form-control' id='"+product_sample_uom+"'><option value='1'>KG</option></select>";

    cell_product_action.innerHTML = "<span class='glyphicon glyphicon-remove' id='"+table_tr_count+"' onclick=ondeleteProductFromTable(this)></span>";

    populateInfo(table_tr_count);
}

function populateInfo(obj)
{
    $.ajax({
        type: 'GET',
        url: '/product/getProductList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#product_name_"+obj).empty();
            for(var i=0;i<length;i++){  $("#product_name_"+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>"); }  
        },
        error:function(){  console.log('error');}
    });

    $.ajax({
        type: 'GET', 
        url: '/product/getMethodList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;            
            $("#method_"+obj).empty();
            for(var i=0;i<length;i++){ $('#method_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>"); }
        },
        error:function(){  console.log('error'); }
    });

    $.ajax({
        type: 'GET',
        url: '/product/uom',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;     
            $("#uom_"+obj).empty();
            $("#product_sample_uom_"+obj).empty();

            for(var i=0;i<length;i++)
            {
                $('#uom_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                $('#product_sample_uom_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function(){  console.log('error'); }
    }); 
}


function ondeleteProductFromTable(el){

    var id = parseInt(el.id) +1;
    var table = document.getElementById("stockItemsDetails");
    var table_tr_count = table.children[1].children.length;
    row_delete = table.deleteRow(id);
}

function validateAddress(){

    var description = document.getElementById("stock_entry_description");
    var description_value = description.value;
    var description_string = address_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = address_string;
}

function onChangeEntryTypeDetails(obj)
{
    var value = obj.value;
    //console.log("Value is -"+value);
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/stock/getStockEntryTypeDetails',
        dataType: 'json',
        data : ({stockEntryType:value}),
        success: function (resp) 
        {
           // console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            $("#stockEntryTypeDetails").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#stockEntryTypeDetails').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}