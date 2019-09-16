<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Production_class;

class Production extends Controller
{
    public function __construct(Production_class $product) 
    {
        $this->product = $product;
    }
 
    public function pendingBMRList()
    {
        $output = $this->product->pendingBMRList();

       return view('production.pending_BMR_List',compact('output'));
    }
   
    public function ReadyForBMR(Request $request)
    {
        $sampleId = $request->segment(4);

        $output = $this->product->getCustomerSampleInfoBySampleId($sampleId);

       //dd($output);
        return view('production.customer_sample_bmr',compact('output'));
    }


    public function saveBMR(Request $request)
    {
        //dd($sampleId);

        $sampleId = request('sampleId');
        $bmr_number = request('bmr_number');
        $store_remarks = request('store_remarks');
        $user_id = Session::get('UID');

        $output = $this->product->saveBMR($sampleId,$bmr_number,$store_remarks,$user_id);

        $data['message'] ='BMR Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
    }

}