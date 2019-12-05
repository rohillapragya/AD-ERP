$(document).ready(function(){
    populateTable();
});

function populateTable()
{
    var table = document.getElementById('productCategoryTable');
    var tbody = table.children[1];
    var tbody_count = tbody.childElementCount;
    for(i=0;i<tbody_count;i++)
    {
        var tr = tbody.children[i];
        var edit_text = tr.children[2].innerText

        if(edit_text=='Y')
        {
            //console.log("Y-"+i);
            tr.children[2].innerText = "Active";
        }
        else
        {
            tr.children[2].innerText = "Inactive";
            //console.log("N-"+i);
            tr.style.backgroundColor="rgb(255, 141, 0)";
        }
    }
}

function onClickChangeStatus(id,status)
{
    console.log("ID is-"+id+"-status-"+status);

     $.ajax({
        type: 'POST', //THIS NEEDS TO BE GET
        url: '/product/category/changeStatus',
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
}