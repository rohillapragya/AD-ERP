<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class MRN_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->created_at =  date("Y/m/d");
    }  

    function showMRNList()
    {
        $out = DB::select("select id,material_request_no,required_date,created_at as request_date,object_type,object_id from material_request_note");

        return json_decode(json_encode($out), true);
    }

    function getPurposeList()
    {
        $out = DB::select("select * from material_request_purpose");

        return json_decode(json_encode($out), true);
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function maxMaterialRequestNoteID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from material_request_note");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function maxMaterialRequestNoteDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from material_request_note_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function material_request_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from material_request_note where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-MRN-'.$date_1.$maxSampleNum;
    }


    function saveMRN($mrn_request_type,$mrn_object_request_id,$mrnrequiredDay,$mrnrequiredMonth,$mrnrequiredyear,$mrn_purpose_type,$mrn_remark,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$user_id)
    {
        $maxMaterialRequestNoteID = $this->maxMaterialRequestNoteID();

        $materialRequestNo = $this->material_request_no();

        $requiredDate =  $this->string_to_date($mrnrequiredDay,$mrnrequiredMonth,$mrnrequiredyear);

        $status = 'Material-Requization-Note-CREATED';

        $out = DB::insert("insert into material_request_note (id,material_request_no,required_date,object_type,object_id,status,purpose_id,remarks,created_at,created_by) values('$maxMaterialRequestNoteID','$materialRequestNo','$requiredDate','$mrn_request_type','$mrn_object_request_id','$status','$mrn_purpose_type','$mrn_remark','$this->created_at','$user_id')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        foreach ($table_product_sample_qty as $key_qty => $value_qty) { $product_sample_qty[] = $value_qty['product_sample_qty']; }

        foreach ($table_product_sample_uom as $key_uom => $value_uom) { $product_sample_uom[] = $value_uom['product_sample_uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $product_sample_qty_sample = $product_sample_qty[$i];

            $product_sample_uom_sample = $product_sample_uom[$i];

            $maxMaterialRequestNoteDetailsId = $this->maxMaterialRequestNoteDetailsId();

            $out = DB::insert("insert into material_request_note_details (id,stock_entry_id,item_code,item_name,method,item_qty,item_uom,control_qty,control_uom) values('$maxMaterialRequestNoteDetailsId','$maxMaterialRequestNoteID','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_sample_qty_sample','$product_sample_uom_sample')");
        }
    }

    function checkMRNRequestId($objectId,$objectType)
    {
        if($objectType=="SAMPLE")
        {
            $out = DB::select("select * from sample_master where sample_number='$objectId'");
        }
        else if ($objectType=="INQUIRY")
        {
            $out = DB::select("select * from inquiry_master where id='$objectId'");
        }
        else
        {
            $out = DB::select("select * from purchase_indent where purchase_indent_id='$objectId'");
        }
        return json_decode(json_encode($out), true);
    }

    function maxMaterialRequestPurposeId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from material_request_purpose");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function addNewPurpose($purpose)
    {
        $maxMaterialRequestPurposeId = $this->maxMaterialRequestPurposeId();

        $out = DB::insert("insert into material_request_purpose (id,purpose) values('$maxMaterialRequestPurposeId','$purpose')");
    }

    function mrnStockEntry($mrnID)
    {
        $out = DB::select("select * from material_request_note a,material_request_note_details b where a.id='$mrnID' and a.id= b.stock_entry_id");

        return json_decode(json_encode($out), true);
    }

    function updateMRNStockEntry($mrnID)
    {
        $out = DB::update("update material_request_note set is_procced_for_stock_entry='Y' where id='$mrnID'");

        return json_decode(json_encode($out), true);
    }
}