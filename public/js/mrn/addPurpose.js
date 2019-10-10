function onClickAddNewPurpose()
{
    swal({
        title: 'Enter New Purpose',
        input: 'text'
    }).then(function (purpose) {

        $.ajax({
            type: 'POST', //THIS NEEDS TO BE GET
            url: '/mrn/addNewPurpose',
            dataType: 'json',
            data : ({purpose:purpose}),
            beforeSend: function (request) {
                return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
            },
            success: function (resp) 
            {
                console.log('success');
                swal({
                    type: 'success',
                    html: 'Purpose Added'
                })
                
            },
            error:function()
            { 
                 swal({
                    type: 'success',
                    html: 'Purpose Added'
                })
                 updatepurpose(); 
            }
        });

       
    })
}

function updatepurpose()
{
    $.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
        url: '/mrn/getPurposeList',
        dataType: 'json',
       success: function (resp) 
        {
            console.log('success-'+resp);
            var length = resp.length;
            //console.log(resp[0].name);
            $("#mrn_purpose_type").empty();
            for(var i=0;i<length;i++)
            {
              // console.log("name-"+name);
               $('#mrn_purpose_type').append("<option value="+resp[i].id+">"+resp[i].purpose+"</option>");
            }
        },
        error:function()
        { 
             console.log('error');
        }
    });
}