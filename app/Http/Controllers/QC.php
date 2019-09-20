<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\QC_class;

class QC extends Controller
{
    public function __construct(QC_class $qc) 
    {
        $this->qc = $qc;
    }
 
    public function pendingQCDetailList()
    {
        $output = $this->qc->pendingQCDetailList();

       return view('qc.pending_qc_details',compact('output'));
    }
   
    public function ReadyForQCDetails(Request $request)
    {
        $sampleId = $request->segment(4);

        $output = $this->qc->getCustomerQCInfoBySampleId($sampleId);

       //dd($output);
        return view('qc.customer_sample_qc_details',compact('output'));
    }


    public function saveQCDetails(Request $request)
    {
        $user_id = Session::get('UID');

        $sampleId = request('sampleId');

        $qcTestResult = request('qcTestResult');

        $qc_remarks = request('qc_remarks');

        $qc_table_document_name = request('document_name');

        $qc_table_document_number = request('document_number');

        $output = $this->qc->saveQCDetails($sampleId,$qc_remarks,$qc_table_document_name,$qc_table_document_number,$user_id,$qcTestResult);

        $data['message'] ='QC Details Added Successfully. Go to  Dashboard using button';

        return view('dashboard_return.success',$data);
    }

}
