$(document).ready(function(){
	document.getElementById("name_address_business_country_name").selectedIndex = "3";
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
            $("#name_address_business_state_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#name_address_business_state_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
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
            $("#name_address_business_city_name").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#name_address_business_city_name').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}



function addNewContactsInformation()
{
    var table = document.getElementById("contactsInformationDetails");
    var table_tr_count = table.children[1].children.length;

    var row = table.insertRow(table_tr_count+1);

    var cell_sn = row.insertCell(0);
    var cell_contact_type = row.insertCell(1);
    var cell_first_name = row.insertCell(2);
    var cell_last_name = row.insertCell(3);
    var cell_email = row.insertCell(4);
    var cell_phone_mobile = row.insertCell(5);
    var cell_product_action = row.insertCell(6);
   

    cell_sn.innerHTML = "<span style='vertical-align:middle'>"+(parseInt(table_tr_count)+1)+"</span>";
    var contact_type_id = "contact_information_type_"+table_tr_count;
    var first_name_id = "contact_information_first_name_"+table_tr_count;
    var last_name_id = "contact_information_last_name_"+table_tr_count;
    var contact_information_email_id = "contact_information_email_"+table_tr_count;
    var contact_information_mobile_id = "contact_information_mobile_"+table_tr_count;

    cell_contact_type.innerHTML="<select name='contact_information_type[][contact_type]' class='form-control' id='"+contact_type_id+"' style='width: 250px'><option value='0'>NA</option></select>";

    cell_first_name.innerHTML = " <input class='form-control' id='"+first_name_id+"' type='text' name='contact_information_first_name[][contact_information_first_name]' placeholder='first_name' required='required'>";

    cell_last_name.innerHTML = "<input class='form-control' id='"+last_name_id+"' type='text' name='contact_information_last_name[][contact_information_last_name]' placeholder='last_name' required='required'>";

    cell_email.innerHTML = "<input class='form-control' id='"+contact_information_email_id+"' type='email' name='contact_information_email[][contact_information_email]' placeholder='email' required='required'>";

    cell_phone_mobile.innerHTML = "<input class='form-control' id='"+contact_information_mobile_id+"' type='number' name='contact_information_mobile[][contact_information_mobile]' placeholder='mobile' required='required' minlength='10' maxlength='10'>";

    cell_product_action.innerHTML = "<span class='glyphicon glyphicon-remove' id='"+table_tr_count+"' onclick=ondeleteContactInformationFromTable(this)></span>";

    populateInfo(table_tr_count);
}

function populateInfo(obj)
{
    $.ajax({
        type: 'GET',
        url: '/user/userContactInformation',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#contact_information_type_"+obj).empty();
            for(var i=0;i<length;i++){  $("#contact_information_type_"+obj).append("<option value="+resp[i].Id+">"+resp[i].type+"</option>"); }  
        },
        error:function(){  console.log('error');}
    });
}

function ondeleteContactInformationFromTable(el)
{
    var id = parseInt(el.id) +1;
    var table = document.getElementById("contactsInformationDetails");
    var table_tr_count = table.children[1].children.length;
    row_delete = table.deleteRow(id);
}


function checkIfUserExist(el)
{
    var element = el;
    var comanyName = document.getElementById(element).value;
    //console.log(comanyName);

    if(comanyName)
    {
        $.ajax({
            type: 'GET',
            url: '/user/IsCompanyExits',
            dataType: 'json',
            data : ({companyName:comanyName}),
            success: function (resp) 
            {
                var length = resp.length;
                var total = resp[0].total;

                if(total > 0)
                {
                    //console.log('total is greater than 0');

                    //console.log('success');
                    swal({
                        type: 'error',
                        html: 'Customer Already Exists.Customer Registered By  Respected <h3>'+resp[0].joined_by_first_name+' '+resp[0].joined_by_last_name+'</h3>. Please update Administrator (Super Admin) to change Sales Exective.',
                    })
                    document.getElementById(element).value='';
                }
            },
            error:function(){  console.log('error');}
        });
    }
}

function checkGSTN(el)
{
    var element = el;
    var gstn = document.getElementById(element).value;

     if(gstn)
    {
        $.ajax({
            type: 'GET',
            url: '/user/IsGSTNExits',
            dataType: 'json',
            data : ({gstn:gstn}),
            success: function (resp) 
            {
                var length = resp.length;
                var total = resp[0].total;

                if(total > 0)
                {
                   // console.log('total is greater than 0');

                   // console.log('success');
                    swal({
                        type: 'error',
                        html: 'GSTN number already exists with Customer - <h3>'+resp[0].company_name+'</h3>',
                    })
                    document.getElementById(element).value='';
                }
            },
            error:function(){  console.log('error');}
        });
    }
}
