$(document).ready(function()
{
    //console.log("js file inclued");
    var id = document.getElementById("piArranagemnetPossible");
    val = id.value;
   // console.log("val-"+val);
});   

function onkeyupRemarks()
{
    var max_char = 2000;

    var remarks = document.getElementById("pi_remark");

    var remarks_len = remarks.textLength;
   
    var remaining_len = max_char - remarks_len;

    var pi_remark_span = document.getElementById("pi_remark_span");

    pi_remark_span.innerText=remaining_len+" characters are remaining";
}

function validateAddress()
{
    var description = document.getElementById("pi_remark");
    var description_value = description.value;
    var description_string = description_value.replace(/[^a-zA-Z0-9]/g, ' ');
    description.value = description_string;
}

function arrangementPossible(el)
{
    var id = document.getElementById(el.id);
    val = id.value;
    //console.log("val-"+val);
    var isSampleRequest = document.getElementById("isSampleRequest");

    var pi_proceed_for_dispatch = document.getElementById("pi_proceed_for_dispatch");

    if(val=='Y'){
        isSampleRequest.style.display="block";
        pi_proceed_for_dispatch.style.display="block";
    }
    else {
        isSampleRequest.style.display="none";
        pi_proceed_for_dispatch.style.display="none";
    }
}

function CustomerRequestSample(el)
{
    var id = document.getElementById(el.id);
    val = id.value;

    var pi_proceed_for_dispatch = document.getElementById("pi_proceed_for_dispatch");

    if(val=='N'){
        pi_proceed_for_dispatch.style.display="block";
    }
    else {
        
        pi_proceed_for_dispatch.style.display="none";
    }
}