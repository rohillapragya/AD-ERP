function addNewLocation()
{
	//console.log("Hi.. Add new Location");
	swal({
        title: 'Enter New Location',
        input: 'text'
    }).then(function (location) {
    	if(location)
    	{
    		$.ajax({
	            type: 'POST', 
	            url: '/development/addNewLocation',
	            dataType: 'json',
	            data : ({location:location}),
	            beforeSend: function (request) {
	                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
	            },
	            success: function (resp) 
	            {
	                //console.log('success');
	                swal({
	                    type: 'success',
	                    html: 'Location Added'
	                })    
	            },

	            error:function()
	            { 
	                swal({
	                    type: 'success',
	                    html: 'Location Added'
	                }) 
	                updateLocation(); 
	            }
	        });
    	}
    })
}




function updateLocation()
{
    $.ajax({
        type: 'GET',
        url: '/development/getLocation',
        dataType: 'json',
       success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].length);
            $("#locationList").empty();
            for(var i=0;i<length;i++)
            {
           		$('#locationList').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].location+"</td> <td><span class='glyphicon glyphicon-pencil' style='color: #2f8dc9;cursor: pointer' onclick='onClickLocationEdit("+resp[i].id+")'></td> <td><span class='glyphicon glyphicon-remove' style='color: #2f8dc9;cursor: pointer;' onclick='onClickLocationDelete("+resp[i].id+")'></span></td></tr>");

            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}

function onClickLocationEdit(id)
{
	$('#locationList').find('tr').click( function(){
		//alert('You clicked row '+ ($(this).index()+1) );
		var tableRowNum = $(this).index();

		var tbody = document.getElementById("locationList");
		var tr = tbody.children[0];
		var inputValue  = tbody.children[tableRowNum].children[1].innerText;

			swal({
		        title: 'Update Location',
		        input: 'text',
		        inputValue: inputValue
		    }).then(function (location) {

		        $.ajax({
		            type: 'POST',
		            url: '/development/editLocation',
		            dataType: 'json',
		            data : ({id:id,location:location}),
		            beforeSend: function (request) {
		                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
		            },
		            success: function (resp) 
		            {
		               // console.log('success');
		                swal({
		                    type: 'success',
		                    html: 'Location Updated'
		                })    
		            },

		            error:function()
		            { 
		                // console.log('error');
		                swal({
		                    type: 'success',
		                    html: 'Location Updated'
		                }) 
		                updateLocation(); 
		            }
		        });
		    })
	});

}


function onClickLocationDelete(id)
{
	$.ajax({
        type: 'POST',
        url: '/development/deleteLocation',
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