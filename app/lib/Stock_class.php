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

    	$out = DB::select("select a.stock_entry_for,a.id as id,a.entry_description,b.name as store_type,c.name as store_type_details,a.entry_date as created_at,d.name as warehouse_name from stock_entry a,stock_entry_type_master b,stock_entry_type_details c,warehouse_master d where a.entry_type_id = b.id and a.entry_type_details_id=c.id and a.warehouse_id=d.id order by stock_entry_for");

    	return json_decode(json_encode($out), true);
    }

    function getStockEntryCount()
    {
        //$out = DB::select("select * from stock_entry order by id desc");

        $out = DB::select("select count(*) as total from stock_entry a,stock_entry_type_master b,stock_entry_type_details c,warehouse_master d where a.entry_type_id = b.id and a.entry_type_details_id=c.id and a.warehouse_id=d.id order by stock_entry_for");

        return json_decode(json_encode($out), true);
    }


    function getStockEntryFor()
    {
        $out = DB::select("select * from stock_entry_for");

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

    
    function addStock($uid,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$table_product_is_sample_uom,$stockEntryWarehouseId,$stockEntryFor,$vendor_code)
    {
    	$maxStockEntryId = $this->maxStockEntryId();
    	
    	$maxStockTransactionLogId = $this->maxStockTransactionLogId();
    	//echo "stockEntrydateDay-".$stockEntrydateDay."stockEntryDateMonth-".$stockEntryDateMonth."stockEntryDateyear-".$stockEntryDateyear;

    	$entry_date = $this->string_to_date($stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear);

    	//print_r($entry_date);

    	//dd($entry_date);

    	$out = DB::insert("insert into stock_entry (id,entry_date,entry_type_id,entry_type_details_id,entry_description,warehouse_id,created_at,created_by,stock_entry_for,vendor_code) values('$maxStockEntryId','$entry_date','$stockEntryType','$stockEntryTypeDetails','$stock_entry_description','$stockEntryWarehouseId','$this->created_at','$uid','$stockEntryFor','$vendor_code')");

    	$countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        foreach ($table_product_sample_qty as $key_qty => $value_qty) { $product_sample_qty[] = $value_qty['product_sample_qty']; }

        foreach ($table_product_sample_uom as $key_uom => $value_uom) { $product_sample_uom[] = $value_uom['product_sample_uom']; }

        foreach ($table_product_is_sample_uom as $is_key_uom => $is_value_uom) { $product_is_sample_uom[] = $is_value_uom['product_is_sample_uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $product_sample_qty_sample = $product_sample_qty[$i];

            $product_sample_uom_sample = $product_sample_uom[$i];

            $product_is_sample_uom_sample = $product_is_sample_uom[$i];

            $maxStockItemsDetailsId = $this->maxStockItemsDetailsId();

            $out = DB::insert("insert into stock_items_details (id,stock_entry_id,item_code,item_name,method,item_qty,item_uom,control_qty,control_uom,is_control_sample) values('$maxStockItemsDetailsId','$maxStockEntryId','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_sample_qty_sample','$product_sample_uom_sample','$product_is_sample_uom_sample')");
        }

        $description ="Transaction being initiated for stock id $maxStockEntryId by $uid.Dated on entry_date for purpose $stockEntryType  $stockEntryTypeDetails.Stock entry for $stockEntryFor vendor code is $vendor_code";

        $out = DB::insert("insert into stock_transaction_log(id,stock_entry_id,description,created_at) values('$maxStockTransactionLogId','$maxStockEntryId','$description','$this->created_at')");

    }

    function getStockInfoByStockId($storeId)
    {
    	//$out = DB::select("select * from stock_entry a,stock_items_details b where a.id='$storeId' and a.id=b.stock_entry_id");

    	//$out = DB::select("select a.*,b.*,c.name as product_name,d.name as method_name,e.name as item_name_uom,f.name as control_name_uom from stock_entry a,stock_items_details b,product_master c,product_method_master d,UOM_master e,UOM_master f where a.id='$storeId' and a.id=b.stock_entry_id and b.item_code=c.code and b.method=d.id and b.item_uom=e.id and b.control_uom=f.id");

        $out = DB::select("select a.*,b.*,c.name as product_name,d.name as method_name,'' as item_name_uom,'' as control_name_uom from stock_entry a,stock_items_details b,product_master c,product_method_master d where a.id='$storeId' and a.id=b.stock_entry_id and b.item_code=c.code and b.method=d.id;");

    	return json_decode(json_encode($out), true);
    }


    function updateStock($uid,$store_id,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$table_product_is_sample_uom,$stockEntryWarehouseId,$stockEntryFor,$vendor_code)
    {
    	$entry_date = $this->string_to_date($stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear);

    	//$out = DB::insert("insert into stock_entry (id,entry_date,entry_type_id,entry_type_details_id,entry_description,warehouse_id,created_at,created_by) values('$maxStockEntryId','$entry_date','$stockEntryType','$stockEntryTypeDetails','$stock_entry_description','$stockEntryWarehouseId','$this->created_at',' $uid')");

    	$out = DB::update("update stock_entry set entry_date='$entry_date',entry_type_id='$stockEntryType',entry_type_details_id='$stockEntryTypeDetails',entry_description='$stock_entry_description',warehouse_id='$stockEntryWarehouseId',stock_entry_for='$stockEntryFor',vendor_code='$vendor_code' where id='$store_id'");

    	$out_1 = DB::insert("delete from stock_items_details where stock_entry_id='$store_id'");

    	$countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        foreach ($table_product_sample_qty as $key_qty => $value_qty) { $product_sample_qty[] = $value_qty['product_sample_qty']; }

        foreach ($table_product_sample_uom as $key_uom => $value_uom) { $product_sample_uom[] = $value_uom['product_sample_uom']; }

        foreach ($table_product_is_sample_uom as $is_key_uom => $is_value_uom) { $product_is_sample_uom[] = $is_value_uom['product_is_sample_uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $product_sample_qty_sample = $product_sample_qty[$i];

            $product_sample_uom_sample = $product_sample_uom[$i];

            $product_is_sample_uom_sample = $product_is_sample_uom[$i];

            $maxStockItemsDetailsId = $this->maxStockItemsDetailsId();

               $out = DB::insert("insert into stock_items_details (id,stock_entry_id,item_code,item_name,method,item_qty,item_uom,control_qty,control_uom,is_control_sample) values('$maxStockItemsDetailsId','$store_id','$product_code_sample','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_sample_qty_sample','$product_sample_uom_sample','$product_is_sample_uom_sample')");
        }
    }

    function getStockQtyByWareHouseId($warehouse_id)
    {
        $str ='';

        //dd($warehouse_id);
        if($warehouse_id=='ALL')
        {
            //$str = "and a.warehouse_id=$warehouse_id";

            $out = DB::select("select a.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,Inward_item_qty,IFNULL(Inward_control_qty,0) as Inward_control_qty,IFNULL(Outward_item_qty,0) as Outward_item_qty,IFNULL(Outward_control_qty,0) as Outward_control_qty,uom_1.name as item_uom from (select  stock_info.item_code,stock_info.warehouse_id,sum(stock_info.Inward_item_qty) as Inward_item_qty, sum(stock_info.Inward_control_qty) as Inward_control_qty,sum(stock_info.Outward_item_qty) as Outward_item_qty,sum(stock_info.Outward_control_qty) as Outward_control_qty,stock_info.item_uom from ( (select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.id=b.stock_entry_id) union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.id=b.stock_entry_id )) stock_info group by stock_info.item_code,stock_info.warehouse_id,stock_info.item_uom) a,warehouse_master wt,product_master product,UOM_master uom_1 where a.item_code=product.code and a.warehouse_id=wt.id and a.item_uom =uom_1.id");

            //$out = DB::select("select item_code,product_name,botanical_name,warehouse_name,Inward_item_qty,Inward_control_qty,Outward_item_qty,Outward_control_qty,item_uom,control_uom from (select st.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,sum(st.Inward_item_qty) as Inward_item_qty,sum(st.Inward_control_qty) as Inward_control_qty,sum(st.Outward_item_qty) as Outward_item_qty,sum(st.Outward_control_qty) as Outward_control_qty,(Inward_item_qty-Outward_item_qty) as item_qty_diff,(Inward_control_qty-Outward_control_qty) as item_control_qty_diff,uom_1.name as item_uom,uom_2.name as control_uom from ((select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom,control_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.id=b.stock_entry_id)union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom,control_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.id=b.stock_entry_id )) st,warehouse_master wt,product_master product,UOM_master uom_1,UOM_master uom_2 where st.warehouse_id=wt.id and st.item_code = product.code and item_uom=uom_1.id and control_uom=uom_2.id group by st.item_code,product_name,botanical_name,warehouse_name) stock");

          // $out = DB::select("select item_code,product_name,botanical_name,warehouse_name,Inward_item_qty,Inward_control_qty,Outward_item_qty,Outward_control_qty,item_uom from (select st.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,sum(st.Inward_item_qty) as Inward_item_qty,sum(st.Inward_control_qty) as Inward_control_qty,sum(st.Outward_item_qty) as Outward_item_qty,sum(st.Outward_control_qty) as Outward_control_qty,(Inward_item_qty-Outward_item_qty) as item_qty_diff,(Inward_control_qty-Outward_control_qty) as item_control_qty_diff,uom_1.name as item_uom from ((select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.id=b.stock_entry_id) union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.id=b.stock_entry_id )) st,warehouse_master wt,product_master product,UOM_master uom_1,UOM_master uom_2 where st.warehouse_id=wt.id and st.item_code = product.code and item_uom=uom_1.id group by st.item_code,product_name,botanical_name,warehouse_name) stock");
        }

        else
        {
            $out = DB::select("select a.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,Inward_item_qty,IFNULL(Inward_control_qty,0) as Inward_control_qty,IFNULL(Outward_item_qty,0) as Outward_item_qty,IFNULL(Outward_control_qty,0) as Outward_control_qty,uom_1.name as item_uom from (select  stock_info.item_code,stock_info.warehouse_id,sum(stock_info.Inward_item_qty) as Inward_item_qty, sum(stock_info.Inward_control_qty) as Inward_control_qty,sum(stock_info.Outward_item_qty) as Outward_item_qty,sum(stock_info.Outward_control_qty) as Outward_control_qty,stock_info.item_uom from ( (select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id) union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id )) stock_info group by stock_info.item_code,stock_info.warehouse_id,stock_info.item_uom) a,warehouse_master wt,product_master product,UOM_master uom_1 where a.item_code=product.code and a.warehouse_id=wt.id and a.item_uom =uom_1.id");

           // $out = DB::select("select item_code,product_name,botanical_name,warehouse_name,Inward_item_qty,Inward_control_qty,Outward_item_qty,Outward_control_qty,item_uom from (select st.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,sum(st.Inward_item_qty) as Inward_item_qty,sum(st.Inward_control_qty) as Inward_control_qty,sum(st.Outward_item_qty) as Outward_item_qty,sum(st.Outward_control_qty) as Outward_control_qty,(Inward_item_qty-Outward_item_qty) as item_qty_diff,(Inward_control_qty-Outward_control_qty) as item_control_qty_diff,uom_1.name as item_uom from ((select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id)union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id )) st,warehouse_master wt,product_master product,UOM_master uom_1,UOM_master uom_2 where st.warehouse_id=wt.id and st.item_code = product.code and item_uom=uom_1.id group by st.item_code,product_name,botanical_name,warehouse_name) stock");

            //$out = DB::select("select item_code,product_name,botanical_name,warehouse_name,Inward_item_qty,Inward_control_qty,Outward_item_qty,Outward_control_qty,item_uom,control_uom from (select st.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,sum(st.Inward_item_qty) as Inward_item_qty,sum(st.Inward_control_qty) as Inward_control_qty,sum(st.Outward_item_qty) as Outward_item_qty,sum(st.Outward_control_qty) as Outward_control_qty,(Inward_item_qty-Outward_item_qty) as item_qty_diff,(Inward_control_qty-Outward_control_qty) as item_control_qty_diff,uom_1.name as item_uom,uom_2.name as control_uom from ((select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom,control_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id)union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom,control_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id )) st,warehouse_master wt,product_master product,UOM_master uom_1,UOM_master uom_2 where st.warehouse_id=wt.id and st.item_code = product.code and item_uom=uom_1.id and control_uom=uom_2.id group by st.item_code,product_name,botanical_name,warehouse_name) stock");

           // $out = DB::select("select item_code,product_name,botanical_name,warehouse_name,Inward_item_qty,Inward_control_qty,Outward_item_qty,Outward_control_qty from (select st.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,sum(st.Inward_item_qty) as Inward_item_qty,sum(st.Inward_control_qty) as Inward_control_qty,sum(st.Outward_item_qty) as Outward_item_qty,sum(st.Outward_control_qty) as Outward_control_qty,(Inward_item_qty-Outward_item_qty) as item_qty_diff,(Inward_control_qty-Outward_control_qty) as item_control_qty_diff from ( (select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id)union (select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.warehouse_id='$warehouse_id' and a.id=b.stock_entry_id )) st,warehouse_master wt,product_master product where st.warehouse_id=wt.id and st.item_code = product.code group by st.item_code,product_name,botanical_name,warehouse_name) stock");
        }

        return json_decode(json_encode($out), true);
    }


    function getStockQtyByWareHouseIdPrdudct($warehouseID,$productCode)
    {
        $whereStr = 'and 1=1';
        
        if($warehouseID!=='ALL')
        {
            $whereStr = $whereStr." and  a.warehouse_id='$warehouseID'";
        }

        if($productCode!=='ALL')
        {
            $whereStr = $whereStr." and b.item_code='$productCode'";
        }

        //print_r($warehouseID);
       // print_r($whereStr);
        //dd('AS');

        $out= DB::select("select a.item_code,product.name as product_name,product.scrientific_name as botanical_name,wt.name as warehouse_name,Inward_item_qty,IFNULL(Inward_control_qty,0) as Inward_control_qty,IFNULL(Outward_item_qty,0) as Outward_item_qty,IFNULL(Outward_control_qty,0) as Outward_control_qty,uom_1.name as item_uom from ( select  stock_info.item_code,stock_info.warehouse_id,sum(stock_info.Inward_item_qty) as Inward_item_qty, sum(stock_info.Inward_control_qty) as Inward_control_qty,sum(stock_info.Outward_item_qty) as Outward_item_qty,sum(stock_info.Outward_control_qty) as Outward_control_qty,stock_info.item_uom from ( (select b.item_code,warehouse_id,b.item_qty as Inward_item_qty,b.control_qty as Inward_control_qty,'0' as Outward_item_qty,'0' as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='1' and a.id=b.stock_entry_id $whereStr) union ( select b.item_code,warehouse_id,'0' as Inward_item_qty,'0' as Inward_control_qty,b.item_qty as Outward_item_qty,b.control_qty as Outward_control_qty,item_uom from stock_entry a,stock_items_details b where a.entry_type_id='2' and a.id=b.stock_entry_id $whereStr)) stock_info group by stock_info.item_code,stock_info.warehouse_id,stock_info.item_uom) a,warehouse_master wt,product_master product,UOM_master uom_1 where a.item_code=product.code and a.warehouse_id=wt.id and a.item_uom =uom_1.id");

        return json_decode(json_encode($out), true);
    }


    function gettingStockInfoByStockId($stockId)
    {
        $out = DB::select("select a.id as stock_entry_id,b.name as stock_entry_type,c.name as entry_type_details_id,d.stock_entry_for,a.entry_date,e.name as warehouse_name,a.vendor_code,a.vendor_batch_number,a.raw_material_batch_number,a.r_d_batch_number,g.name as product_name,g.scrientific_name,h.name as method_name,f.item_code from stock_entry a,stock_entry_type_master b,stock_entry_type_details c,stock_entry_for d,warehouse_master e,stock_items_details f,product_master g,product_method_master h where a.id='$stockId' and a.entry_type_id = b.id and a.entry_type_details_id = c.id and a.stock_entry_for = d.id and a.warehouse_id = e.id and a.id=f.stock_entry_id and f.item_code=g.code and f.method = h.id");

        return json_decode(json_encode($out), true);
    }

}