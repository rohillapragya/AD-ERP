<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Production_class 
{
    var $id;
	var $info;
    var $session;
    var $sample_max_id;
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function pendingBMRList()
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

       $out = DB::select("select * from (select c.description as customer_status,a.id,a.sample_number,a.type,a.request_date,a.received_date,a.delivered_date,a.status,a.any_behalf_of,a.source_at_team,b.id as sample_details_id,b.ref_name,b.ref_address,b.ref_mobile,b.ref_email,b.city,b.sample_response,b.status as sample_details_status  from sample_master a, sample_details b,process_status c  where a.status='CUSTOMER_SAMPLE_REQUEST' and a.id =b.sample_id and a.status=c.status) sample where sample.id not in (select object_id from sample_store_details where object_type='SAMPLE')");
        
        return json_decode(json_encode($out), true);
    }


    function getBMRCount()
    {
        $out = DB::select("select count(*) as total from (select * from (select c.description as customer_status,a.id,a.sample_number,a.type,a.request_date,a.received_date,a.delivered_date,a.status,a.any_behalf_of,a.source_at_team,b.id as sample_details_id,b.ref_name,b.ref_address,b.ref_mobile,b.ref_email,b.city,b.sample_response,b.status as sample_details_status  from sample_master a, sample_details b,process_status c  where a.status='CUSTOMER_SAMPLE_REQUEST' and a.id =b.sample_id and a.status=c.status) sample where sample.id not in (select object_id from sample_store_details where object_type='SAMPLE')) smp");
        
        return json_decode(json_encode($out), true);
    }

    function getCustomerSampleInfoBySampleId($sampleId)
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

       $out = DB::select("select g.first_name as user_first_name,g.last_name as user_last_name, e.name as method_name,f.name as uom_name,a.*,b.*,c.*,d.* from sample_master a,sample_details b, sample_items_details c,product_master d,product_method_master e,UOM_master f,user_master g  where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id and c.item_code=d.code and c.method=e.id and c.uom=f.id and a.created_by=g.id and g.is_active='Y'");
        
        return json_decode(json_encode($out), true);
    }

    function maxSampleStoreDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_store_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxSampleStoreRemarksDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_store_remarks_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function saveBMR($sampleId,$bmr_number,$store_remarks,$user_id)
    {
        $id = $this->maxSampleStoreDetailsId();
        $sampleStoreRemarksDetails = $this->maxSampleStoreRemarksDetailsId();

        $this->created_by = $user_id;

        $out = DB::insert("insert into sample_store_details (id,status,bmr,object_type,object_id,created_at,created_by) values('$id','CUSTOMER_SAMPLE_BMR_RECEIVED','$bmr_number','SAMPLE','$sampleId','$this->created_at','$this->created_by')");


        $out_1 = DB::insert("insert into sample_store_remarks_details(id,sample_store_id,remarks,updated_by) values('$sampleStoreRemarksDetails','$id','$store_remarks','$this->created_by')");

    }

    function getBMRDetailsBySampleID($sampleId)
    {
        $out = DB::select("select * from sample_store_details a,sample_store_remarks_details b,process_status c where a.object_type='SAMPLE' and a.object_id='$sampleId' and a.id=b.sample_store_id and a.status=c.status");

        return json_decode(json_encode($out), true);
    }

    function showProductionList()
    {
       // $out = DB::select("select * from production_master order by id desc");

        $out = DB::select("select a.*,b.name as source_warehouse,c.name as target_warehouse from production_master a,warehouse_master b,warehouse_master c where a.source_warehouse=b.id and a.target_warehouse=c.id order by id desc");

        return json_decode(json_encode($out), true);
    }


    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function maxProductionID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from production_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function production_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from production_master where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-PRODUCTION-'.$date_1.$maxSampleNum;
    }


    function maxProductionDetailsID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from production_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function save($user_id,$productionStartDay,$productionStartMonth,$productionStartyear,$productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear,$sourceWarehouse,$destinationWarehouse,$bom_no,$item_to_manufacture ,$manugfacture_item_qty,$production_remark,$table_product_name,$table_product_source_warhouse,$table_product_method,$table_product_required_qty,$table_product_transfered_qty,$table_product_consumed_qty,$table_product_uom,$manufacture_uom)
    {
        $production_start_date = $this->string_to_date($productionStartDay,$productionStartMonth,$productionStartyear);

        $expected_delivery_date = $this->string_to_date($productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear);

        $maxProductionID = $this->maxProductionID();

        $productionNo = $this->production_no();

        //dd($bom_no);

        $out = DB::insert("insert into production_master (id,production_number,items_to_manufacturer,qty,BOM_no,source_warehouse,target_warehouse,production_start_date,expected_delivery_date,remarks,created_at,created_by,qty_uom) values('$maxProductionID','$productionNo','$item_to_manufacture','$manugfacture_item_qty','$bom_no','$sourceWarehouse','$destinationWarehouse','$production_start_date','$expected_delivery_date','$production_remark','$this->created_at','$user_id','$manufacture_uom')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_source_warhouse as $key_code_ware => $value_code_ware) { $product_source_warhouse[] = $value_code_ware['product_source_warhouse']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_required_qty as $key_required => $value_required) { $product_required_qty[] = $value_required['product_required_qty']; }

        foreach ($table_product_transfered_qty as $key_transfered => $value_transfered) { $product_transfered_qty[] = $value_transfered['product_transfered_qty']; }

        foreach ($table_product_consumed_qty as $key_qty => $value_qty) { $product_consumed_qty[] = $value_qty['product_consumed_qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }


        for($i=0;$i<$countTable;$i++)
        {
            $product_code_production = $product_code[$i];

            $product_source_warhouse_production = $product_source_warhouse[$i];
     
            $product_method_production = $product_method[$i];
        
            $product_required_qty_production = $product_required_qty[$i];

            $product_transfered_qty_production = $product_transfered_qty[$i];

            $product_consumed_qty_production = $product_consumed_qty[$i];
         
            $product_uom_production = $product_uom[$i];

            $maxProductionDetailsID = $this->maxProductionDetailsID();

            $out = DB::insert("insert into production_details (id,production_id,item_code,source_warehouse,required_qty,transfered_qty,consumed_qty,uom,method) values('$maxProductionDetailsID','$maxProductionID','$product_code_production','$product_source_warhouse_production','$product_required_qty_production','$product_transfered_qty_production','$product_consumed_qty_production','$product_uom_production','$product_method_production')");
        }
    }

    function update($productionId,$productionStartDay,$productionStartMonth,$productionStartyear,$productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear,$sourceWarehouse,$destinationWarehouse,$bom_no,$item_to_manufacture ,$manugfacture_item_qty,$production_remark,$table_product_name,$table_product_source_warhouse,$table_product_method,$table_product_required_qty,$table_product_transfered_qty,$table_product_consumed_qty,$table_product_uom,$manufacture_uom)
    {
        $production_start_date = $this->string_to_date($productionStartDay,$productionStartMonth,$productionStartyear);

        $expected_delivery_date = $this->string_to_date($productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear);

        $out = DB::update("update production_master set items_to_manufacturer='$item_to_manufacture',qty='$manugfacture_item_qty',BOM_no='$bom_no',source_warehouse='$sourceWarehouse',target_warehouse='$destinationWarehouse',production_start_date='$production_start_date',expected_delivery_date='$expected_delivery_date',remarks='$production_remark' where id='$productionId'");

        $out_1 = DB::delete("delete from production_details where production_id='$productionId'");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_source_warhouse as $key_code_ware => $value_code_ware) { $product_source_warhouse[] = $value_code_ware['product_source_warhouse']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_required_qty as $key_required => $value_required) { $product_required_qty[] = $value_required['product_required_qty']; }

        foreach ($table_product_transfered_qty as $key_transfered => $value_transfered) { $product_transfered_qty[] = $value_transfered['product_transfered_qty']; }

        foreach ($table_product_consumed_qty as $key_qty => $value_qty) { $product_consumed_qty[] = $value_qty['product_consumed_qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }


        for($i=0;$i<$countTable;$i++)
        {
            $product_code_production = $product_code[$i];

            $product_source_warhouse_production = $product_source_warhouse[$i];
     
            $product_method_production = $product_method[$i];
        
            $product_required_qty_production = $product_required_qty[$i];

            $product_transfered_qty_production = $product_transfered_qty[$i];

            $product_consumed_qty_production = $product_consumed_qty[$i];
         
            $product_uom_production = $product_uom[$i];

            $maxProductionDetailsID = $this->maxProductionDetailsID();

            $out = DB::insert("insert into production_details (id,production_id,item_code,source_warehouse,required_qty,transfered_qty,consumed_qty,uom,method) values('$maxProductionDetailsID','$productionId','$product_code_production','$product_source_warhouse_production','$product_required_qty_production','$product_transfered_qty_production','$product_consumed_qty_production','$product_uom_production','$product_method_production')");
        }
    }


    function getProductionDetails($productionID)
    {
        $out = DB::select("select * from production_master a ,production_details b where a.id = b.production_id and a.id='$productionID'");

        return json_decode(json_encode($out), true);
    }
}