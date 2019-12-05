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

    function addProductInCart($cart_id,$product_id,$product_qty,$user_id)
    {
        $out = DB::insert("insert into user_cart_detail(cart_id,product_id,quantity,is_product_active_in_cart,created_at,created_by,quantity_unit) values('$cart_id','$product_id','$product_qty','Y','$this->created_at','$user_id','8')");
    }

    function getCartCountByCartId($cart_id)
    {
        $out = DB::select("select count(*) as total from user_cart_detail where cart_id ='$cart_id' and is_product_active_in_cart='Y'");

        return json_decode(json_encode($out), true);
    }

    function gettingCartDetails($cart_id)
    {
        $out = DB::select("select *  from user_cart_detail a, product_master b where a.cart_id='$cart_id' and a.product_id = b.id and a.is_product_active_in_cart='Y' and b.active='Y'");

        return json_decode(json_encode($out), true);
    }

    function inactiveProductInCart($productID,$cart_id,$user_id)
    {
        DB::update("update user_cart_detail set is_product_active_in_cart='N',updated_by='$user_id',updated_at='$this->created_at' where cart_id='$cart_id' and product_id='$productID'");
    }

    function inquiry_number()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(seq_id), 0) + 1 as max_id from inquiry_master where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT'.$date_1.$maxSampleNum;
    }

    function maxInquiryNumberSeq()
    {
        $out = DB::select("select COALESCE(max(seq_id), 0) + 1 as max_id from inquiry_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveInquiry($cart_id,$user_id,$table_inquiry_product_id,$table_inquiry_qty,$table_inquiry_uom,$customerName,$billing_address_city_name,$billing_pin,$billing_address,$shipping_address_city_name,$shipping_pin,$shipping_address)
    {
        $inquiry_number = $this->inquiry_number();

        $seq_id = $this->maxInquiryNumberSeq();

        $out = DB::select("insert into inquiry_master(id,date,status,type,customer_id,created_at,seq_id) values('$inquiry_number','$this->created_at','PENDING','1','$customerName','$this->created_at','$seq_id')");

        $out = DB::update("update user_cart set inquiry_number='$inquiry_number',status='INQUIRY-RECEIVED',updated_at='$this->created_at' where id='$cart_id'");

        DB::delete("delete from user_cart_detail where cart_id='$cart_id' and is_product_active_in_cart='Y'");

        $countTable = count($table_inquiry_product_id);

        foreach ($table_inquiry_product_id as $key_product_id => $value_product_id) { $product_product_id[] = $value_product_id['product_id']; }

        foreach ($table_inquiry_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_inquiry_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_product_id_inquiry = $product_product_id[$i];

            $product_qty_inquiry = $product_qty[$i];

            $product_uom_inquiry = $product_uom[$i];

            $out = DB::insert("insert into user_cart_detail (cart_id,product_id,quantity,quantity_unit,is_product_active_in_cart,updated_by,updated_at) values('$cart_id','$product_product_id_inquiry','$product_qty_inquiry','$product_uom_inquiry','Y','$user_id','$this->created_at')");
        }

       $maxInquiryAddress_1 = $this->maxInquiryAddress();

       $out = DB::insert("insert into inquiry_address(id,inquiry_no,address_type,full_name,address,city,pin_code) values('$maxInquiryAddress_1','$inquiry_number','1','$customerName','$billing_address','$billing_address_city_name','$billing_pin')");

       $maxInquiryAddress_2 = $this->maxInquiryAddress();

       $out = DB::insert("insert into inquiry_address(id,inquiry_no,address_type,full_name,address,city,pin_code) values('$maxInquiryAddress_2','$inquiry_number','2','$customerName','$shipping_address','$shipping_address_city_name','$shipping_pin')");

       // create cart logic part here section start here
        $maxCartId = $this->maxCartId();

        DB::insert("insert into user_cart(id,user_id,status,created_at) values('$maxCartId','$user_id','PENDING','$this->created_at')");

        Session::put('cart_id',$maxCartId);
         // create cart logic part here section end here
    }

    function maxCartId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_cart");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxInquiryAddress()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from inquiry_address");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }
}