function onclickAddRoute(id,name)
{
	// console.log("ID-"+id);

	// console.log("Name-"+name);
	var urlList = document.getElementById("urlList");
	urlList.innerHTML = name;


	var menu_id = id.split("_");
	//console.log("after split id is -"+menu_id[1]);
	document.getElementById("menuList").innerHTML = menu_id[1];

	document.getElementById("showMenu").showModal(); 

	// for closing modal will close method
	// document.getElementById("showMenu").close();  
}


function onClickDialogClose()
{
	location.reload();
	document.getElementById("showMenu").close();  
}



function onClickRemoveMenuURLMapping(id)
{
	var menu_url_id = id;
	var menu_url_id_str = menu_url_id.split("_");

	var menu_id = menu_url_id_str[0];
	var url_id = menu_url_id_str[1];

	$.ajax({
        type: 'POST',
        url: '/development/removeMenuUrlMap',
        dataType: 'json',
        data : ({menu_id:menu_id,url_id:url_id}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            swal({
                type: 'success',
                html: 'URL Removed'
            })
        },

        error:function()
        { 
            swal({
                type: 'success',
                html: 'URL Removed'
            }) 
        }
       
    });

     location.reload();
}



function onClickAddURL_MENU(id)
{
	var url_id = id;

	var menuList = document.getElementById("menuList");
	var menu_id = menuList.innerHTML;

	var url_id_element = document.getElementById(url_id);

	console.log("menu_id -"+menu_id+": url_id -"+url_id);
	$.ajax({
        type: 'POST',
        url: '/development/addMenuUrlMap',
        dataType: 'json',
        data : ({menu_id:menu_id,url_id:url_id}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            swal({
                type: 'success',
                html: 'URL Added'
            })
            url_id_element.innerText="Added";    
        },

        error:function()
        { 
            swal({
                type: 'success',
                html: 'URL Added'
            }) 
         	url_id_element.innerText="Added";
        }
    });
}
















function addNewURL()
{
	//console.log("Hi.. Add new URL");
	swal({
        title: 'Enter New URL',
        input: 'text',
        html:true,
    }).then(function (url) {
    	if(url)
    	{
    		$.ajax({
	            type: 'POST',
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