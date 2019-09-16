<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

use App\lib\Dispatch_class;

use App\lib\Product_class;

class Dispatch extends Controller
{
    public function __construct(Dispatch_class $dispatch,Product_class $product) 
    {
        $this->dispatch = $dispatch;

        $this->product = $product;
    }

    public function serviceIndex()
    {
        $output = $this->dispatch->getDispatchServiceList();
        //dd($output);
        return view('dispatch.service',compact('output'));
    }

    public function addNewService()
    {
        return view('dispatch.addNewService');
    }

    public function saveService(Request $request)
    {
        $user_id = Session::get('UID');

        $request->validate([
                'dispatch_full_name' => 'required',
            ]);

        if(request('dispatch_mobile')){
            $request->validate([
                'dispatch_mobile' => ['required', 'digits:10'],
                ]);
        }

        if(request('dispatch_email')){
            $request->validate([
                'dispatch_email' => 'required|email',
                ]);
        }

        $dispatch_full_name = request('dispatch_full_name');

        $dispatch_mobile = request('dispatch_mobile');

        $dispatch_email = request('dispatch_email');

        $output = $this->dispatch->saveService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$user_id);

        $data['message'] ='Dispatch Service Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
        // dd("dispatch_full_name-".$dispatch_full_name."-dispatch_mobile".$dispatch_mobile."-dispatch_email".$dispatch_email);

    }

    public function showService(Request $request)
    {
        $servicId = $request->segment(4);

        $output = $this->dispatch->serviceDetailsByServiceId($servicId);

        return view('dispatch.editService',compact('output'));

       // dd($servicId);
    }

    public function editService(Request $request)
    {
        $dispatch_full_name = request('dispatch_full_name');

        $dispatch_mobile = request('dispatch_mobile');

        $dispatch_email = request('dispatch_email');

        $dispatchId = request('dispatchId');

        $output = $this->dispatch->editService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$dispatchId);

        $data['message'] ='Dispatch Service updated Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
        //dd("dispatch_full_name -".$dispatch_full_name."-dispatch_mobile-".$dispatch_mobile."-dispatch_email-".$dispatch_email."-dispatchId-".$dispatchId);
    }

    public function dispatchInfoIndex()
    {
        $output = $this->dispatch->getDispatchPendingList();
        
        return view('dispatch.dispatch_pending_list',compact('output'));
    }

    public function saveDispatchInfo(Request $request)
    {
        $sampleId = $request->segment(3);

        $output = $this->product->getCustomerSampleInfoBySampleId($sampleId);

        $dispatch_service_list = $this->dispatch->getDispatchServiceList();
        //dd($output);

        return view('dispatch.save_dispatch',compact('output','dispatch_service_list'));
    }
 
}
