<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Inquiry_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showInquiryDetails($InuiryNo)
    {
        $out = DB::select("select * from inquiry_master a,user_cart b,user_cart_detail c,product_master d where a.id='$InuiryNo' and a.id = b.inquiry_number and b.id=c.cart_id and c.is_product_active_in_cart='Y' and c.product_id=d.id");

        return json_decode(json_encode($out), true);
    }
}
