function validateObjectID(el)
{
   // console.log(el.id);
    var object_id = el.id;
    var object = document.getElementById(object_id);
    var object_value = object.value;
   // console.log("value is-"+object_value);

   var object_type = document.getElementById("mrn_request_type");
   var object_type_value = object_type.value;

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/mrn/checkMRNRequestId',
        dataType: 'json',
        data : ({objectId:object_value,objectType:object_type_value}),
        success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            if(length <=0)
            {
                console.log("if length-"+length);
                // Swt alert
                 swal({
                    title: "Please Enter valid ID",
                    text:  "This will not works",
                    type: "error",
                    timer: 2500,
                    showConfirmButton: false,
                    icon: "error",
                    dangerMode: true,
                });

                object.value='';
            }
            
        },
        error:function()
        { 
             console.log('error');
        }
    });

}