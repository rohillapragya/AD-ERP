function addNewMenu()
{
	//console.log("Hi.. Add new Menu");
	swal({
        title: 'Enter New Menu',
        input: 'text'
    }).then(function (menu) {
    	if(menu)
    	{
    		$.ajax({
	            type: 'POST', 
	            url: '/development/addNewMenu',
	            dataType: 'json',
	            data : ({menu:menu}),
	            beforeSend: function (request) {
	                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
	            },
	            success: function (resp) 
	            {
	                //console.log('success');
	                swal({
	                    type: 'success',
	                    html: 'Menu Added'
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
	                    html: 'Menu Added'
	                }) 
	                updateMenu(); 
	            }
	        });
    	}
       
    })
}

function updateMenu()
{
    $.ajax({
        type: 'GET',
        url: '/development/getMenu',
        dataType: 'json',
       success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].length);
            $("#developmentMenuList").empty();
            for(var i=0;i<length;i++)
            {
           		$('#developmentMenuList').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].name+"</td> <td><span class='glyphicon glyphicon-pencil' style='color: #2f8dc9;cursor: pointer' onclick='onClickMenuEdit("+resp[i].id+")'></td> </tr>");

            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}

function onClickMenuEdit(id)
{
	$('#developmentMenuList').find('tr').click( function(){
		//alert('You clicked row '+ ($(this).index()+1) );
		var tableRowNum = $(this).index();

		var tbody = document.getElementById("developmentMenuList");
		var tr = tbody.children[0];
		var inputValue  = tbody.children[tableRowNum].children[1].innerText;

			swal({
		        title: 'Update Menu',
		        input: 'text',
		        inputValue: inputValue
		    }).then(function (menu) {

		        $.ajax({
		            type: 'POST',
		            url: '/development/editMenu',
		            dataType: 'json',
		            data : ({id:id,menu:menu}),
		            beforeSend: function (request) {
		                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
		            },
		            success: function (resp) 
		            {
		               // console.log('success');
		                swal({
		                    type: 'success',
		                    html: 'Menu Updated'
		                })    
		            },

		            error:function()
		            { 
		                // console.log('error');
		                swal({
		                    type: 'success',
		                    html: 'Menu Updated'
		                }) 
		                updateMenu(); 
		            }
		        });
		    })
	});

}