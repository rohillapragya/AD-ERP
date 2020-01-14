function addNewURL()
{
	//console.log("Hi.. Add new URL");
	swal({
        title: 'Enter New URL',
        input: 'text'
    }).then(function (url) {
    	if(url)
    	{
    		$.ajax({
	            type: 'POST', //THIS NEEDS TO BE GET
	            url: '/development/addNewURL',
	            dataType: 'json',
	            data : ({url:url}),
	            beforeSend: function (request) {
	                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
	            },
	            success: function (resp) 
	            {
	                //console.log('success');
	                swal({
	                    type: 'success',
	                    html: 'URL Added'
	                })    
	            },

	            error:function()
	            { 
	                //console.log('error');
	                // swal({
	                //     type: 'warning',
	                //     html: 'Not Added'
	                // })
	                swal({
	                    type: 'success',
	                    html: 'URL Added'
	                }) 
	                updateURL(); 
	            }
	        });
    	}
       
    })
}

function updateURL()
{
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/development/getURL',
        dataType: 'json',
       success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].length);
            $("#developmentRouteList").empty();
            for(var i=0;i<length;i++)
            {
            //    console.log("name-"+name);
           		// $('#developmentRouteList').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].url+"</td> <td><a href='/development/url/edit/"+resp[i].id+"'><span class='glyphicon glyphicon-pencil'></td> </tr>");

           		$('#developmentRouteList').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].url+"</td> <td><span class='glyphicon glyphicon-pencil' style='color: #2f8dc9;cursor: pointer' onclick='onClickRouteEdit("+resp[i].id+")'></td> </tr>");

            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}

function onClickRouteEdit(id)
{
	// console.log("Route Clicked");
	// console.log("ID-"+id);

	$('#developmentRouteList').find('tr').click( function(){
		//alert('You clicked row '+ ($(this).index()+1) );
		var tableRowNum = $(this).index();

		var tbody = document.getElementById("developmentRouteList");
		var tr = tbody.children[0];
		var inputValue  = tbody.children[tableRowNum].children[1].innerText;

			swal({
		        title: 'Update URL',
		        input: 'text',
		        inputValue: inputValue
		    }).then(function (url) {

		        $.ajax({
		            type: 'POST',
		            url: '/development/editURL',
		            dataType: 'json',
		            data : ({id:id,url:url}),
		            beforeSend: function (request) {
		                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
		            },
		            success: function (resp) 
		            {
		               // console.log('success');
		                swal({
		                    type: 'success',
		                    html: 'URL Updated'
		                })    
		            },

		            error:function()
		            { 
		                // console.log('error');
		                swal({
		                    type: 'success',
		                    html: 'URL Updated'
		                }) 
		                updateURL(); 
		            }
		        });
		    })
	});

}