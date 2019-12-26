<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class GRN_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->created_at =  date("Y/m/d");
    }  

    function showGRNList()
    {
        $out = DB::select("select * from goods_receipt_note;");

        return json_decode(json_encode($out), true);
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function maxGoodsReceiptNoteID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from goods_receipt_note");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function goods_receipt_note_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from goods_receipt_note where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-GRN-'.$date_1.$maxSampleNum;
    }

    function save($user_id,$prn_no,$grnRequestDay,$grnRequestMonth,$grnRequestYear,$grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear,$supplier,$bill_no,$lr_no,$dispatch_service,$delivery_location,$total_amount,$table_product_name,$table_product_method,$table_product_qty,$table_product_price,$table_product_uom)
    {
        $maxGoodsReceiptNoteID = $this->maxGoodsReceiptNoteID();
        $goodsReceiptNoteNo = $this->goods_receipt_note_no();
        $requestDate =  $this->string_to_date($grnRequestDay,$grnRequestMonth,$grnRequestYear);
        $deliveredDate =  $this->string_to_date($grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear);
        $status = ''; 
        $total_amount = 0;

        $out = DB::insert("insert into goods_receipt_note (id,grn_no,PRN_no,request_date,delivery_date,status,supplier,bill_no,transporter,LR_no,delivery_warehouse,created_at,created_by) values('$maxGoodsReceiptNoteID','$goodsReceiptNoteNo','$prn_no','$requestDate','$deliveredDate','$status','$supplier','$bill_no','$dispatch_service','$lr_no','$delivery_location','$this->created_at','$user_id')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_price as $key_price => $value_price) { $product_price[] = $value_price['price']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_grn = $product_code[$i];
     
            $product_method_grn = $product_method[$i];
        
            $product_qty_grn = $product_qty[$i];
         
            $product_uom_grn = $product_uom[$i];

            $product_price_grn = $product_price[$i];

            $total_amount = $total_amount + ($product_price_grn * $product_qty_grn);

            $maxGoodsReceiptNoteDetailsId = $this->maxGoodsReceiptNoteDetailsId();

            $out = DB::insert("insert into goods_receipt_note_details (id,grn_no,item_code,method,qty,price,uom) values('$maxGoodsReceiptNoteDetailsId','$maxGoodsReceiptNoteID','$product_code_grn','$product_method_grn','$product_qty_grn','$product_price_grn','$product_uom_grn')");
        }

        DB::update("update goods_receipt_note set net_amount='$total_amount' where id='$maxGoodsReceiptNoteID'");
    }

    function maxGoodsReceiptNoteDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from goods_receipt_note_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function update($user_id,$grn_number,$prn_no,$grnRequestDay,$grnRequestMonth,$grnRequestYear,$grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear,$supplier,$bill_no,$lr_no,$dispatch_service,$delivery_location,$total_amount,$table_product_name,$table_product_method,$table_product_qty,$table_product_price,$table_product_uom)
    {
        $requestDate =  $this->string_to_date($grnRequestDay,$grnRequestMonth,$grnRequestYear);
        $deliveredDate =  $this->string_to_date($grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear);
        $total_amount = 0;

        $out = DB::update("update goods_receipt_note set PRN_no='$prn_no',request_date='$requestDate',delivery_date='$deliveredDate',supplier='$supplier',bill_no='$bill_no',transporter='$dispatch_service',LR_no='$lr_no',delivery_warehouse='$delivery_location',updated_at='$this->created_at',updated_by='$user_id' where id='$grn_number'");

        DB::delete("delete from goods_receipt_note_details where grn_no='$grn_number'");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_price as $key_price => $value_price) { $product_price[] = $value_price['price']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_grn = $product_code[$i];
     
            $product_method_grn = $product_method[$i];
        
            $product_qty_grn = $product_qty[$i];
         
            $product_uom_grn = $product_uom[$i];

            $product_price_grn = $product_price[$i];

            $total_amount = $total_amount + ($product_price_grn * $product_qty_grn);

            $maxGoodsReceiptNoteDetailsId = $this->maxGoodsReceiptNoteDetailsId();

            $out = DB::insert("insert into goods_receipt_note_details (id,grn_no,item_code,method,qty,price,uom) values('$maxGoodsReceiptNoteDetailsId','$grn_number','$product_code_grn','$product_method_grn','$product_qty_grn','$product_price_grn','$product_uom_grn')");
        }

        DB::update("update goods_receipt_note set net_amount='$total_amount' where id='$grn_number'");
    }


    function getGRNDetails($grnID)
    {
        $out = DB::select("select a.id as grn_number,a.*,b.* from goods_receipt_note a,goods_receipt_note_details b where a.id='$grnID' and a.id=b.grn_no");

        return json_decode(json_encode($out), true);
    }

}