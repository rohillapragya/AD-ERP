<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Production_class;

use App\lib\Warehouse_class;

use App\lib\Product_class;

class Production extends Controller
{
    public function __construct(Production_class $production,Warehouse_class $warehouse,Product_class $product) 
    {
        $this->production = $production;

        $this->warehouse = $warehouse;

        $this->product = $product;
    }
 
    public function pendingBMRList()
    {
        $output = $this->production->pendingBMRList();

       return view('production.pending_BMR_List',compact('output'));
    }
   
    public function ReadyForBMR(Request $request)
    {
        $sampleId = $request->segment(4);

        $output = $this->production->getCustomerSampleInfoBySampleId($sampleId);

       //dd($output);
        return view('production.customer_sample_bmr',compact('output'));
    }


    public function saveBMR(Request $request)
    {
        $sampleId = request('sampleId');
        $bmr_number = request('bmr_number');
        $store_remarks = request('store_remarks');
        $user_id = Session::get('UID');

        $output = $this->production->saveBMR($sampleId,$bmr_number,$store_remarks,$user_id);

        $data['message'] ='BMR Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function index()
    {
        $output = $this->production->showProductionList();

        return view('production.index',compact('output'));
    }

    public function addProduction()
    {
        $warehouseList = $this->warehouse->getWarehouseList();

        $uom = $this->product->getUOM();

        return view('production.addNewProduction',compact('warehouseList','uom'));

    }

    public function save(Request $request)
    {
        $user_id = Session::get('UID');

        $productionStartDay = request('productionStartDay');
        $productionStartMonth = request('productionStartMonth');
        $productionStartyear = request('productionStartyear');
        $productionExpectedEndDay = request('productionExpectedEndDay');
        $productionExpectedEndMonth = request('productionExpectedEndMonth');
        $productionExpectedEndyear = request('productionExpectedEndyear');
        $sourceWarehouse = request('sourceWarehouse');
        $destinationWarehouse = request('destinationWarehouse');
        $bom_no = request('bom_no');
        $item_to_manufacture = request('item_to_manufacture');
        $manugfacture_item_qty = request('manugfacture_item_qty');
        $production_remark = request('production_remark');
        $product_name = request('product_name');
        $product_source_warhouse = request('product_source_warhouse');
        $product_method = request('product_method');
        $product_required_qty = request('product_required_qty');
        $product_transfered_qty = request('product_transfered_qty');
        $product_consumed_qty = request('product_consumed_qty');
        $product_uom = request('product_uom');
        $manufacture_uom = request('manufacture_uom');

        $output = $this->production->save($user_id,$productionStartDay,$productionStartMonth,$productionStartyear,$productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear,$sourceWarehouse,$destinationWarehouse,$bom_no,$item_to_manufacture ,$manugfacture_item_qty,$production_remark,$product_name,$product_source_warhouse,$product_method,$product_required_qty,$product_transfered_qty,$product_consumed_qty,$product_uom,$manufacture_uom);

        $data['message'] ='Production Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
        $user_id = Session::get('UID');

        $productionID = $request->segment(3);

        $output = $this->production->getProductionDetails($productionID);

        $warehouseList = $this->warehouse->getWarehouseList();

        $uom = $this->product->getUOM();

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

       // dd($output);

        return view('production.editProduction',compact('output','warehouseList','uom','product','method'));
    }

    public function update(Request $request)
    {
        $productionId = request('productionId');
        $productionStartDay = request('productionStartDay');
        $productionStartMonth = request('productionStartMonth');
        $productionStartyear = request('productionStartyear');
        $productionExpectedEndDay = request('productionExpectedEndDay');
        $productionExpectedEndMonth = request('productionExpectedEndMonth');
        $productionExpectedEndyear = request('productionExpectedEndyear');
        $sourceWarehouse = request('sourceWarehouse');
        $destinationWarehouse = request('destinationWarehouse');
        $bom_no = request('bom_no');
        $item_to_manufacture = request('item_to_manufacture');
        $manugfacture_item_qty = request('manugfacture_item_qty');
        $production_remark = request('production_remark');
        $product_name = request('product_name');
        $product_source_warhouse = request('product_source_warhouse');
        $product_method = request('product_method');
        $product_required_qty = request('product_required_qty');
        $product_transfered_qty = request('product_transfered_qty');
        $product_consumed_qty = request('product_consumed_qty');
        $product_uom = request('product_uom');
        $manufacture_uom = request('manufacture_uom');

        $output = $this->production->update($productionId,$productionStartDay,$productionStartMonth,$productionStartyear,$productionExpectedEndDay,$productionExpectedEndMonth,$productionExpectedEndyear,$sourceWarehouse,$destinationWarehouse,$bom_no,$item_to_manufacture ,$manugfacture_item_qty,$production_remark,$product_name,$product_source_warhouse,$product_method,$product_required_qty,$product_transfered_qty,$product_consumed_qty,$product_uom,$manufacture_uom);

        $data['message'] ='Production Information Edit Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

}