<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Product_class;

use App\lib\Production_class;

use App\lib\QC_class;

class Sample extends Controller
{
    public function __construct(Product_class $product,Production_class $production,QC_class $qc) 
    {
        $this->product = $product;

        $this->production = $production;

        $this->qc = $qc;
    }
    
    public function customerSampleIndex()
	{
        $role_id = Session::get('role_id');

        $user_id = Session::get('UID');

        $output = $this->product->getCustomerSampleList($role_id,$user_id);
    
        return view('sample.customer_sample_index',compact('output'));
    }
    
    public function vendorSampleIndex()
    {
        $output = $this->product->getVendorSampleList();

        return view('sample.vendor_sample_index',compact('output'));
    }

    public function addSample()
    {
        return view('sample.add_sample_index');
    }

    public function showSample(Request $request)
    {
        $sampleId = ($request->segment(4));
        //dd($sampleId);
        $output = $this->product->getCustomerSampleInfoBySampleId($sampleId);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();
        //dd($output);

        return view('sample.customer_sample_edit',compact('output','product','method','uom'));
    }

    public function saveSampleRequest(Request $request)
    {
        $user_id = Session::get('UID');
      // dd($user_id);

        $request->validate([
                'full_name' => 'required',
                'mobile' => ['required', 'digits:10'],
                'email' => 'required|email',
                'address' => 'required',
            ]
        );

        if(request('sample_attacment'))
        {
            $request->validate([
                'sample_attacment' => 'mimes:jpeg,png,jpg,pdf|max:2048',
                ]
            );
        }

        $sample_attacment = request('sample_attacment');

        if($sample_attacment)
        {
            $imageName = time().'.'.request()->sample_attacment->getClientOriginalExtension();

            request()->sample_attacment->move(storage_path() . '/sample', $imageName);
        }
        else
        {
            $imageName ='';
        }
        
        $type="CUSTOMER";

        $samplerequestDay = request('samplerequestDay');
        $samplerequestMonth = request('samplerequestMonth');
        $samplerequestyear = request('samplerequestyear');

        $sampledeliveryDay = request('sampledeliveryDay');
        $sampledeliveryMonth = request('sampledeliveryMonth');
        $sampledeliveryyear = request('sampledeliveryyear');

        $behalf_of = request('behalf_of');

        $full_name = request('full_name');
        $mobile = request('mobile');
        $email = request('email');
        $address = request('address');
       
        $sample_table_product_code = request('product_name');
        $sample_table_product_method = request('product_method');
        $sample_table_product_qty = request('product_qty');
        $sample_table_product_uom = request('product_uom');


        $sample_request_master = $this->product->saveSampleRequestMaster($type,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear,$behalf_of,$user_id);

        $sample_details = $this->product->saveSampleRequestDetails($full_name,$mobile,$email,$address,$imageName);

        $sample_items_details = $this->product->saveSampleItemDetails($sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        //echo "Saved";
        $role_id = Session::get('role_id');
        
        $user_id = Session::get('UID');

        $output = $this->product->getCustomerSampleList($role_id,$user_id);
    
        return view('sample.customer_sample_index',compact('output'));
    }

    
    public function editSampleRequest(Request $request)
    {
        $user_id = Session::get('UID');
        // dd($request->all);
        // $address = request('address');
        // dd($address);

        $request->validate([
            'full_name' => 'required',
            'mobile' => ['required', 'digits:10'],
            'email' => 'required|email',
            'address' => 'required',
        ]);

        if(request('sample_attacment'))
        {
            $request->validate([
                'sample_attacment' => 'mimes:jpeg,png,jpg,pdf|max:2048',
                ]
            );
        }

        $sample_attacment = request('sample_attacment');

        if($sample_attacment)
        {
            $imageName = time().'.'.request()->sample_attacment->getClientOriginalExtension();

            request()->sample_attacment->move(storage_path() . '/sample', $imageName);
        }
        else
        {
            $imageName ='';
        }
         
        $sampleId = request('sampleId');

        $samplerequestDay = request('samplerequestDay');
        $samplerequestMonth = request('samplerequestMonth');
        $samplerequestyear = request('samplerequestyear');

        $sampledeliveryDay = request('sampledeliveryDay');
        $sampledeliveryMonth = request('sampledeliveryMonth');
        $sampledeliveryyear = request('sampledeliveryyear');

        $behalf_of = request('behalf_of');

        $full_name = request('full_name');
        $mobile = request('mobile');
        $email = request('email');
        $address = request('address');
       
        $sample_table_product_code = request('product_name');
        $sample_table_product_method = request('product_method');
        $sample_table_product_qty = request('product_qty');
        $sample_table_product_uom = request('product_uom');


        $sample_request_master = $this->product->editSampleRequestMaster($sampleId,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear,$behalf_of,$user_id);

        $sample_details = $this->product->editSampleRequestDetails($sampleId,$full_name,$mobile,$email,$address,$imageName);

        $sample_items_details = $this->product->editSampleItemDetails($sampleId,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        // $role_id = Session::get('role_id');
        
        // $user_id = Session::get('UID');

        // $output = $this->product->getCustomerSampleList($role_id,$user_id);
    
        // return view('sample.customer_sample_index',compact('output'));
        $data['message'] ='Customer Sample edit Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
    }

    public function ReadyForDispatch(Request $request)
    {
        $sampleId = $request->segment(4);

        $output = $this->product->getCustomerSampleInfoBySampleId($sampleId);
        // dd($output);

        $BMR_details = $this->production->getBMRDetailsBySampleID($sampleId);

        $QC_details = $this->qc->getQCDetailsBySampleID($sampleId);

        return view('sample.customer_sample_dispatch',compact('output','BMR_details','QC_details'));
    }

    public function proceedForDispatch(Request $request)
    {
        $sampleId = request('sampleId');

        $readyForDispatch = request('readyForDispatch');

        $user_id = Session::get('UID');

        $status = 'CUSTOMER_SAMPLE_READY_FOR_DISPATCH';

        $output = $this->product->proceedForDispatch($sampleId,$user_id,$status);

        $data['message'] ='QC Details Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
        //dd("Sample Id -".$sampleId.'-readyForDispatch'.$readyForDispatch);
    }

    public function addVendorSample()
    {
        //$user_id = Session::get('UID');

         return view('sample.add_vendor_sample_index');
    }


    public function saveVendorSample(Request $request)
    {
         $user_id = Session::get('UID');
      // dd($user_id);

        $request->validate([
                'full_name' => 'required',
                'mobile' => ['required', 'digits:10'],
                'email' => 'required|email',
                'address' => 'required',
            ]
        );

        if(request('sample_attacment'))
        {
            $request->validate([
                'sample_attacment' => 'mimes:jpeg,png,jpg,pdf|max:2048',
                ]
            );
        }

        $sample_attacment = request('sample_attacment');

        if($sample_attacment)
        {
            $imageName = time().'.'.request()->sample_attacment->getClientOriginalExtension();

            request()->sample_attacment->move(storage_path() . '/sample', $imageName);
        }
        else
        {
            $imageName ='';
        }
        
        $type="VENDOR";

        $samplerequestDay = request('samplerequestDay');
        $samplerequestMonth = request('samplerequestMonth');
        $samplerequestyear = request('samplerequestyear');

        $samplereceivedDay = request('samplereceivedDay');
        $samplereceivedMonth = request('samplereceivedMonth');
        $samplereceivedyear = request('samplereceivedyear');

        $behalf_of = request('behalf_of');

        $full_name = request('full_name');
        $mobile = request('mobile');
        $email = request('email');
        $address = request('address');
       
        $sample_table_product_code = request('product_name');
        $sample_table_product_method = request('product_method');
        $sample_table_product_qty = request('product_qty');
        $sample_table_product_uom = request('product_uom');


        $sample_request_master = $this->product->saveVendorSampleRequestMaster($type,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$samplereceivedDay,$samplereceivedMonth,$samplereceivedyear,$behalf_of,$user_id);

        $sample_details = $this->product->saveVendorSampleRequestDetails($full_name,$mobile,$email,$address,$imageName);

        $sample_items_details = $this->product->saveVendorSampleItemDetails($sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        //echo "Saved";

        $data['message'] ='Vendor Sample Information Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
    }

    public function showVendorSample(Request $request)
    {
        $sampleId = ($request->segment(4));

        $output = $this->product->getVendorSampleInfoBySampleId($sampleId);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();
        //dd($output);
        return view('sample.vendor_sample_edit',compact('output','product','method','uom'));
    }


    public function editVendorSample(Request $request)
    {
        $user_id = Session::get('UID');
        
        $request->validate([
            'full_name' => 'required',
            'mobile' => ['required', 'digits:10'],
            'email' => 'required|email',
            'address' => 'required',
        ]);

        if(request('sample_attacment'))
        {
            $request->validate([
                'sample_attacment' => 'mimes:jpeg,png,jpg,pdf|max:2048',
                ]
            );
        }

        $sample_attacment = request('sample_attacment');

        if($sample_attacment)
        {
            $imageName = time().'.'.request()->sample_attacment->getClientOriginalExtension();

            request()->sample_attacment->move(storage_path() . '/sample', $imageName);
        }
        else
        {
            $imageName ='';
        }
         
        $sampleId = request('sampleId');

        $samplerequestDay = request('samplerequestDay');
        $samplerequestMonth = request('samplerequestMonth');
        $samplerequestyear = request('samplerequestyear');

        $samplereceivedDay = request('samplereceivedDay');
        $samplereceivedMonth = request('samplereceivedMonth');
        $samplereceivedyear = request('samplereceivedyear');

        $behalf_of = request('behalf_of');

        $full_name = request('full_name');
        $mobile = request('mobile');
        $email = request('email');
        $address = request('address');
       
        $sample_table_product_code = request('product_name');
        $sample_table_product_method = request('product_method');
        $sample_table_product_qty = request('product_qty');
        $sample_table_product_uom = request('product_uom');

        $sample_request_master = $this->product->editVendorSampleRequestMaster($sampleId,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$samplereceivedDay,$samplereceivedMonth,$samplereceivedyear,$behalf_of,$user_id);

        $sample_details = $this->product->editVendorSampleRequestDetails($sampleId,$full_name,$mobile,$email,$address,$imageName);

        $sample_items_details = $this->product->editVendorSampleItemDetails($sampleId,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        $data['message'] ='Vendor Sample edit Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
    }

    public function saveVendorSampleInformation(Request $request)
    {
        $sampleId = $request->segment(4);

        $output = $this->product->getVendorSampleInfoBySampleId($sampleId);

        $QC_details = $this->qc->getQCDetailsBySampleID($sampleId);

        //dd($QC_details);

        return view('sample.vendor_sample_information',compact('output','QC_details'));
    }

    public function proceedVendorSampleTOStore(Request $request)
    {
        $sampleId = request('sampleId');

        $readyForDispatch = request('readyForDispatch');

        $user_id = Session::get('UID');

        $status = 'VENDOR_SAMPLE_RECEIVED_IN_STORE';

        $output = $this->product->proceedForDispatch($sampleId,$user_id,$status);

        $data['message'] ='QC Details Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
        //dd("Sample Id -".$sampleId.'-readyForDispatch'.$readyForDispatch);
    }

}