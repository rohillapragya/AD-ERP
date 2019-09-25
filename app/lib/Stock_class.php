<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Stock_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showLatestStockEntry()
    {
    	//$out = DB::select("select * from stock_entry order by id desc");

    	$out = DB::select("select a.id as id,a.entry_description,b.name as store_type,c.name as store_type_details,a.entry_date as created_at,d.name as warehouse_name from stock_entry a,stock_entry_type_master b,stock_entry_type_details c,warehouse_master d where a.entry_type_id = b.id and a.entry_type_details_id=c.id and a.warehouse_id=d.id");

    	return json_decode(json_encode($out), true);
    }

    function getStockEntryTypeMaster()
    {
    	$out = DB::select("select * from stock_entry_type_master order by id");

    	return json_decode(json_encode($out), true);
    }

    function getStockEntryTypeMasterDetails($stockEntryTypeDetailsId)
    {
    	$out = DB::select("select * from stock_entry_type_details where stock_entry_type_master_id='$stockEntryTypeDetailsId'");

    	return json_decode(json_encode($out), true);
    }

    function maxStockTransactionLogId() {

    	$out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from stock_transaction_log");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) {   return $value['max_id'];}
    }

    function maxStockItemsDetailsId() {

    	$out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from stock_items_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) { return $value['max_id']; }
    }

    function maxStockEntryId() {

    	$out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from stock_entry");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) {  return $value['max_id'];}
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    
    function addStock($uid,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$stockEntryWarehouseId)
    {
    	$maxStockEntryId = $this->maxStockEntryId();
    	
    	$maxStockTransactionLogId = $this->maxStockTransactionLogId();
    	//echo "stockEntrydateDay-".$stockEntrydateDay."stockEntryDateMonth-".$stockEntryDateMonth."stockEntryDateyear-".$stockEntryDateyear;

    	$entry_date = $this->string_to_date($stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear);

    	//print_r($entry_date);

    	//dd($entry_date);

    	$out = DB::insert("insert into stock_entry (id,entry_date,entry_type_id,entry_type_details_id,entry_description,warehouse_id,created_at,created_by) values('$maxStockEntryId','$entry_date','$stockEntryType','$stockEntryTypeDetails','$stock_entry_description','$stockEntryWarehouseId','$this->created_at',' $uid')");

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

            $maxStockItemsDetailsId = $this->maxStockItemsDetailsId();

            $out = DB::insert("insert into stock_items_details (id,stock_entry_id,item_code,item_name,method,item_qty,item_uom,control_qty,control_uom) values('$maxStockItemsDetailsId','$maxStockEntryId','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_sample_qty_sample','$product_sample_uom_sample')");
        }

        $description ="Transaction being initiated for stock id $maxStockEntryId by $uid.Dated on entry_date for purpose $stockEntryType  $stockEntryTypeDetails";

        $out = DB::insert("insert into stock_transaction_log(id,stock_entry_id,description,created_at) values('$maxStockTransactionLogId','$maxStockEntryId','$description','$this->created_at')");

    }

    function getStockInfoByStockId($storeId)
    {
    	//$out = DB::select("select * from stock_entry a,stock_items_details b where a.id='$storeId' and a.id=b.stock_entry_id");

    	$out = DB::select("select a.*,b.*,c.name as product_name,d.name as method_name,e.name as item_name_uom,f.name as control_name_uom from stock_entry a,stock_items_details b,product_master c,product_method_master d,UOM_master e,UOM_master f where a.id='$storeId' and a.id=b.stock_entry_id and b.item_code=c.code and b.method=d.id and b.item_uom=e.id and b.control_uom=f.id");

    	return json_decode(json_encode($out), true);
    }


    function updateStock($uid,$store_id,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$stockEntryWarehouseId)
    {
    	$entry_date = $this->string_to_date($stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear);

    	//$out = DB::insert("insert into stock_entry (id,entry_date,entry_type_id,entry_type_details_id,entry_description,warehouse_id,created_at,created_by) values('$maxStockEntryId','$entry_date','$stockEntryType','$stockEntryTypeDetails','$stock_entry_description','$stockEntryWarehouseId','$this->created_at',' $uid')");

    	$out = DB::update("update stock_entry set entry_date='$entry_date',entry_type_id='$stockEntryType',entry_type_details_id='$stockEntryTypeDetails',entry_description='$stock_entry_description',warehouse_id='$stockEntryWarehouseId' where id='$store_id'");

    	$out_1 = DB::insert("delete from stock_items_details where stock_entry_id='$store_id'");

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

            $maxStockItemsDetailsId = $this->maxStockItemsDetailsId();

            $out = DB::insert("insert into stock_items_details (id,stock_entry_id,item_code,item_name,method,item_qty,item_uom,control_qty,control_uom) values('$maxStockItemsDetailsId','$store_id','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_sample_qty_sample','$product_sample_uom_sample')");
        }
    }

}