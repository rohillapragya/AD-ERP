<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class BOM_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showBOMList()
    {

        $out = DB::select("select id,BOM_no,qty,BOM_key_person,remarks,created_at,status from BOM where status='BOM_CREATED' order by id desc");

        return json_decode(json_encode($out), true);
    }

    function getBOMCount()
    {

        $out = DB::select("select count(*) as total from BOM where status='BOM_CREATED' order by id desc");

        return json_decode(json_encode($out), true);
    }

    function maxBomID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from BOM");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function bill_of_material_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from BOM where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-BOM-'.$date_1.$maxSampleNum;
    }

    function maxBillOfMaterialDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from BOM_items_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function save($user_id,$bom_key_person,$bom_remark,$bom_name,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom)
    {
        $maxBomID = $this->maxBomID();

        $bill_of_material_no = $this->bill_of_material_no();

        $status = 'BOM_CREATED';

        $qty = 0;

        $out = DB::insert("insert into BOM (id,BOM_no,bom_name,qty,BOM_key_person,remarks,status,created_at,created_by) values('$maxBomID','$bill_of_material_no','$bom_name','$qty','$bom_key_person','$bom_remark','$status','$this->created_at','$user_id')");

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

            $qty= $qty+$product_qty_sample;

            $maxBillOfMaterialDetailsId = $this->maxBillOfMaterialDetailsId();

            $out = DB::insert("insert into BOM_items_details (id,BOM_id,item_code,item_name,method,qty,uom) values('$maxBillOfMaterialDetailsId','$maxBomID','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }

        $out = DB::update("update BOM set qty='$qty' where id='$maxBomID'");

    }

    function showBOMdetails($bomID)
    {
        $out = DB::select("select * from BOM a,BOM_items_details b where a.id='$bomID' and a.id=b.BOM_id");

        return json_decode(json_encode($out), true);
    }

    function edit($user_id,$bomId,$bom_key_person,$bom_remark,$bom_name,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom)
    {
        $out = DB::update("update BOM set bom_name='$bom_name',BOM_key_person='$bom_key_person',remarks='$bom_remark' where id='$bomId'");

        $Out = DB::delete("delete from BOM_items_details where BOM_id='$bomId'");

        $qty = 0;

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

            $qty= $qty+$product_qty_sample;

            $maxBillOfMaterialDetailsId = $this->maxBillOfMaterialDetailsId();

            $out = DB::insert("insert into BOM_items_details (id,BOM_id,item_code,item_name,method,qty,uom) values('$maxBillOfMaterialDetailsId','$bomId','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }

        $out = DB::update("update BOM set qty='$qty' where id='$bomId'");
    }

    function checkBom($BOMId)
    {
        $out = DB::select("select * from BOM where BOM_no='$BOMId'");

        return json_decode(json_encode($out), true);
    }

}
