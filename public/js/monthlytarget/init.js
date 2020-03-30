function onClickSeachMonthlyTarget()
{
    var se_value = document.getElementById("salesExecutive").value;
   
    var session_value = document.getElementById("sessionList").value;
  
    var fromDay_value = document.getElementById("fromDay").value;

    var fromMonth_value = document.getElementById("fromMonth").value;

    var fromYear_value = document.getElementById("fromYear").value;

    var toDay_value = document.getElementById("toDay").value;

    var toMonth_value = document.getElementById("toMonth").value;

    var toYear_value = document.getElementById("toYear").value;
   
    // console.log("se_value ="+se_value+"-session_value ="+session_value+"-fromDay_value ="+fromDay_value+"-fromMonth_value ="+fromMonth_value+"-fromYear_value ="+fromYear_value+"-toDay_value ="+toDay_value+"-toMonth_value ="+toMonth_value+"-toYear_value ="+toYear_value);

    $.ajax({
        type: 'GET',
        url: '/monthlyTarget/getReport',
        dataType: 'json',
        data : ({se_value:se_value,session_value:session_value,fromDay_value:fromDay_value,fromMonth_value:fromMonth_value,fromYear_value:fromYear_value,toDay_value:toDay_value,toMonth_value:toMonth_value,toYear_value:toYear_value}),
        success: function (resp) 
        {
          //  console.log('success-'+resp);
            
            var length = resp.length;

            console.log("length -"+length);

            console.log(resp[0]);
            var table = document.getElementById("monthlytargeTable")
            table.style.display="block";

            $("#monthlytargeTbody").empty();
            
            if(length >0)
            {
                for(var i=0;i<length;i++)
                {
                    $('#monthlytargeTbody').append("<tr><td>"+(i+1)+"</td> <td>"+resp[i].first_name+' '+resp[i].last_name+"</td> <td style='    text-align: right'> &#8377; "+resp[i].monthly_target+"</td><td>"+resp[i].remarks+"</td> <td>"+resp[i].session+"</td> <td>"+resp[i].target_date+"</td> <td style='    text-align: right'> &#8377; "+resp[i].target_amt+"</td></tr>");
                }
            }
            else
            {
                $('#monthlytargeTbody').append("<tr rowspan='6' class='no-data-found'> No Records found </tr>");

            }

        },
        error:function()
        { 
            console.log('error');
        }
    });

}
