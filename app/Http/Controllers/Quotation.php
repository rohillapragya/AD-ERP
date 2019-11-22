<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Quotation_class;

use App\lib\Product_class;

class Quotation extends Controller
{
    public function __construct(Quotation_class $quotation,Product_class $product)  
    {
        $this->quotation = $quotation;

        $this->product = $product;
    }

    public function index()
    {
        $output = $this->quotation->verifyPRNList();

        return view('quotation.index',compact('output'));
    }

    public function add(Request $request)
    {
        $pID = $request->segment(2);

        $output = $this->quotation->gettingVerifyPRNDetails($pID);

        //dd($output);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        return view('quotation.add',compact('output','product','method','uom'));
    }

    public function save(Request $request)
    {
        $user_id = Session::get('UID');
        $quotationRequestDay = request('quotationRequestDay');
        $quotationRequestMonth = request('quotationRequestMonth');
        $quotationRequestYear = request('quotationRequestYear');
        $quotationDeliveryDay = request('quotationDeliveryDay');
        $quotationDeliveryMonth = request('quotationDeliveryMonth');
        $quotationDeliveryYear = request('quotationDeliveryYear');
        $quotation_remark = request('quotation_remark');
        $product_name = request('product_name');
        $product_method = request('product_method');
        $product_qty = request('product_qty');
        $product_uom = request('product_uom');
        $prnid = request('prnid');

        $output = $this->quotation->save($user_id,$quotationRequestDay,$quotationRequestMonth,$quotationRequestYear,$quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear,$quotation_remark,$product_name,$product_method,$product_qty,$product_uom,$prnid);

        $data['message'] ='Quotation Details Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }
}