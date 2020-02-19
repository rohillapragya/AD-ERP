// $(document).ready(function(){
//     populateTable();
// });


function addNewRegion()
{
	//console.log("Hi.. Add new Region");
	swal({
        title: 'Enter New Region',
        input: 'text'
    }).then(function (region) {
    	if(region)
    	{
    		$.ajax({
	            type: 'POST', 
	            url: '/development/addNewRegion',
	            dataType: 'json',
	            data : ({region:region}),
	            beforeSend: function (request) {
	                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
	            },
	            success: function (resp) 
	            {
	                //console.log('success');
	                swal({
	                    type: 'success',
	                    html: 'Region Added'
	                })    
	            },

	            error:function()
	            { 
	                swal({
	                    type: 'success',
	                    html: 'Region Added'
	                }) 
	                updateRegion(); 
	            }
	        });
    	}
    })
}




function updateRegion()
{
    $.ajax({
        type: 'GET',
        url: '/development/getRegion',
        dataType: 'json',
       success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].length);
            $("#regionList").empty();
            for(var i=0;i<length;i++)
            {
           		$('#regionList').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].region+"</td> <td><span class='glyphicon glyphicon-pencil' style='color: #2f8dc9;cursor: pointer' onclick='onClickRegionEdit("+resp[i].id+")'></td>  <td><span class='glyphicon glyphicon-remove' style='color: #2f8dc9;cursor: pointer;' onclick='onClickRegionDelete("+resp[i].id+")'></span></td></tr>");

            }
        },
        error:function()
        { 
             console.log('error');
        }
    });

    populateTable();
}



function onClickRegionEdit(id)
{
	$('#regionList').find('tr').click( function(){
		//alert('You clicked row '+ ($(this).index()+1) );
		var tableRowNum = $(this).index();

		var tbody = document.getElementById("regionList");
		var tr = tbody.children[0];
		var inputValue  = tbody.children[tableRowNum].children[1].innerText;

			swal({
		        title: 'Update Region',
		        input: 'text',
		        inputValue: inputValue
		    }).then(function (region) {

		        $.ajax({
		            type: 'POST',
		            url: '/development/editRegion',
		            dataType: 'json',
		            data : ({id:id,region:region}),
		            beforeSend: function (request) {
		                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
		            },
		            success: function (resp) 
		            {
		               // console.log('success');
		                swal({
		                    type: 'success',
		                    html: 'Region Updated'
		                })    
		            },

		            error:function()
		            { 
		                // console.log('error');
		                swal({
		                    type: 'success',
		                    html: 'Region Updated'
		                }) 
		                updateRegion(); 
		            }
		        });
		    })
	});

}


function onClickChangeStatus(id,status)
{
   // console.log("ID is-"+id+"-status-"+status);

     $.ajax({
        type: 'POST',
        url: '/development/changeRegionStatus',
        dataType: 'json',
        data : ({id:id,status:status}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            location.reload(true/false);
        }
    });

     // populateTable();
}



// function populateTable()
// {
//     var table = document.getElementById('regionTable');
//     if(table)
//     {
//         var tbody = table.children[1];
//         var tbody_count = tbody.childElementCount;
//         for(i=0;i<tbody_count;i++)
//         {
//             var tr = tbody.children[i];
//             var edit_text = tr.children[3].innerText

//             if(edit_text=='Inactive')
//             {
//                 //console.log("Y-"+i);
//                 tr.children[3].innerText = "Active";
//             }
//             else
//             {
//                 tr.children[3].innerText = "Inactive";
//                 //console.log("N-"+i);
//                 tr.style.backgroundColor="rgb(255, 141, 0)";
//             }
//         }
//     }
   
// }


function onClickRegionDelete(id)
{
   // console.log("ID-"+id);

   $.ajax({
        type: 'POST',
        url: '/development/deleteRegion',
        dataType: 'json',
        data : ({id:id}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            location.reload(true/false);
        }
         
    });
}