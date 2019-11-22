<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\PurchaseIndent_class;

use App\lib\Inquiry_class;

use App\lib\Product_class;

class PurchaseIndent extends Controller
{

    public function __construct(PurchaseIndent_class $purchase_indent,Inquiry_class $inquiry,Product_class $product) 
    {
        $this->purchase_indent = $purchase_indent;

        $this->inquiry = $inquiry;

        $this->product = $product;
    }
    
    public function index()
    {
        $output = $this->purchase_indent->showPendingInquiryList();

        return view('purchaseIndent.show_pending_inquiry',compact('output'));
    }

    public function showInquiryDetails(Request $request)
    {
        $InuiryNo = $request->segment(3);

        $output = $this->inquiry->showInquiryDetails($InuiryNo);

        //dd($output);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        return view('purchaseIndent.new',compact('product','method','uom','output'));
    }

    public function save(Request $request)
    {
        $inquiryNo = request('inquiryNo');

        $user_id = Session::get('UID');

        $product_name = request('product_name');

        $product_method = request('product_method');

        $product_qty = request('product_qty');

        $product_uom = request('product_uom');

        $output = $this->purchase_indent->savePI($inquiryNo,$user_id,$product_name,$product_method,$product_qty,$product_uom);

        $data['message'] ='Purchase Indent Added Successfully. Go to  Dashboard -> Purchase Indent for further Steps';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function action(Request $request)
    {
        $piID = $request->segment(2);

        $output = $this->purchase_indent->getPurchaseIndentDetails($piID);

        //dd($output);

        return view('purchaseIndent.action',compact('output'));
    }

    public function action_save(Request $request)
    {
        $user_id = Session::get('UID');

        $purchase_indent_id = request('purchase_indent_id');

        $piArranagemnetPossible = request('piArranagemnetPossible');

        $CustomerRequestForSample = request('CustomerRequestForSample');

        $pi_remark = request('pi_remark');

        if(request('proceedforDispatch')){
            $proceedforDispatch = request('proceedforDispatch');
        }
        else {
            $proceedforDispatch ='N';
        }
       

        $inquiry_number = request('inquiry_number');

        // print_r($purchase_indent_id);
        // print_r($piArranagemnetPossible);
        // print_r($CustomerRequestForSample);
        // print_r($remark);
        // print_r($proceedforDispatch);

        $output = $this->purchase_indent->action_save($user_id,$purchase_indent_id,$piArranagemnetPossible,$CustomerRequestForSample,$pi_remark,$proceedforDispatch,$inquiry_number);

        $data['message'] ='Purchase Indent Added Successfully. Go to  Dashboard -> Purchase Indent for further Steps';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function pi_to_SampleRequest(Request $request)
    {
        $pID = $request->segment(2);

        $output = $this->purchase_indent->getPurchaseIndentDetailsInfo($pID);

       // dd($output);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        return view('purchaseIndent.pi_to_sample',compact('pID','output','product','method','uom'));
    }

    public function pi_to_sample_save(Request $request)
    {
        $user_id = Session::get('UID');
      // dd($user_id);
        $pID = request('pID');
        //dd($pID);
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


        // log generation process 
        $module = "Customer Sample Request Add";
        $request_date = $samplerequestDay."-".$samplerequestMonth."-".$samplerequestyear;
        $delivery_date = $sampledeliveryDay."-".$sampledeliveryMonth."-".$sampledeliveryyear;
        $befalf_of = $behalf_of;
        $name = $full_name;
        $mobile = $mobile;
        $email = $email;
        $address = $address;

        $sample_request_master = $this->purchase_indent->saveSampleRequestMaster($type,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear,$behalf_of,$user_id);

        $sample_details = $this->purchase_indent->saveSampleRequestDetails($full_name,$mobile,$email,$address,$imageName);

        $sample_items_details = $this->purchase_indent->saveSampleItemDetails($sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        $out = $this->purchase_indent->updateSampleInPurchaseIndent($pID);

        $data['message'] ='Purchase Indent to Sample Saved Successfully. Go to  Dashboard Using Button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }
}