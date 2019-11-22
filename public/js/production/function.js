function validateObjectID(el)
{
    var object_id = el.id;
    var object = document.getElementById(object_id);
    var object_value = object.value;

    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/production/checkBOM',
        dataType: 'json',
        data : ({objectId:object_value}),
        success: function (resp) 
        {
            //console.log('success-'+resp);
            var length = resp.length;
            if(length <=0)
            {
                console.log("if length-"+length);
                // Swt alert
                 swal({
                    title: "Please Enter valid BOM",
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