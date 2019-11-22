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

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/warehouse/getWarehouseList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#product_source_warhouse").empty();
            for(var i=0;i<length;i++) { $('#product_source_warhouse').append("<option value="+resp[i].id+">"+resp[i].name+"</option>"); }      
        },
        error:function()   { console.log('error');  }
    });  

});

function addSampleNewRow()
{
    var table = document.getElementById("productionItemsDetails");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);

    var cell_sn = row.insertCell(0);
    var cell_product_name = row.insertCell(1);
    var cell_product_source_warehouse = row.insertCell(2);
    var cell_product_method = row.insertCell(3);
    var cell_product_required_qty = row.insertCell(4);
    var cell_product_transfered_qty = row.insertCell(5);
    var cell_product_consumed_qty = row.insertCell(6);
    var cell_product_uom = row.insertCell(7);
    var cell_product_action = row.insertCell(8);

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";

    var product_name_id = "product_name_"+table_tr_count;
    var method_id = "method_"+table_tr_count;
    var uom_id = "uom_"+table_tr_count;
    var required_qty_id = "required_qty"+table_tr_count;
    var transfered_qty_id = "transfered_qty"+table_tr_count;
    var consumed_qty_id = "consumed_qty_"+table_tr_count;
    var product_source_warehouse_id = "product_source_warhouse_"+table_tr_count;

    cell_product_name.innerHTML="<select name='product_name[][product_code]' class='form-control' id='"+product_name_id+"' style='width:250px')><option value='0'>NA</option></select>";

    cell_product_source_warehouse.innerHTML="<select name='product_source_warhouse[][product_source_warhouse]' class='form-control' id='"+product_source_warehouse_id+"' style='width:150px')><option value='0'>NA</option></select>";

    cell_product_method.innerHTML = "<select name='product_method[][method]' class='form-control' id='"+method_id+"' style='width:101px'><option value='0'>Select Method</option></select>";

    cell_product_required_qty.innerHTML = "<input class='form-control qty' id='"+required_qty_id+"' type='number' name='product_required_qty[][product_required_qty]' placeholder='qty' required='required' min='0'>";

    cell_product_transfered_qty.innerHTML = "<input class='form-control qty' id='"+transfered_qty_id+"' type='number' name='product_transfered_qty[][product_transfered_qty]' placeholder='qty' required='required' min='0'>";


    cell_product_consumed_qty.innerHTML = "<input class='form-control qty' id='"+consumed_qty_id+"' type='number' name='product_consumed_qty[][product_consumed_qty]' placeholder='qty' required='required' min='0'>";

    cell_product_uom.innerHTML = "<select name='product_uom[][uom]' class='form-control' id='"+uom_id+"' style='width:80px'><option value='1'>KG</option></select>";

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

    $.ajax({
        type: 'GET',
        url: '/warehouse/getWarehouseList',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#product_source_warhouse_"+obj).empty();
            for(var i=0;i<length;i++) { $('#product_source_warhouse_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>"); }      
        },
        error:function()   { console.log('error');  }
    }); 

}


function ondeleteProductFromTable(el){

    var id = parseInt(el.id) +1;
    var table = document.getElementById("productionItemsDetails");
    var table_tr_count = table.children[1].children.length;
    row_delete = table.deleteRow(id);
}

function validateAddress(){

    var description = document.getElementById("production_remark");
   // console.log("in validateAddress field");
    var description_value = description.value;
    var description_string = description_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = description_string;
}

function onkeyupRemarks()
{
    var max_char = 2000;

    var remarks = document.getElementById("production_remark");

    var remarks_len = remarks.textLength;
   
    var remaining_len = max_char - remarks_len;

    var mrn_remark_span = document.getElementById("production_remark_span");

    mrn_remark_span.innerText=remaining_len+" characters are remaining";
}


function validateObjectID(el)
{
    var object_id = el.id;
    var object = document.getElementById(object_id);
    var object_value = object.value;

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/production/checkBOM',
        dataType: 'json',
        data : ({objectId:object_value}),
        success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            if(length <=0)
            {
                console.log("if length-"+length);
                // Swt alert
                 swal({
                    title: "Please Enter valid BOM",
                    text:  "This will not works",
                    type: "error",
                    timer: 2500,
                    showConfirmButton: false,
                    icon: "error",
                    dangerMode: true,
                });

                object.value='';
            }
            
        },
        error:function()
        { 
             console.log('error');
        }
    });
}