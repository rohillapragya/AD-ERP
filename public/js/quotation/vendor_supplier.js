$(document).ready(function(){
    document.getElementById("supplier_address_country_name").selectedIndex = "3";
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
            $("#supplier_address_state_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#supplier_address_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
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
            $("#supplier_address_city_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#supplier_address_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}



function onChangeSupplierVendor()
{
    var vale = $("#is_vendor_regisered").val();
    //console.log("vale -"+vale);

    var supplier_vendor_name = document.getElementById("supplier_vendor_name");
    var addSupplier = document.getElementById('addSupplier');

    if(vale=="YES")
    {
       // console.log("In IF");
        supplier_vendor_name.innerHTML = "Vendor Name"

        $.ajax({
            type: 'GET',
            url: '/user/getVendorList',
            dataType: 'json',
            success: function (resp) {
                var length = resp.length;
                $("#is_vendor_supplier_name").empty();

                for(var i=0;i<length;i++){
                   $("#is_vendor_supplier_name").append("<option value="+resp[i].Id+">"+resp[i].company_name+"</option>");
                }  
            },
            error:function(){ 
                 console.log('error');
            }
        });

        addSupplier.style.display="none"; // Add New Supplier button 

        var addNewSupplierID = document.getElementById("addNewSupplierID");
        addNewSupplierID.style.display="none";
    }
    else
    {
        //console.log("In ELSE");
        supplier_vendor_name.innerHTML = "Supplier Name"

        $.ajax({
            type: 'GET',
            url: '/user/getSupplierList',
            dataType: 'json',
            success: function (resp) {
                var length = resp.length;
                $("#is_vendor_supplier_name").empty();
                
                for(var i=0;i<length;i++){
                   $("#is_vendor_supplier_name").append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                }  
            },
            error:function(){ 
                 console.log('error');
            }
        });

        addSupplier.style.display="block"; // Add New Supplier button 

       
    }
}


function addNewSupplier()
{
    var addNewSupplierID = document.getElementById("addNewSupplierID");
    addNewSupplierID.style.display="block";

    var addSupplier = document.getElementById('addSupplier');
    addSupplier.style.display="none";
}

function validateAddress(){

    var description = document.getElementById("supplier_address");
   // console.log("in validateAddress field");
    var description_value = description.value;
    var description_string = description_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = description_string;
}

function onkeyupRemarks()
{
    var max_char = 200;

    var remarks = document.getElementById("supplier_address");

    var remarks_len = remarks.textLength;
   
    var remaining_len = max_char - remarks_len;

    var remark_span = document.getElementById("remark_span");

    remark_span.innerText=remaining_len+" characters are remaining";
}


function saveSupplier()
{
    console.log("Button Clicked");

    var supplier_first_name = document.getElementById("supplier_first_name");
    var supplier_first_name_val = supplier_first_name.value;

    var supplier_last_name = document.getElementById("supplier_last_name");
    var supplier_last_name_val = supplier_last_name.value;

    var supplier_address = document.getElementById("supplier_address");
    var supplier_address_val = supplier_address.value;

    var supplier_address_city_name = document.getElementById("supplier_address_city_name");
    var supplier_address_city_name_val = supplier_address_city_name.value;

    var offical_mobile = document.getElementById("offical_mobile");
    var offical_mobile_val = offical_mobile.value;

    var offical_email = document.getElementById("offical_email");
    var offical_email_val = offical_email.value;

    var personal_mobile = document.getElementById("personal_mobile");
    var personal_mobile_val = personal_mobile.value;

    var personal_email = document.getElementById("personal_email");
    var personal_email_val = personal_email.value;

    var validate_offical_email = validateEmail(offical_email);
    var validate_personal_email = validateEmail(personal_email);
    var validate_offical_mobile = validateMobile(offical_mobile);
    var validate_personal_mobile = validateMobile(personal_mobile);
  
    if((!supplier_first_name_val) || (!supplier_address_val) || (!supplier_address_city_name_val) || (!validate_offical_email)  || (!validate_offical_mobile))
    {
        if(!supplier_first_name_val) {  swal({ type: 'error', title: 'Oops !!!!  ...',text: 'Supplier first name should not be Blank.'}) } 
        if(!supplier_address_val) {  swal({ type: 'error', title: 'Oops !!!!  ...',text: 'Supplier Address should not be Blank.'}) } 
        if(!supplier_address_city_name_val) {  swal({ type: 'error', title: 'Oops !!!!  ...',text: 'Supplier City should not be Blank.'}) } 
        if(!validate_offical_email) {  swal({ type: 'error', title: 'Oops !!!!  ...',text: 'Please enter valid offical email id'}) } 
        if(!validate_offical_mobile) {  swal({ type: 'error', title: 'Oops !!!!  ...',text: 'Please enter valid offical mobile number id'}) } 
    }
    else
    {
      //  alert("in Else");

        $.ajax({
            type: 'POST',
            url: '/user/addSupplier',
            dataType: 'json',
            data : ({supplier_first_name_val:supplier_first_name_val,supplier_last_name_val:supplier_last_name_val,supplier_address_val:supplier_address_val,supplier_address_city_name_val:supplier_address_city_name_val,offical_mobile_val:offical_mobile_val,offical_email_val:offical_email_val,personal_mobile_val:personal_mobile_val,personal_email_val:personal_email_val}),
            beforeSend: function (request) {
                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
            },
            success: function (resp) 
            {
                swal({
                    type: 'success',
                    html: 'URL Added'
                })    
            },
            error:function()
            { 
                swal({
                    type: 'success',
                    html: 'Supplier Added'
                }) 

                $.ajax({
                    type: 'GET',
                    url: '/user/getSupplierList',
                    dataType: 'json',
                    success: function (resp) {
                        var length = resp.length;
                        $("#is_vendor_supplier_name").empty();
                        
                        for(var i=0;i<length;i++){
                           $("#is_vendor_supplier_name").append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                        }  
                    },
                    error:function(){ 
                         console.log('error');
                    }
                });

                var addNewSupplierID = document.getElementById("addNewSupplierID");
                addNewSupplierID.style.display="none";
            }
        });
    }

}


function validateEmail(email) 
{
    var re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    
    if (re.test(email.value)) { return true; }
    else { return false;}
}

function validateMobile(mobile)
{
    var re = /^(\+\d{1,3}[- ]?)?\d{10}$/;

    if (re.test(mobile.value)) { return true; }
    else { return false;}
}

function populateQuotationItem()
{
    alert("BTN Clicked");
}


function addNewRow()
{
    var table = document.getElementById("VendorItemsDetails");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);

    var cell_sn = row.insertCell(0);
    var cell_type = row.insertCell(1);
    var cell_type_id = row.insertCell(2);
    var cell_product_name = row.insertCell(3);
    var cell_product_method = row.insertCell(4);
    var cell_product_qty = row.insertCell(5);
    var cell_product_uom = row.insertCell(6);
    var cell_product_price = row.insertCell(7);
    var cell_product_price_valid_till = row.insertCell(8);
    var cell_product_delivery_date = row.insertCell(9);

    var supplier_vendor_type = "type_"+table_tr_count;
    var supplier_vendor_type_id = "type_id_"+table_tr_count;
    var product_name_id = "product_name_"+table_tr_count;
    var method_id = "method_"+table_tr_count;
    var uom_id = "uom_"+table_tr_count;
    var qty_id = "qty_"+table_tr_count;
    var price_id = "price_"+table_tr_count;
    var price_valid_till_id = "price_valid_till_"+table_tr_count;
    var approx_delivery_day_id = "approx_delivery_day_"+table_tr_count;

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";

    cell_type.innerHTML="<select name='type[][supplier_vendor_type]' class='form-control' id='"+supplier_vendor_type+"' style='width: 95px' onchange='onChangeSupplierVendorType(id)'><option value='VENDOR'>Vendor</option><option value='SUPPLIER'>Supplier</option></select>";

    cell_type_id.innerHTML="<select name='type_id[][supplier_vendor_id]' class='form-control' id='"+supplier_vendor_type_id+"' style='width: 140px'></select>";

    cell_product_name.innerHTML="<select name='product_name[][product_code]' class='form-control' id='"+product_name_id+"' style='width:139px')></select>";

    cell_product_method.innerHTML = "<select name='product_method[][method]' class='form-control' id='"+method_id+"' style='width: 70px'></select>";

    cell_product_qty.innerHTML = "<input class='form-control qty' id='"+qty_id+"' type='number' name='product_qty[][qty]' placeholder='qty' required='required' min='0'>";

    cell_product_uom.innerHTML = "<select name='product_uom[][uom]' class='form-control' style='width: 80px' id='"+uom_id+"'></select>";

    cell_product_price.innerHTML = "<input class='form-control price' id='"+price_id+"' type='number' name='product_price[][price]' placeholder='price' required='required' min='0'>";

    cell_product_price_valid_till.innerHTML = "<input class='form-control price_valid_till' id='"+price_valid_till_id+"' type='number' name='product_price_valid_till[][price_valid_till]'' placeholder='price_valid_till' required='required' min='0'>";  
    
    cell_product_delivery_date.innerHTML = "<input class='form-control approx_delivery_day' id='"+approx_delivery_day_id+"' type='number' name='product_approx_delivery_day[][approx_delivery_day]' placeholder='approx_delivery_day' required='required' min='0'>";    


   populateInfo(table_tr_count);
}


function populateInfo(obj)
{
    var q_id = document.getElementById("qID");
    // console.log(q_id);
    var qID = q_id.innerHTML;
    // console.log(qID);

    $.ajax({
        type: 'GET',
        url: '/getquotataionProductDetails',
        dataType: 'json',
        data : ({qID:qID}),
        success: function (resp) {
            var length = resp.length;

            // console.log("length -"+length);
            $("#product_name_"+obj).empty();
            for(var i=0;i<length;i++)
            {  
                $("#product_name_"+obj).append("<option value="+resp[i].item_code+">"+resp[i].product_name+"</option>"); 
                $("#method_"+obj).append("<option value="+resp[i].method+">"+resp[i].method_name+"</option>"); 
                $("#uom_"+obj).append("<option value="+resp[i].UOM+">"+resp[i].uom_name+"</option>"); 

            }
        },
        error:function(){  console.log('error');}
    });

    $.ajax({
        type: 'GET',
        url: '/user/getVendorList',
        dataType: 'json',
        data : ({qID:qID}),
        success: function (resp) {
            var length = resp.length;
            // console.log("length -"+length);
            $("#product_name_"+obj).empty();
            for(var i=0;i<length;i++) {  $("#type_id_"+obj).append("<option value="+resp[i].Id+">"+resp[i].company_name+"</option>"); }
        },
        error:function(){  console.log('error');}
    });
}


function onChangeSupplierVendorType(id)
{
    var value = $("#"+id).val();
    //console.log("value -"+value);
    //console.log("id -"+id);

    var res = id.split("_");

    var id_number = res[1];

    var element_id = "type_id_"+id_number;

    //console.log("element_id - "+element_id);

    if(value=='VENDOR')
    {
        $.ajax({
            type: 'GET',
            url: '/user/getVendorList',
            dataType: 'json',
            success: function (resp) {
                var length = resp.length;
                $("#"+element_id).empty();

                for(var i=0;i<length;i++){
                   $("#"+element_id).append("<option value="+resp[i].Id+">"+resp[i].company_name+"</option>");
                }  
            },
            error:function(){ 
                 console.log('error');
            }
        });
    }
    else
    {
        console.log("onChangeSupplierVendorType - else");

        $.ajax({
            type: 'GET',
            url: '/user/getSupplierList',
            dataType: 'json',
            success: function (resp) {
                //console.log("RESP-"+resp);
                var length = resp.length;
                $("#"+element_id).empty();
                //console.log(resp[0].id+">"+resp[0].name);
                for(var i=0;i<length;i++){
                   $("#"+element_id).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
                }  
            },
            error:function(){ 
                 console.log('error');
            }
        });
    }
}