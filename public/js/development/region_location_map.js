function onclickAddRegion_Location(id,name)
{
	// console.log("ID-"+id);

	// console.log("Name-"+name);
	var locationList = document.getElementById("locationList");
	locationList.innerHTML = name;


	var menu_id = id.split("_");
	//console.log("after split id is -"+menu_id[1]);
	document.getElementById("regionList").innerHTML = menu_id[1];

	document.getElementById("showRegion").showModal(); 
}


function onClickDialogClose()
{
	location.reload();
	document.getElementById("showRegion").close();  
}



function onClickRemoveRegionLocationMapping(id)
{
	var region_location_id = id;
	var region_location_id_str = region_location_id.split("_");

	var region_id = region_location_id_str[0];
	var location_id = region_location_id_str[1];

	console.log("region_id -"+region_id+": location_id -"+location_id);

	$.ajax({
        type: 'POST',
        url: '/development/removeRegionLocationMap',
        dataType: 'json',
        data : ({region_id:region_id,location_id:location_id}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
			console.log("resp-"+resp);
            swal({
                type: 'success',
                html: 'Location Removed'
            })
        },

        error:function()
        { 
        	console.log("resp-"+resp);
            swal({
                type: 'success',
                html: 'Location Removed'
            }) 
        }
       
    });

    location.reload();
}



function onClickAddRegion_Location(id)
{
	var location_id = id;

	var regionList = document.getElementById("regionList");
	var region_id = regionList.innerHTML;

	var location_id_element = document.getElementById(location_id);

	console.log("region_id -"+region_id+": location_id -"+location_id);

	$.ajax({
        type: 'POST',
        url: '/development/addRegionLocationMap',
        dataType: 'json',
        data : ({region_id:region_id,location_id:location_id}),
        beforeSend: function (request) {
            return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
        },
        success: function (resp) 
        {
            swal({
                type: 'success',
                html: 'Location Added'
            })
            location_id_element.innerText="Added";    
        },

        error:function()
        { 
            swal({
                type: 'success',
                html: 'Location Added'
            }) 
         	location_id_element.innerText="Added";
        }
    });
}