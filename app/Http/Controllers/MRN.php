<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\MRN_class;

use App\lib\Stock_class;

use App\lib\Warehouse_class;

use App\lib\Product_class;

class MRN extends Controller
{
    public function __construct(MRN_class $mrn,Stock_class $stock,Warehouse_class $warehouse,Product_class $product) 
    {
        $this->mrn = $mrn;

        $this->stock = $stock;

        $this->warehouse = $warehouse;

        $this->product = $product;
    }

    public function index()
    {
        $location_id = Session::get('location_id');

        $output = $this->mrn->showMRNList($location_id);

        return view('mrn.index',compact('output'));
    }

    public function mrnCount()
    {
        $location_id = Session::get('location_id');

        return $this->mrn->mrnCount($location_id);
    }


    public function addNew()
    {
        $purposeList = $this->mrn->getPurposeList();

        return view('mrn.new',compact('purposeList'));
    }

    public function getPurposeList()
    {
        $purposeList = $this->mrn->getPurposeList();

        return $purposeList;
    }

    public  function saveMRN(Request $request)
    {
        $user_id = Session::get('UID');

        $location_id = Session::get('location_id');

        $mrn_request_type = request('mrn_request_type');

        $mrn_object_request_id = request('mrn_request_id');

        $mrnrequiredDay = request('mrnrequiredDay');

        $mrnrequiredMonth = request('mrnrequiredMonth');

        $mrnrequiredyear = request('mrnrequiredyear');

        $mrn_purpose_type = request('mrn_purpose_type');

        $mrn_remark = request('mrn_remark');

        $product_name = request('product_name');

        $product_method = request('product_method');

        $product_qty = request('product_qty');

        $product_uom = request('product_uom');

        $product_sample_qty = request('product_sample_qty');

        $product_sample_uom = request('product_sample_uom');

        $output = $this->mrn->saveMRN($mrn_request_type,$mrn_object_request_id,$mrnrequiredDay,$mrnrequiredMonth,$mrnrequiredyear,$mrn_purpose_type,$mrn_remark,$product_name,$product_method,$product_qty,$product_uom,$product_sample_qty,$product_sample_uom,$user_id,$location_id);

        $data['message'] ='Material Requaztion Note Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function checkMRNRequestId(Request $request)
    {
        $objectId = $request->input('objectId');

        $objectType = $request->input('objectType');

        $output = $this->mrn->checkMRNRequestId($objectId,$objectType);

        return $output;
    }

    public function addNewPurpose(Request $request)
    {
        $purpose = $request->input('purpose');

        $output = $this->mrn->addNewPurpose($purpose);

        return $output;
    }

    public function mrnStockEntry(Request $request)
    {
        $mrnID = $request->segment(2);

        $mrnDetails = $this->mrn->mrnStockEntry($mrnID);


        $stockEntryTypeDetailsId = '1';

        $getStockEntryTypeMaster = $this->stock->getStockEntryTypeMaster();

        $getStockEntryTypeMasterDetails = $this->stock->getStockEntryTypeMasterDetails($stockEntryTypeDetailsId);

        $getWarehouseList = $this->warehouse->getWarehouseList();

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        $getStockEntryFor = $this->stock->getStockEntryFor();

        $getStockEntryBehalfOf = $this->stock->getStockEntryBehalfOf();

        return view('mrn.mrnEntryAsStockEntry',compact('mrnDetails','getStockEntryTypeMaster','getStockEntryTypeMasterDetails','getWarehouseList','product','method','uom','getStockEntryBehalfOf','getStockEntryFor'));
    }

    public function prnEntry(Request $request)
    {
        $mrnID = $request->segment(2);

        $output = $this->mrn->mrnStockEntry($mrnID);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        return view('prn.createPRNBefalfOfMRN',compact('output','product','method','uom'));
    }
}