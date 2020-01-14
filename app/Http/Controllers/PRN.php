<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\PRN_class;

use App\lib\Stock_class;

use App\lib\Warehouse_class;

use App\lib\Product_class;

use App\lib\MRN_class;

class PRN extends Controller
{
    public function __construct(PRN_class $prn,Stock_class $stock,Warehouse_class $warehouse,Product_class $product,MRN_class $mrn) 
    {
        $this->prn = $prn;

        $this->stock = $stock;

        $this->warehouse = $warehouse;

        $this->product = $product;

        $this->mrn = $mrn;
    }

    public function index()
    {
        $output = $this->prn->showPRNList();

        return view('prn.index',compact('output'));
    }

    public function getPRNCount()
    {
        return $this->prn->getPRNCount();
    }

    public function addNew()
    {
        $purposeList = $this->mrn->getPurposeList();

        return view('prn.new',compact('purposeList'));
    }


    public function saveprn(Request $request)
    {
        $user_id = Session::get('UID');

        $prnrequiredDay = request('prnrequiredDay');

        $prnrequiredMonth = request('prnrequiredMonth');

        $prnrequiredyear = request('prnrequiredyear');

        $prn_remark = request('prn_remark');

        $product_name = request('product_name');

        $product_method = request('product_method');

        $product_qty = request('product_qty');

        $product_uom = request('product_uom');

        $output = $this->prn->saveprn($prnrequiredDay,$prnrequiredMonth,$prnrequiredyear,$prn_remark,$product_name,$product_method,$product_qty,$product_uom,$user_id);

        $data['message'] ='Purchase Requaztion Note Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
        $prnID = $request->segment(3);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        $output = $this->prn->showPRNDeatilsByPrnId($prnID);

        return view('prn.edit',compact('product','method','uom','output'));
    }

    public function update(Request $request)
    {
        $prnid = request('prnid');

        //dd($prnid);

        $user_id = Session::get('UID');

        $prnrequiredDay = request('prnrequiredDay');

        $prnrequiredMonth = request('prnrequiredMonth');

        $prnrequiredyear = request('prnrequiredyear');

        $prn_remark = request('prn_remark');

        $product_name = request('product_name');

        $product_method = request('product_method');

        $product_qty = request('product_qty');

        $product_uom = request('product_uom');

        $output = $this->prn->updateprn($prnid,$prnrequiredDay,$prnrequiredMonth,$prnrequiredyear,$prn_remark,$product_name,$product_method,$product_qty,$product_uom,$user_id);

        $data['message'] ='Purchase Requaztion Note updated Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function showVerifyPRN(Request $request)
    {
        $output = $this->prn->showPRNList();

        return view('prn.showVerifyPRN',compact('output'));
    }

    public function verifyPRNCount(Request $request)
    {
        return $this->prn->verifyPRNCount();
    }

    public function showPRN(Request $request)
    {
        $prnID = $request->segment(3);

        $output = $this->prn->showPRNDeatils($prnID);

        //dd($output);

        return view('prn.showPRN',compact('output'));
    }

    public function verifyPRN(Request $request)
    {
        $request->validate([ 'verifyPRN' => 'required',]);

        $prnID = request('prnID');

        $user_id = Session::get('UID');

        $verifyPRN = request('verifyPRN');

        if($verifyPRN=='1')
        {
           $output = $this->prn->verifyPRN($prnID,$user_id);
        }

        $data['message'] ='Purchase Requaztion Note Verified Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }
}