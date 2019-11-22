<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

use App\lib\Dispatch_class;

use App\lib\Product_class;

use App\lib\cron_job_email;


class Dispatch extends Controller
{
    public function __construct(Dispatch_class $dispatch,Product_class $product,cron_job_email $cron) 
    {
        $this->dispatch = $dispatch;

        $this->product = $product;

        $this->cron = $cron;
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
        $data['text'] = '';

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
        $data['text'] = '';

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

        $object_type ='SAMPLE';

        $output = $this->product->getCustomerSampleInfoBySampleId($sampleId);

        $dispatch_service_list = $this->dispatch->getDispatchServiceList();

        $dispatch_details = $this->dispatch->getDispatchDetails($object_type,$sampleId);
        
       // dd($dispatch_details);

        return view('dispatch.save_dispatch',compact('output','dispatch_service_list','dispatch_details'));
    }
 
    public function addDisaptchInfo(Request $request)
    {
        $sampleId = request('sampleId');

        if(request('sampleId')) {
            $object_type='SAMPLE';
        }   
        else{
             $object_type='INQUIRY';
        }    

        $user_id = Session::get('UID');

        if(request('docx_receipt_attacment'))
        {
            $request->validate([
                'docx_receipt_attacment' => 'mimes:jpeg,png,jpg,pdf|max:2048',
                ]);
        }

        $dispatchService = request('dispatchService');

        $dispatch_amount = request('dispatch_amount');

        $dispatchdateDay = request('dispatchdateDay');

        $dispatchDateMonth = request('dispatchDateMonth');

        $dispatchDateyear = request('dispatchDateyear');

        $deliverydateDay = request('deliverydateDay');

        $deliveryDateMonth = request('deliveryDateMonth');

        $deliveryDateyear = request('deliveryDateyear');

        $dispatch_docx_number = request('dispatch_docx_number');

        $dispatchStatus = request('dispatchStatus');

        $docx_receipt_attacment = request('docx_receipt_attacment');

        $document_name = request('document_name');

        if($dispatchStatus=='DISPATCH')
        {
           // echo "DISPATCH";
            $output = $this->dispatch->saveDispatchInfo($sampleId,$object_type,$user_id,$dispatchService,$dispatch_amount,$dispatchdateDay,$dispatchDateMonth,$dispatchDateyear,$deliverydateDay,$deliveryDateMonth,$deliveryDateyear,$dispatch_docx_number,$dispatchStatus,$docx_receipt_attacment,$document_name);

            $this->cron->save($user_id,'SAMPLE_INQUIRY_DISPATCH','PENDING',$sampleId);
        }
        else
        {
            //echo "DELIVERIED";
             $output = $this->dispatch->editDispatchInfo($sampleId,$object_type,$user_id,$dispatchStatus);
             $this->cron->save($user_id,'SAMPLE_INQUIRY_DELIVERED','PENDING',$sampleId);
        }
       // dd($dispatchStatus);
       // dd('Saved');

        $data['message'] ='Dispatch Information saved Successfully. Go to  Dashboard using button';
        $data['text'] = 'Dispatch';

        return view('dashboard_return.success',$data);
    }
}
