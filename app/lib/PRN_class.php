<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class PRN_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->created_at =  date("Y/m/d");
    }  

    function showPRNList()
    {
        $out = DB::select("select id,purchase_request_no,required_date,created_at as request_date from purchase_request_note where is_verifed_from_purchase_dept is null");

        return json_decode(json_encode($out), true);
    }


    function verifyPRNCount()
    {
        $out = DB::select("select count(*) as total from purchase_request_note where is_verifed_from_purchase_dept is null");

        return json_decode(json_encode($out), true);
    }



    function getPRNCount()
    {
        $out = DB::select("select count(*) as total from purchase_request_note where is_verifed_from_purchase_dept is null");

        return json_decode(json_encode($out), true);
    }


    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function showPRNDeatilsByPrnId($prnID)
    {
        $out = DB::select("select * from purchase_request_note a,purchase_request_note_details b where a.id='$prnID' and a.id=b.purchase_entry_id and a.is_verifed_from_purchase_dept is null");

        return json_decode(json_encode($out), true);
    }

    function maxPurchaseRequestNoteID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_request_note");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function purchase_request_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_request_note where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-PRN-'.$date_1.$maxSampleNum;
    }


    function maxPurchaseRequestNoteDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_request_note_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function saveprn($prnrequiredDay,$prnrequiredMonth,$prnrequiredyear,$prn_remark,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$user_id)
    {
        $maxPurchaseRequestNoteID = $this->maxPurchaseRequestNoteID();

        $purchaseRequestNo = $this->purchase_request_no();

        $requiredDate =  $this->string_to_date($prnrequiredDay,$prnrequiredMonth,$prnrequiredyear);

        $status = 'PURCHASE_REQUIZATION_NOTE_CREATED';

        $out = DB::insert("insert into purchase_request_note (id,purchase_request_no,required_date,status,remarks,created_at,created_by) values('$maxPurchaseRequestNoteID','$purchaseRequestNo','$requiredDate','$status','$prn_remark','$this->created_at','$user_id')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $maxPurchaseRequestNoteDetailsId = $this->maxPurchaseRequestNoteDetailsId();

            $out = DB::insert("insert into purchase_request_note_details (id,purchase_entry_id,item_code,item_name,method,item_qty,item_uom) values('$maxPurchaseRequestNoteDetailsId','$maxPurchaseRequestNoteID','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }
    }

    function updateprn($prnid,$prnrequiredDay,$prnrequiredMonth,$prnrequiredyear,$prn_remark,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$user_id)
    {
        $requiredDate =  $this->string_to_date($prnrequiredDay,$prnrequiredMonth,$prnrequiredyear);

      //  dd($prnid);

        $out = DB::update("update purchase_request_note set required_date='$requiredDate',remarks='$prn_remark' where id='$prnid'");

        $out_1 = DB::delete("delete from purchase_request_note_details where purchase_entry_id='$prnid' ");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $maxPurchaseRequestNoteDetailsId = $this->maxPurchaseRequestNoteDetailsId();

            $out = DB::insert("insert into purchase_request_note_details (id,purchase_entry_id,item_code,item_name,method,item_qty,item_uom) values('$maxPurchaseRequestNoteDetailsId','$prnid','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }
    }

    function showPRNDeatils($prnID)
    {
        $out = DB::select("select a.*,b.*,c.name as product_name,c.scrientific_name as product_scrientific_name,d.name as method_name,e.name as item_uom from purchase_request_note a,purchase_request_note_details b,product_master c,product_method_master d,UOM_master e where a.id='$prnID' and a.id=b.purchase_entry_id and a.is_verifed_from_purchase_dept is null and b.item_code=c.code and b.method=d.id and b.item_uom = e.id");

        return json_decode(json_encode($out), true);
    }

    function verifyPRN($prnID,$user_id)
    {
        $out = DB::update("update purchase_request_note set is_verifed_from_purchase_dept='Y',update_by='$user_id',update_date='$this->created_at',status='PURCHASE_REQUIZATION_NOTE_VERIFIED' where id='$prnID'");

        return json_decode(json_encode($out), true);
    }

}