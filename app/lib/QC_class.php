<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class QC_class 
{
    var $id;
	var $info;
    var $session;
    var $sample_max_id;
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function pendingQCDetailList()
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

      // $out = DB::select("select * from (select c.description as customer_status,a.id,a.sample_number,a.type,a.request_date,a.received_date,a.delivered_date,a.status,a.any_behalf_of,a.source_at_team,b.id as sample_details_id,b.ref_name,b.ref_address,b.ref_mobile,b.ref_email,b.city,b.sample_response,b.status as sample_details_status  from sample_master a, sample_details b,process_status c  where a.status in ('CUSTOMER_SAMPLE_REQUEST','VENDOR_SAMPLE_RECEIVED') and a.id =b.sample_id and a.status=c.status) sample where sample.id not in (select object_id from qc_details where object_type='SAMPLE')");

        $out = DB::select("select * from (select * from (select 'SAMPLE' as req_type,c.description as customer_status,a.id,a.sample_number,a.type,a.request_date,a.delivered_date from sample_master a, sample_details b,process_status c where a.status in ('CUSTOMER_SAMPLE_REQUEST','VENDOR_SAMPLE_RECEIVED') and a.id =b.sample_id and a.status=c.status) sample where sample.id not in (select object_id from qc_details where object_type='SAMPLE') union select 'STOCK' as req_type,'--' as customer_status,id,'--' as number,'--' as type,entry_date,created_at from stock_entry where vendor_batch_number is null or raw_material_batch_number is null or r_d_batch_number is null) sample");
        
        return json_decode(json_encode($out), true);
    }

    function getCustomerQCInfoBySampleId($sampleId)
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

       $out = DB::select("select g.first_name as user_first_name,g.last_name as user_last_name, e.name as method_name,f.name as uom_name,a.*,b.*,c.*,d.* from sample_master a,sample_details b, sample_items_details c,product_master d,product_method_master e,UOM_master f,user_master g  where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id and c.item_code=d.code and c.method=e.id and c.uom=f.id and a.created_by=g.id and g.is_active='Y'");
        
        return json_decode(json_encode($out), true);
    }

    function saveQCDetails($sampleId,$qc_remarks,$qc_table_document_name,$qc_table_document_number,$user_id,$qcTestResult)
    {
        $this->created_by = $user_id;

        $output = DB::select("select type from sample_master where id='$sampleId'");
        $result = json_decode(json_encode($output), true);

        foreach ($result as $key => $value) {
            $totalEmailCount=$value['type'];
        }

        if($totalEmailCount=='CUSTOMER'){
            $type = 'CUSTOMER';
        }

        else  {
           $type='VENDOR';
        }



        if($qcTestResult=="PASS") { $status = $type.'_SAMPLE_STATUS_PASS_QC_TEAM'; }

        else {   $status = $type.'_SAMPLE_STATUS_FAIL_QC_TEAM';  }

        $countTable = count($qc_table_document_name);

        foreach ($qc_table_document_name as $key_code => $value_code) {
            $document_name[] = $value_code['document_name'];
        }

        foreach ($qc_table_document_number as $key_method => $value_method) {
            $document_number[] = $value_method['document_number'];
        } 

        for($i=0;$i<$countTable;$i++)
        {
            $id = $this->maxQcDetailsId();

            $doc_name = $document_name[$i];
       
            $doc_number = $document_number[$i];
        
            $out = DB::insert("insert into qc_details (id,object_type,object_id,status,document_name,document_value,created_at,created_by) values('$id','SAMPLE','$sampleId','$status','$doc_name','$doc_number','$this->created_at','$this->created_by')");
        }

        $sampleQcRemarksDetails = $this->maxQcRemarksDetailsId();
        
        $out_1 = DB::insert("insert into qc_remarks_details(id,qc_ref_id,remarks,updated_at,updated_by,qc_ref_type,qc_test_result) values('$sampleQcRemarksDetails','$sampleId','$qc_remarks','$this->created_at','$this->created_by','SAMPLE','$qcTestResult')");
    }

    function maxQcDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from qc_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxQcRemarksDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from qc_remarks_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function getQCDetailsBySampleID($sampleId)
    {
        $out = DB::select("select * from qc_details a,qc_remarks_details b,process_status c where a.object_type='SAMPLE' and a.object_id='$sampleId' and a.object_id=b.qc_ref_id and a.status=c.status");

        return json_decode(json_encode($out), true);
    }

    function qcStockInfoSave($user_id,$stock_entry_id,$qcTestResult,$qc_remarks,$vendor_code,$vendor_betch_number,$raw_material_betch_number,$r_d_betch_number)
    {
        $status = 'STOCK_BATCH_INFORMATION_UPDATED_BY_QC_TEAM';

        $id = $this->maxQcDetailsId();
        $out = DB::insert("insert into qc_details (id,object_type,object_id,status,document_name,document_value,created_at,created_by) values('$id','STOCK','$stock_entry_id','$status','VENDOR_BETCH_NUMBER','$vendor_betch_number','$this->created_at','$user_id')");

        $id = $this->maxQcDetailsId();
        $out = DB::insert("insert into qc_details (id,object_type,object_id,status,document_name,document_value,created_at,created_by) values('$id','STOCK','$stock_entry_id','$status','RAW_MATERIAL_BETCH_NUMBER','$raw_material_betch_number','$this->created_at','$user_id')");

        $id = $this->maxQcDetailsId();
        $out = DB::insert("insert into qc_details (id,object_type,object_id,status,document_name,document_value,created_at,created_by) values('$id','STOCK','$stock_entry_id','$status','R_D_BETCH_NUMBER','$r_d_betch_number','$this->created_at','$user_id')");
      

        $stockQcRemarksDetails = $this->maxQcRemarksDetailsId();
        
        $out_1 = DB::insert("insert into qc_remarks_details(id,qc_ref_id,remarks,updated_at,updated_by,qc_ref_type,qc_test_result) values('$stockQcRemarksDetails','$stock_entry_id','$qc_remarks','$this->created_at','$user_id','STOCK','$qcTestResult')");


        $o = DB::update("update stock_entry set vendor_code='$vendor_code',vendor_batch_number='$vendor_betch_number',raw_material_batch_number='$raw_material_betch_number',r_d_batch_number='$r_d_betch_number' where id='$stock_entry_id'");
    }
}
