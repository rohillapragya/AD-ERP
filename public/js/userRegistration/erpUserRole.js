$(document).ready(function(){
	populate();
});


function populate()
{
    var user_dept= document.getElementById("user_dept");

    var user_dept_selected_index =  user_dept.selectedIndex;

    var user_dept_selected_index_innerHTML = user_dept[user_dept_selected_index].innerHTML;

	$.ajax({
        type: 'GET', 
        url: '/user/getRole',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_dept").empty();
            for(var i=0;i<length;i++) { $('#user_dept').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}

           
        },
        error:function() {  console.log('error');}
    });

    
    $.ajax({
        type: 'GET', 
        url: '/user/getLocation',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_location").empty();
            for(var i=0;i<length;i++) { $('#user_location').append("<option value="+resp[i].id+">"+resp[i].location+"</option>");}
        },
        error:function() {  console.log('error');}
    });

}

function onChangeRole()
{
    console.log('onChangeRoleRole function called');

    var user_dept= document.getElementById("user_dept");
    var user_dept_selected_index =  user_dept.selectedIndex;
    var user_dept_selected_index_innerHTML = user_dept[user_dept_selected_index].innerHTML;

    var user_menu= document.getElementById("user_menu");
    var user_menu_selected_index =  user_menu.selectedIndex;
    var user_menu_selected_index_innerHTML = user_menu[user_menu_selected_index].innerHTML;

    var user_access= document.getElementById("user_access");
    var user_access_selected_index =  user_access.selectedIndex;
    var user_access_selected_index_innerHTML = user_access[user_access_selected_index].innerHTML;

    if(user_dept_selected_index_innerHTML=='Administartor')
    {
        //alert('Opps!! ..You cant add another access for this particular user..');
        $("#user_menu").empty(); $('#user_menu').append("<option value='0'>ALL</option>");
        $("#user_access").empty(); $('#user_access').append(" <option value='O'>ALL</option>");
    }
    else
    {
        $.ajax({
            type: 'GET', 
            url: '/development/getMenu',
            dataType: 'json',
            success: function (resp) {
                var length = resp.length;
                $("#user_menu").empty();
                for(var i=0;i<length;i++) { $('#user_menu').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
            },
            error:function() {  console.log('error');}
        });

        $.ajax({
            type: 'GET', 
            url: '/user/getAccess',
            dataType: 'json',
            success: function (resp) {
                var length = resp.length;
                $("#user_access").empty();
                for(var i=0;i<length;i++) { $('#user_access').append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
            },
            error:function() {  console.log('error');}
        });
    }
}

function adduserDetailsNewRow()
{
    var user_dept= document.getElementById("user_dept");
    var user_dept_selected_index =  user_dept.selectedIndex;
    var user_dept_selected_index_innerHTML = user_dept[user_dept_selected_index].innerHTML;

    var user_menu= document.getElementById("user_menu");
    var user_menu_selected_index =  user_menu.selectedIndex;
    var user_menu_selected_index_innerHTML = user_menu[user_menu_selected_index].innerHTML;

    var user_access= document.getElementById("user_access");
    var user_access_selected_index =  user_access.selectedIndex;
    var user_access_selected_index_innerHTML = user_access[user_access_selected_index].innerHTML;

    // if(user_dept_selected_index_innerHTML=='Administartor' && user_menu_selected_index_innerHTML=='ALL' && user_access_selected_index_innerHTML=='ALL')
    // {
    //     //alert('Opps!! ..You cant add another access for this particular user..');

    //     swal({
    //         type: 'success',
    //         html: '<h3>Opps!! ..You cant add another access for Administartor.. Administartor user having all locally Access.</h3> <h4> For Another role, please change <b>Dept (Role)</b></h4>'
    //     }) 
    // }
    // else
    // {
        var table = document.getElementById("userDetails");
        var table_tr_count = table.children[1].children.length;

        var row = table.insertRow(table_tr_count+1);

        var cell_sn = row.insertCell(0);
        var cell_user_dept = row.insertCell(1);
        var cell_user_location = row.insertCell(2);
        var cell_user_menu = row.insertCell(3);
        var cell_user_access = row.insertCell(4);
        var cell_product_action = row.insertCell(5);

        cell_sn.innerHTML = "<span style='vertical-align:middle;font-weight: 600;'>"+(parseInt(table_tr_count)+1)+"</span>";

        var user_dept_id = "user_dept_"+table_tr_count;
        var user_location_id = "user_location_"+table_tr_count;
        var user_menu_id = "user_menu_"+table_tr_count;
        var user_access_id = "user_access_"+table_tr_count;

        cell_user_dept.innerHTML="<select name='user_dept[][dept]' class='form-control' id='"+user_dept_id+"')><option value='0'>Select Dept</option></select>";

        cell_user_location.innerHTML = "<select name='user_location[][location]' class='form-control' id='"+user_location_id+"'><option value='0'>Select Location</option></select>";

        cell_user_menu.innerHTML = "<select name='user_menu[][menu]' class='form-control' id='"+user_menu_id+"'><option value='0'>Select Menu</option></select>";

        cell_user_access.innerHTML = "<select name='user_access[][access]' class='form-control' id='"+user_access_id+"'><option value='0'>Select Access</option></select>";

        cell_product_action.innerHTML = "<span class='glyphicon glyphicon-remove' id='"+table_tr_count+"' onclick=ondeleteProductFromTable(this)></span>";

        populateInfo(table_tr_count);
   // }
}



function populateInfo(obj)
{

    $.ajax({
        type: 'GET', 
        // url: '/user/getRoleExceptAdmin',
        url: '/user/getRole',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_dept_"+obj).empty();
            for(var i=0;i<length;i++) { $('#user_dept_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
        },
        error:function() {  console.log('error');}
    });


    $.ajax({
        type: 'GET', 
        url: '/user/getLocation',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_location_"+obj).empty();
            for(var i=0;i<length;i++) { $('#user_location_'+obj).append("<option value="+resp[i].id+">"+resp[i].location+"</option>");}
        },
        error:function() {  console.log('error');}
    });

    $.ajax({
        type: 'GET', 
        url: '/development/getMenu',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_menu_"+obj).empty();
            for(var i=0;i<length;i++) { $('#user_menu_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
        },
        error:function() {  console.log('error');}
    });

    
    $.ajax({
        type: 'GET', 
        url: '/user/getAccess',
        dataType: 'json',
        success: function (resp) {
            var length = resp.length;
            $("#user_access_"+obj).empty();
            for(var i=0;i<length;i++) { $('#user_access_'+obj).append("<option value="+resp[i].id+">"+resp[i].name+"</option>");}
        },
        error:function() {  console.log('error');}
    });
}


function ondeleteProductFromTable(el){

    var id = parseInt(el.id) +1;
    var table = document.getElementById("userDetails");
    var table_tr_count = table.children[1].children.length;
    row_delete = table.deleteRow(id);
}