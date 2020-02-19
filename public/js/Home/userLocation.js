$(document).ready(function(){

	$.ajax({
      type: 'GET',
	    url:  '/dashboard/userLocation',
	    dataType: 'json',
	    success: function (resp) 
	    {
        	//console.log('success-'+resp);

            var length = resp.userEmailRegisteredLocation.length;

           // var session_location_id = $('session_location_id').val();

            var session_location_id = document.getElementById("session_location_id").innerText;

           // console.log('session_location_id-'+session_location_id);
       
            
             
            // $('#userLocationMaster').append("<option value='0' disabled>Select your Location</option>");

            if(length > 0)
            {
               // console.log("in if");

                $("#userLocationMaster").empty();

                for(var i=0;i<length;i++)
                {
                  // console.log("name-"+name);
                  var location_id= resp.userEmailRegisteredLocation[i].location_id;

                  var location_name = resp.userEmailRegisteredLocation[i].location_name;

                  if(location_id==session_location_id)
                  {
                        $('#userLocationMaster').append("<option selected='selected' value="+location_id+">"+location_name+"</option>");
                  }
                  else
                  {
                        $('#userLocationMaster').append("<option value="+location_id+">"+location_name+"</option>");
                  }

                  // $('#userLocationMaster').append("<option value="+location_id+">"+location_name+"</option>");
                }
            }
            else
            {
               // console.log("in else");
                errormessage();
            }
        },
        error: function(){

                errormessage();
        }
    });
});

function errormessage()
{
  var userLocationErrorMessage = document.getElementById("userLocationErrorMessage");
  userLocationErrorMessage.style.display="block";
  userLocationErrorMessage.innerHTML="";
  userLocationErrorMessage.innerHTML="Hi ERP User, You have no working location. You are not able to operate anything. Please contact to your Administractor for setup your location.";
}