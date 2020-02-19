$(document).ready(function(){
	populateTable();
});

function populateTable()
{
	var table = document.getElementById('erpUserTableList');
	var tbody = table.children[1];
	var tbody_count = tbody.childElementCount;
	for(i=0;i<tbody_count;i++)
	{
		var	tr = tbody.children[i];

		var edit_text = tr.children[4].innerText
        //console.log(tr.children[4]);

		if(edit_text=='Y')
		{
			//console.log("edit_text-"+edit_text);
            //console.log("Y-"+i);
			tr.children[4].innerText = "Active";
		}
		else
		{
          //  console.log("edit_text-"+edit_text);
			tr.children[4].innerText = "Inactive";
			//console.log("N-"+i);
			tr.style.backgroundColor="rgb(255, 141, 0)";
		}
	}
}


function onClickChangeStatus(id,status)
{
	console.log("ID is-"+id+"-status-"+status);

	 $.ajax({
        type: 'POST', //THIS NEEDS TO BE GET
        url: '/erpUser/changeStatus',
        dataType: 'json',
        data : ({id:id,status:status}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            location.reload(true/false);
            
            // var length = resp.length;

            // $("#erpUserTableTbody").empty();
            // var email='';
            // var mobile='';
            // var edit = '';
            // var changeStatus = '';

            // for(var i=0;i<length;i++)
            // {
            //     if(resp[i].offical_email=='null') { email = resp[i].offical_email; }
            //     else { email = resp[i].personal_email; }

            //     if(resp[i].offical_mobile=='null') { mobile = resp[i].offical_mobile;  }
            //     else {  mobile = resp[i].personal_mobile; }

            //     if(resp[i].is_active=='Y') { edit="<a href=/erpuser/edit/"+resp[i].id+"><span class='glyphicon glyphicon-pencil'></span></a>"; }

            //     if(resp[i].is_active=='Y') { changeStatus="<button type='button' onclick='onClickChangeStatus('"+resp[i].id+",'N') class='btn btn-primary btn-sm'>Inactive</button>";
            //     }

            //     else { changeStatus="<button type='button' onclick='onClickChangeStatus('"+resp[i].id+",'Y') style='width: 64px' class='btn btn-primary btn-sm'>Active</button>";
            //     }

            //     $('#erpUserTableTbody').append("<tr><td>"+(i+1)+"</td><td>"+resp[i].first_name+resp[i].last_name+"</td><td>"+email+"</td><td>"+mobile+"</td><td>"+resp[i].role_name+"</td><td>"+resp[i].is_active+"</td> <td>"+edit+"</td> <td>"+changeStatus+"</td></tr>");
            // }
        }
    });
}