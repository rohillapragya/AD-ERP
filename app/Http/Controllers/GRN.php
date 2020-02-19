<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\GRN_class;

use App\lib\Warehouse_class;

use App\lib\user_registration;

use App\lib\Dispatch_class;

use App\lib\Product_class;

class GRN extends Controller
{
    public function __construct(GRN_class $grn,Warehouse_class $warehouse,User_Registration $user_reg,Dispatch_class $dispatch,Product_class $product) 
    {
        $this->grn = $grn;

        $this->warehouse = $warehouse;

        $this->user_reg = $user_reg;

        $this->dispatch = $dispatch;

        $this->product = $product;
    }

    public function index()
    {
        $location_id = Session::get('location_id');

        $output = $this->grn->showGRNList($location_id);

        return view('grn.index',compact('output'));
    }

    public function addNew()
    {
        $warehouseList = $this->warehouse->getWarehouseList();

        $getVendorList = $this->user_reg->getVendorList();

        $dispatchServiceList = $this->dispatch->getDispatchServiceList();

        // $prouductList = $this->product->getProuductList();

        // $method = $this->product->getMethod();
        
        // $categoryList = $this->product->activeCategoryList();
       // dd($getVendorList);
        return view('grn.new',compact('warehouseList','getVendorList','dispatchServiceList'));
    }

    public function save(Request $request)
    {
        $user_id = Session::get('UID');
        $location_id = Session::get('location_id');

        $prn_no = request('prn_no');
        $grnRequestDay = request('grnRequestDay');
        $grnRequestMonth = request('grnRequestMonth');
        $grnRequestYear = request('grnRequestYear');
        $grnDeliveredDay = request('grnDeliveredDay');
        $grnDeliveredMonth = request('grnDeliveredMonth');
        $grnDeliveredYear = request('grnDeliveredYear');
        $supplier = request('supplier');
        $bill_no = request('bill_no');
        $lr_no = request('lr_no');
        $dispatch_service = request('dispatch_service');
        $delivery_location = request('delivery_location');
        $total_amount = request('total_amount');
        $product_name = request('product_name');
        $product_method = request('product_method');
        $product_qty = request('product_qty');
        $product_price = request('product_price');
        $product_uom = request('product_uom');

        $output = $this->grn->save($user_id,$prn_no,$grnRequestDay,$grnRequestMonth,$grnRequestYear,$grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear,$supplier,$bill_no,$lr_no,$dispatch_service,$delivery_location,$total_amount,$product_name,$product_method,$product_qty,$product_price,$product_uom,$location_id);

        $data['message'] ='Goods Rececipt Note (GRN) Added Successfully. Go to Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
        $grnID = $request->segment(3);
    
        $output = $this->grn->getGRNDetails($grnID);

        $warehouseList = $this->warehouse->getWarehouseList();

        $getVendorList = $this->user_reg->getVendorList();

        $dispatchServiceList = $this->dispatch->getDispatchServiceList();

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();
        
        $uom = $this->product->getUOM();

        return view('grn.show',compact('warehouseList','getVendorList','dispatchServiceList','output','product','method','uom'));
    }

    public function update(Request $request)
    {
        $user_id = Session::get('UID');
        $location_id = Session::get('location_id');

        $grn_number = request('grn_number');
        $prn_no = request('prn_no');
        $grnRequestDay = request('grnRequestDay');
        $grnRequestMonth = request('grnRequestMonth');
        $grnRequestYear = request('grnRequestYear');
        $grnDeliveredDay = request('grnDeliveredDay');
        $grnDeliveredMonth = request('grnDeliveredMonth');
        $grnDeliveredYear = request('grnDeliveredYear');
        $supplier = request('supplier');
        $bill_no = request('bill_no');
        $lr_no = request('lr_no');
        $dispatch_service = request('dispatch_service');
        $delivery_location = request('delivery_location');
        $total_amount = request('total_amount');
        $product_name = request('product_name');
        $product_method = request('product_method');
        $product_qty = request('product_qty');
        $product_price = request('product_price');
        $product_uom = request('product_uom');

        $output = $this->grn->update($user_id,$grn_number,$prn_no,$grnRequestDay,$grnRequestMonth,$grnRequestYear,$grnDeliveredDay,$grnDeliveredMonth,$grnDeliveredYear,$supplier,$bill_no,$lr_no,$dispatch_service,$delivery_location,$total_amount,$product_name,$product_method,$product_qty,$product_price,$product_uom,$location_id);

        $data['message'] ='Goods Rececipt Note (GRN) updated Successfully. Go to Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

}