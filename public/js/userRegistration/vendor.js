$(document).ready(function(){
	// document.getElementById("name_address_business_country_name").selectedIndex = "3";
});


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

// function onClickChangeStatus(id,status)
// {
// 	console.log("ID is-"+id+"-status-"+status);

// 	 $.ajax({
//         type: 'POST', //THIS NEEDS TO BE GET
//         url: '/erpUser/changeStatus',
//         dataType: 'json',
//         data : ({id:id,status:status}),
//         beforeSend: function (request) {
//             return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
//         },
//         success: function (resp) 
//         {
//             location.reload(true/false);
//         }
//     });
// }