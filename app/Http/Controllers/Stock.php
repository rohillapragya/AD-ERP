<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Stock_class; 

use App\lib\Warehouse_class;

use App\lib\Product_class;

use App\lib\MRN_class;

class Stock extends Controller
{
	var $uid;

    public function __construct(Stock_class $stock,Warehouse_class $warehouse,Product_class $product,MRN_class $mrn) 
    {
        $this->stock = $stock;

        $this->warehouse = $warehouse;

       // $this->uid = Session::get('UID');

        $this->product = $product;

        $this->mrn = $mrn;        
    }

    public function index()
    {
    	// dd('Hello');
       $output = $this->stock->showLatestStockEntry();

        return view('stock.index',compact('output'));
    }


    public function getStockEntryCount()
    {
        return $this->stock->getStockEntryCount();
    }


    public function addNew()
    {
    	$stockEntryTypeDetailsId = '1';

    	$getStockEntryTypeMaster = $this->stock->getStockEntryTypeMaster();

    	$getStockEntryTypeMasterDetails = $this->stock->getStockEntryTypeMasterDetails($stockEntryTypeDetailsId);

    	$getWarehouseList = $this->warehouse->getWarehouseList();

        $getStockEntryFor = $this->stock->getStockEntryFor();

        $getStockEntryBehalfOf = $this->stock->getStockEntryBehalfOf();
    	
    	return view('stock.new',compact('getStockEntryTypeMaster','getStockEntryTypeMasterDetails','getWarehouseList','getStockEntryFor','getStockEntryBehalfOf'));
    }

    public function getStockEntryTypeDetails(Request $request)
    {
    	$stockEntryType = $request->input('stockEntryType');

        $getStockEntryTypeMasterDetails = $this->stock->getStockEntryTypeMasterDetails($stockEntryType);

        return $getStockEntryTypeMasterDetails;
    }

    public function saveStock(Request $request)
    {
        $stockEntryMRNID = request('stockEntryMRNID');

        if($stockEntryMRNID > 0)
        {
            $output = $this->mrn->updateMRNStockEntry($stockEntryMRNID);
        }

        $request->validate([
                'entryBehalfOfID' => 'required',
                'stock_entry_description' => 'required',
                'vendor_code' => 'required',
            ]
        );

    	$stockEntrydateDay = request('stockEntrydateDay');

    	$stockEntryDateMonth = request('stockEntryDateMonth');

    	$stockEntryDateyear = request('stockEntryDateyear');

    	$stockEntryType = request('stockEntryType');

    	$stockEntryTypeDetails = request('stockEntryTypeDetails');

    	$stock_entry_description = request('stock_entry_description');

    	$stockEntryWarehouseId = request('stockEntryWarehouseId');

    	$table_product_name = request('product_name');
    	
    	$table_product_method = request('product_method');

    	$table_product_qty = request('product_qty');
    	
    	$table_product_uom = request('product_uom');

    	$table_product_sample_qty = request('product_sample_qty');
    	
    	$table_product_sample_uom = request('product_sample_uom');

        $table_product_is_sample_uom = request('product_is_sample_uom');

        $user_id = Session::get('UID');

        $stockEntryFor = request('stockEntryFor');

        $vendor_code = request('vendor_code');

        $stockEntryBehalfOf = request('stockEntryBehalfOf');

        $entryBehalfOfID = request('entryBehalfOfID');

    	$output = $this->stock->addStock($user_id,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$table_product_is_sample_uom,$stockEntryWarehouseId,$stockEntryFor,$vendor_code,$stockEntryBehalfOf,$entryBehalfOfID);

    	//dd("Save");

    	$data['message'] ='Stock Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
    	$storeId = $request->segment(3);
    	//dd($storeId);

    	$stockEntryTypeDetailsId = '1';

    	$getStockEntryTypeMaster = $this->stock->getStockEntryTypeMaster();

    	$getStockEntryTypeMasterDetails = $this->stock->getStockEntryTypeMasterDetails($stockEntryTypeDetailsId);

    	$getWarehouseList = $this->warehouse->getWarehouseList();

    	$getStockInfoByStockId = $this->stock->getStockInfoByStockId($storeId);

    	$product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        $getStockEntryFor = $this->stock->getStockEntryFor();

        $getStockEntryBehalfOf = $this->stock->getStockEntryBehalfOf();

        //dd($getStockInfoByStockId);
    	
    	return view('stock.edit',compact('getStockEntryTypeMaster','getStockEntryTypeMasterDetails','getWarehouseList','getStockInfoByStockId','product','method','uom','getStockEntryFor','getStockEntryBehalfOf'));
    }

    public function update(Request $request)
    {
    	$store_id = request('stock_entry_id');

    	// dd($store_id);

    	$stockEntrydateDay = request('stockEntrydateDay');

    	$stockEntryDateMonth = request('stockEntryDateMonth');

    	$stockEntryDateyear = request('stockEntryDateyear');

    	$stockEntryType = request('stockEntryType');

    	$stockEntryTypeDetails = request('stockEntryTypeDetails');

    	$stock_entry_description = request('stock_entry_description');

    	$stockEntryWarehouseId = request('stockEntryWarehouseId');

    	$table_product_name = request('product_name');
    	
    	$table_product_method = request('product_method');

    	$table_product_qty = request('product_qty');
    	
    	$table_product_uom = request('product_uom');

    	$table_product_sample_qty = request('product_sample_qty');
    	
    	$table_product_sample_uom = request('product_sample_uom');

        $table_product_is_sample_uom = request('product_is_sample_uom');

        $user_id = Session::get('UID');

        $stockEntryFor = request('stockEntryFor');

        $vendor_code = request('vendor_code');

        $stockEntryBehalfOf = request('stockEntryBehalfOf');

        $entryBehalfOfID = request('entryBehalfOfID');

    	$output = $this->stock->updateStock($user_id,$store_id,$stockEntrydateDay,$stockEntryDateMonth,$stockEntryDateyear,$stockEntryType,$stockEntryTypeDetails,$stock_entry_description,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_sample_qty,$table_product_sample_uom,$table_product_is_sample_uom,$stockEntryWarehouseId,$stockEntryFor,$vendor_code,$stockEntryBehalfOf,$entryBehalfOfID);

    	$data['message'] ='Stock updated Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function reportIndex(Request $request)
    {
        $warehouseID = $request->input('warehouseID');

        if($warehouseID=='') {
            $warehouseID="ALL";
        }

        //dd($warehouseID);
        $output = $this->stock->getStockQtyByWareHouseId($warehouseID);
        //dd($output);
        $warehouse = $this->warehouse->showWarehouseList();

        $product = $this->product->getProuductList();

        return view('stockreport.index',compact('output','warehouse','product'));
    }

    public function getStockByWarehouseId(Request $request)
    {
        $warehouseID = $request->input('warehouseID');

        $productCode = $request->input('productCode');

        $output = $this->stock->getStockQtyByWareHouseIdPrdudct($warehouseID,$productCode);

       // $output = $this->stock->getStockQtyByWareHouseId($warehouseID);

        return $output;
    }

    public function checkIsStockObjectExist(Request $request)
    {
        $objectId = $request->input('objectId');

        $objectType = $request->input('objectType');

        $output = $this->stock->checkIsStockObjectExist($objectId,$objectType);

        return $output;
    }

}