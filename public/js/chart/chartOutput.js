function onclickSearch()
{
	//console.log("btn clicked");
	var chartOutput = document.getElementById("chartOutput");
	chartOutput.style.display="block";
	chartOutput.innerHTML='';

	var fromDateDay = document.getElementById("fromDateDay").value;
	var fromDateMonth = document.getElementById("fromDateMonth").value;
	var fromDateYear = document.getElementById("fromDateYear").value;

	var toDateDay = document.getElementById("toDateDay").value;
	var toDateMonth = document.getElementById("toDateMonth").value;
	var toDateYear = document.getElementById("toDateYear").value;

	var type = document.getElementById("type").value;

	//console.log("fromDateDay-"+fromDateDay+"fromDateMonth-"+fromDateMonth+"fromDateYear-"+fromDateYear+"toDateDay-"+toDateDay+"toDateMonth-"+toDateMonth+"toDateYear-"+toDateYear+"type-"+type);

	/*SAMPLE Section modules start here*/
		if(type=='SAMPLE')
		{
			$.ajax({
	            type: 'GET',
	            url:  '/chart/sample',
	            dataType: 'json',
	            data : ({fromDateDay:fromDateDay,fromDateMonth:fromDateMonth,fromDateYear:fromDateYear,toDateDay:toDateDay,toDateMonth:toDateMonth,toDateYear:toDateYear}),
	            success: function (resp) 
	            {
	            	console.log(resp);

	            	var count = resp.count[0].total;
	            	//console.log("total Count-"+count);
	            	var lastIndex = count-1;
	            	//var sample_number = resp.output[0].sample_number;
	            	//console.log("sample_number is-"+sample_number);
	            	$('#chartOutput').append("<div style='font-size: 16px;font-weight: 600;'> Total :"+count+"</div>");
	            	if(count>0)
	            	{
	            		$('#chartOutput').append("<div style='margin-top: 1%;margin-bottom: 1%;font-size: medium;'> Sample Details</div>");

	            		for(var i=0;i<count;i++)
	            		{
	            			$('#chartOutput').append("<div style='margin:3px'> <b>"+(i+1)+"  )  Sample Number -</b>"+resp.output[i].sample_number+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Request By -</b>"+resp.output[i].request_by+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Request Date(yyyy-mm-dd) -</b>"+resp.output[i].created_at+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Delivery Date(yyyy-mm-dd) -</b>"+resp.output[i].delivered_date+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Status -</b>"+resp.output[i].type_status+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Latest Updated Date(yyyy-mm-dd) -</b>"+resp.output[i].updated_at+"</div>");
	            			$('#chartOutput').append("<div style='margin:10px 3px 10px 3px;color: green;'> <b>"+resp.output[i].type+" Details</b></div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Name -</b>"+resp.output[i].ref_name+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Address -</b>"+resp.output[i].ref_address+"</div>");
	            			$('#chartOutput').append("<div style='margin:3px'> <b>Contacts Details -</b>"+resp.output[i].ref_email+" ( "+resp.output[i].ref_mobile+" )</div>");

	            			if(i!=lastIndex)
	            			{
	            				$('#chartOutput').append("<div style='border-bottom: 1px solid #DDD;margin: 1%;'></div>");
	            			}
	            			
	            		}
	            	}
	            	
	            }
	        });
		}
	/*SAMPLE Section modules end here*/

	/*INQUIRY Section modules start here*/
		if(type=='INQUIRY')
		{
			$.ajax({
	            type: 'GET',
	            url:  '/chart/inquiry',
	            dataType: 'json',
	            data : ({fromDateDay:fromDateDay,fromDateMonth:fromDateMonth,fromDateYear:fromDateYear,toDateDay:toDateDay,toDateMonth:toDateMonth,toDateYear:toDateYear}),
	            success: function (resp) 
	            {
	            	console.log(resp);
	            	var count = resp.count[0].total;
	            	//console.log("total Count-"+count);
	            	var lastIndex = count-1;
	            	//var sample_number = resp.output[0].sample_number;
	            	//console.log("sample_number is-"+sample_number);
	            	$('#chartOutput').append("<div style='font-size: 16px;font-weight: 600;'> Total :"+count+"</div>");
	            	if(count>0)
	            	{
	            	}
	            }
	        })
		}
	/*INQUIRY Section modules end here*/

	/*DISPATCH Section modules start here*/
		if(type=='DISPATCH')
		{
			
		}
	/*DISPATCH Section modules end here*/

	/*WISH Section modules start here*/
		if(type=='WISH')
		{
			
		}
	/*WISH Section modules end here*/

	/*MRN Section modules start here*/
		if(type=='MRN')
		{
			
		}
	/*MRN Section modules end here*/

	/*BMR Section modules start here*/
		if(type=='BMR')
		{
			
		}
	/*BMR Section modules end here*/

	/*QC Section modules start here*/
		if(type=='QC')
		{
			
		}
	/*QC Section modules end here*/
}