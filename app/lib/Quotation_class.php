<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Quotation_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function verifyPRNList()
    {
       // $out = DB::select("select * from purchase_request_note where is_verifed_from_purchase_dept='Y'");

        $out = DB::select("select * from purchase_request_note where is_verifed_from_purchase_dept='Y' and status ='PURCHASE_REQUIZATION_NOTE_VERIFIED'");

        return json_decode(json_encode($out), true);
    }

    function gettingVerifyPRNDetails($pID)
    {
        $out = DB::select("select * from purchase_request_note_details where purchase_entry_id ='$pID'");

       // $out = DB::select("select * from purchase_request_note a,purchase_request_note_details b where a.id ='$pID' and a.id=b.purchase_entry_id");

        return json_decode(json_encode($out), true);
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

     function maxQuotationRequestNoteID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function quotation_request_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_master where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-QUOTATION-'.$date_1.$maxSampleNum;
    }


    function maxQuotationDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_items_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function save($user_id,$quotationRequestDay,$quotationRequestMonth,$quotationRequestYear,$quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear,$quotation_remark,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$prn_no)
    {
        $maxQuotationRequestNoteID = $this->maxQuotationRequestNoteID();
        $quotationRequestNo = $this->quotation_request_no();
        $requestDate =  $this->string_to_date($quotationRequestDay,$quotationRequestMonth,$quotationRequestYear);
        $deliveryDate =  $this->string_to_date($quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear);
        $status = 'PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED';

        $out = DB::insert("insert into quotation_request_master (id,quotation_no,PRN_no,request_date,delivery_date,status,other_info,created_at,created_by) values('$maxQuotationRequestNoteID','$quotationRequestNo','$prn_no','$requestDate','$deliveryDate','$status','$quotation_remark','$this->created_at','$user_id')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_quotation = $product_code[$i];
     
            $product_method_quotation = $product_method[$i];
        
            $product_qty_quotation = $product_qty[$i];
         
            $product_uom_quotation = $product_uom[$i];

            $maxQuotationDetailsId = $this->maxQuotationDetailsId();

            $out = DB::insert("insert into quotation_request_items_details (id,quotation_request_id,item_code,method,qty,UOM,created_by) values('$maxQuotationDetailsId','$maxQuotationRequestNoteID','$product_code_quotation','$product_method_quotation','$product_qty_quotation','$product_uom_quotation','$user_id')");
        }

        $o = DB::update("update purchase_request_note set status='$status' where id='$prn_no'");
    }

}