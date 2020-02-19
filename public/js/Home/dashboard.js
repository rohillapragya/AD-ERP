$(document).ready(function(){

    /*Customer Inquiry get Count section start*/
	$.ajax({
        type: 'GET', //THIS NEEDS TO BE GET
	    url:  '/inquiry/getCartCount',
	    dataType: 'json',
	    success: function (resp) 
	    {
        	//location.reload(true/false);
        	var cart_count = resp[0].total;
        	var userCartCount = document.getElementById("userCartCount");
            if(userCartCount)
            {
                userCartCount.innerText=cart_count;
            }
        }
    });
    /*Customer Inquiry get Count section end*/   

    /*Customer Sample Request count section start*/
        $.ajax({
            type: 'GET',
            url:  '/sample/getCustomerCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;

                var customerSampleCount = document.getElementById("customerSampleCount");

                if(customerSampleCount)
                {
                    if(count >0)
                    {
                        customerSampleCount.innerText=count;
                        customerSampleCount.style.backgroundColor='#ff0000';
                        customerSampleCount.style.color = 'white';
                    }
                    else
                    {
                        customerSampleCount.innerText=count;
                    }
                }
            }
        });
    /*Customer Sample Request count section end*/


    /*Vendor Sample Request count section start*/
        $.ajax({
            type: 'GET',
            url:  '/sample/getVendorCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var vendorSampleCount = document.getElementById("vendorSampleCount");

                if(vendorSampleCount)
                {
                    if(count >0)
                    {
                        vendorSampleCount.innerText=count;
                        vendorSampleCount.style.backgroundColor='#ff0000';
                        vendorSampleCount.style.color = 'white';
                    }
                    else
                    {
                        vendorSampleCount.innerText=count;
                    }
                }
                
            }
        });
    /*Vendor Sample Request count section end*/


    /*Vendor Sample Request count section start*/
        $.ajax({
            type: 'GET',
            url:  '/dispatch/getdispatchCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var dispatchInfoCount = document.getElementById("dispatchInfoCount");

                if(dispatchInfoCount)
                {
                    if(count >0)
                    {
                        dispatchInfoCount.innerText=count;
                        dispatchInfoCount.style.backgroundColor='#ff0000';
                        dispatchInfoCount.style.style.color = 'white';
                    }
                    else
                    {
                        dispatchInfoCount.innerText=count;
                    }
                }
               
            }
        });
    /*Vendor Sample Request count section end*/


    /*wish count section start*/
        $.ajax({
            type: 'GET',
            url:  '/wish/getWishCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var wishCount = document.getElementById("wishCount");

                if(wishCount)
                {
                    if(count >0)
                    {
                        wishCount.innerText=count;
                        wishCount.style.backgroundColor='#ff0000';
                        wishCount.style.color = 'white';
                    }
                    else
                    {
                        wishCount.innerText=count;
                    } 
                }
                
            }
        });
    /*wish count section end*


    //*product price is not or valid till is less than count section start*/
        $.ajax({
            type: 'GET',
            url:  '/product/getpriceRangeCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var priceRangeCount = document.getElementById("productPriceRangeCount");

                if(priceRangeCount)
                {
                    if(count >0)
                    {
                        priceRangeCount.innerText=count;
                        priceRangeCount.style.backgroundColor='#ff0000';
                        priceRangeCount.style.color = 'white';
                    }
                    else
                    {
                        priceRangeCount.innerText=count;
                    } 
                }
                
            }
        });
    /*product price is not or valid till is less than count section end*/




    /*Stock Entry count section start*/
        $.ajax({
            type: 'GET',
            url:  '/stock/getStockEntryCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var stockEntryCount = document.getElementById("stockEntryCount");

                if(stockEntryCount)
                {
                    if(count >0)
                    {
                        stockEntryCount.innerText=count;
                        stockEntryCount.style.backgroundColor='#ff0000';
                        stockEntryCount.style.color = 'white';
                    }
                    else
                    {
                        stockEntryCount.innerText=count;
                    }
                }
                
            }
        });
    /*Stock Entry count section end*/

    /*MRN count section start*/
        $.ajax({
            type: 'GET',
            url:  '/mrn/mrnCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var mrnCount = document.getElementById("mrnCount");

                if(mrnCount)
                {
                    if(count >0)
                    {
                        mrnCount.innerText=count;
                        mrnCount.style.backgroundColor='#ff0000';
                        mrnCount.style.color = 'white';
                    }
                    else
                    {
                        mrnCount.innerText=count;
                    }
                }
               
            }
        });
    /*MRN count section end*/


    /*PRN count section start*/
        $.ajax({
            type: 'GET',
            url:  '/prn/getPRNCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var prnCount = document.getElementById("prnCount");

                if(prnCount)
                {
                    if(count >0)
                    {
                        prnCount.innerText=count;
                        prnCount.style.backgroundColor='#ff0000';
                        prnCount.style.color = 'white';
                    }
                    else
                    {
                        prnCount.innerText=count;
                    }
                }
                
            }
        });
    /*PRN count section end*/ 

    /*verify PRN count section start*/
        $.ajax({
            type: 'GET',
            url:  '/prn/verifyPRNCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var verifyPRNCount = document.getElementById("verifyPRNCount");

                if(verifyPRNCount)
                {
                    if(count >0)
                    {
                        verifyPRNCount.innerText=count;
                        verifyPRNCount.style.backgroundColor='#ff0000';
                        verifyPRNCount.style.color = 'white';
                    }
                    else
                    {
                        verifyPRNCount.innerText=count;
                    }
                }
                
            }
        });
    /*verify PRN count section end*/


    /*Purchase Indent count section start*/
        $.ajax({
            type: 'GET',
            url:  '/pi/getPICount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var purchaseIndentCount = document.getElementById("purchaseIndentCount");

                if(purchaseIndentCount)
                {
                    if(count >0)
                    {
                        purchaseIndentCount.innerText=count;
                        purchaseIndentCount.style.backgroundColor='#ff0000';
                        purchaseIndentCount.style.color = 'white';
                    }
                    else
                    {
                        purchaseIndentCount.innerText=count;
                    }
                }
               
            }
        });
    /*Purchase Indent count section end*/

    /*Bill of Material count section start*/
        $.ajax({
            type: 'GET',
            url:  '/production/getBOMCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var bomCount = document.getElementById("bomCount");

                if(bomCount)
                {
                    if(count >0)
                    {
                        bomCount.innerText=count;
                        bomCount.style.backgroundColor='#ff0000';
                        bomCount.style.color = 'white';
                    }
                    else
                    {
                        bomCount.innerText=count;
                    }
                }
                
            }
        });
    /*Bill of Material count section end*/


    /*Batch Manufacturing number count section start*/
        $.ajax({
            type: 'GET',
            url:  '/production/getBMRCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var bmrNumberCount = document.getElementById("bmrNumberCount");

                if(bmrNumberCount)
                {
                     if(count >0)
                    {
                        bmrNumberCount.innerText=count;
                        bmrNumberCount.style.backgroundColor='#ff0000';
                        bmrNumberCount.style.color = 'white';
                    }
                    else
                    {
                        bmrNumberCount.innerText=count;
                    }
                }
               
            }
        });
    /*Batch Manufacturing number count section end*/

    /*QC details count section start*/
        $.ajax({
            type: 'GET',
            url:  '/qc/getQCDetailsCount',
            dataType: 'json',
            success: function (resp) 
            {
                //location.reload(true/false);
                var count = resp[0].total;
                var qcDetails = document.getElementById("qcDetails");

                if(qcDetails)
                {
                    if(count >0)
                    {
                        qcDetails.innerText=count;
                        qcDetails.style.backgroundColor='#ff0000';
                        qcDetails.style.color = 'white';
                    }
                    else
                    {
                        qcDetails.innerText=count;
                    }
                }
                
            }
        });
    /*QC details count section end*/



});