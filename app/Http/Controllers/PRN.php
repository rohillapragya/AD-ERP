<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\PRN_class;

use App\lib\Stock_class;

use App\lib\Warehouse_class;

use App\lib\Product_class;

class PRN extends Controller
{
    public function __construct(PRN_class $prn,Stock_class $stock,Warehouse_class $warehouse,Product_class $product) 
    {
        $this->prn = $prn;

        $this->stock = $stock;

        $this->warehouse = $warehouse;

        $this->product = $product;
    }

    public function index()
    {
        $output = $this->prn->showPRNList();

        return view('prn.index',compact('output'));
    }

    // public function addNew()
    // {
    //     $purposeList = $this->prn->getPurposeList();

    //     return view('prn.new',compact('purposeList'));
    // }

    // public function getPurposeList()
    // {
    //     $purposeList = $this->prn->getPurposeList();

    //     return $purposeList;
    // }

    // public  function saveprn(Request $request)
    // {
    //     $user_id = Session::get('UID');

    //     $prn_request_type = request('prn_request_type');

    //     $prn_object_request_id = request('prn_request_id');

    //     $prnrequiredDay = request('prnrequiredDay');

    //     $prnrequiredMonth = request('prnrequiredMonth');

    //     $prnrequiredyear = request('prnrequiredyear');

    //     $prn_purpose_type = request('prn_purpose_type');

    //     $prn_remark = request('prn_remark');

    //     $product_name = request('product_name');

    //     $product_method = request('product_method');

    //     $product_qty = request('product_qty');

    //     $product_uom = request('product_uom');

    //     $product_sample_qty = request('product_sample_qty');

    //     $product_sample_uom = request('product_sample_uom');

    //     $output = $this->prn->saveprn($prn_request_type,$prn_object_request_id,$prnrequiredDay,$prnrequiredMonth,$prnrequiredyear,$prn_purpose_type,$prn_remark,$product_name,$product_method,$product_qty,$product_uom,$product_sample_qty,$product_sample_uom,$user_id);

    //     $data['message'] ='Material Requaztion Note Added Successfully. Go to  Dashboard using button';

    //     return view('dashboard_return.success',$data);
    // }

    // public function checkprnRequestId(Request $request)
    // {
    //     $objectId = $request->input('objectId');

    //     $objectType = $request->input('objectType');

    //     $output = $this->prn->checkprnRequestId($objectId,$objectType);

    //     return $output;
    // }

    // public function addNewPurpose(Request $request)
    // {
    //     $purpose = $request->input('purpose');

    //     $output = $this->prn->addNewPurpose($purpose);

    //     return $output;
    // }

    // public function prnStockEntry(Request $request)
    // {
    //     $prnID = $request->segment(2);

    //     $prnDetails = $this->prn->prnStockEntry($prnID);


    //     $stockEntryTypeDetailsId = '1';

    //     $getStockEntryTypeMaster = $this->stock->getStockEntryTypeMaster();

    //     $getStockEntryTypeMasterDetails = $this->stock->getStockEntryTypeMasterDetails($stockEntryTypeDetailsId);

    //     $getWarehouseList = $this->warehouse->getWarehouseList();

    //     $product = $this->product->getProuductList();

    //     $method = $this->product->getMethod();

    //     $uom = $this->product->getUOM();

    //     return view('prn.prnEntryAsStockEntry',compact('prnDetails','getStockEntryTypeMaster','getStockEntryTypeMasterDetails','getWarehouseList','product','method','uom'));
    // }
}