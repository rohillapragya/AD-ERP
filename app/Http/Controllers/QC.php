<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\QC_class;

use App\lib\Stock_class;

class QC extends Controller
{
    public function __construct(QC_class $qc,Stock_class $stock) 
    {
        $this->qc = $qc;

        $this->stock = $stock;
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


    public function StockReadyForQCDetails(Request $request)
    {
        $stockId = $request->segment(4);

        $output = $this->stock->gettingStockInfoByStockId($stockId);

        //dd($output);
        return view('qc.stock_qc_details',compact('output'));
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
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function qcStockInfoSave(Request $request)
    {
        $user_id = Session::get('UID');
        $stock_entry_id = request('stock_entry_id');
        $qcTestResult = request('qcTestResult');
        $qc_remarks = request('qc_remarks');
        $vendor_code = request('vendor_code');
        $vendor_betch_number = request('vendor_betch_number');
        $raw_material_betch_number = request('raw_material_betch_number');
        $r_d_betch_number = request('r_d_betch_number');

        $output = $this->qc->qcStockInfoSave($user_id,$stock_entry_id,$qcTestResult,$qc_remarks,$vendor_code,$vendor_betch_number,$raw_material_betch_number,$r_d_betch_number);

        $data['message'] ='QC Details Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

}
