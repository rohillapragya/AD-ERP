<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Dispatch_class 
{

    var $created_by;
	
    function __construct()
	{ 
        $this->created_at =  date("Y/m/d");
    }

    /*function getDispatchServiceList()
    {
        $out = DB::select("select * from dispatch_service_master order by name");
        return json_decode(json_encode($out), true);
    }*/


    function getDispatchServiceList($location_id)
    {
        //$out = DB::select("select * from dispatch_service_master order by name");
        $str = ' 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            $out = DB::select("select * from dispatch_service_master a where $str order by name");

            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }        

        return json_decode(json_encode($out), true);
    }


    function maxDispatchServiceMasterId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from dispatch_service_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$user_id,$location_id)
    {
        $id = $this->maxDispatchServiceMasterId();

        $out = DB::insert("insert into dispatch_service_master(id,name,email,mobile,is_active,created_at,created_by,location_id) values('$id','$dispatch_full_name','$dispatch_email','$dispatch_mobile','Y','$this->created_at','$user_id','$location_id')");
    }

    function serviceDetailsByServiceId($servicId)
    {
      
        $out = DB::select("select * from dispatch_service_master where id='$servicId'");

        return json_decode(json_encode($out), true);
    }

    function editService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$dispatchId,$user_id,$location_id)
    {
        DB::update("update dispatch_service_master set name = '$dispatch_full_name',email = '$dispatch_email',mobile = '$dispatch_mobile',location_id='$location_id',updated_at='$this->created_at',updated_by='$user_id' where id ='$dispatchId'");
    }

   /* function getDispatchPendingList()
    {
        //$out = DB::select("select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status");

        $out = DB::select("select * from (select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status union select a.inquiry_no as id,a.inquiry_no,'INQUIRY' as type,a.created_at as request_date,'Inquiry' as dispatch_type,b.description as status from purchase_indent a,process_status b where a.is_ready_for_pre_dispatch_docx_list='Y' and a.status=b.status) a");
        
        return json_decode(json_encode($out), true);
    }*/


    function getDispatchPendingList($location_id)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            $out = DB::select("select count(*) as total from sample_master a, sample_details b,process_status c  where a.status='VENDOR_SAMPLE_RECEIVED' and a.id =b.sample_id and a.status=c.status $str");

            $out = DB::select("select * from (select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status $str union select a.inquiry_no as id,a.inquiry_no,'INQUIRY' as type,a.created_at as request_date,'Inquiry' as dispatch_type,b.description as status from purchase_indent a,process_status b where a.is_ready_for_pre_dispatch_docx_list='Y' and a.status=b.status $str) a");

            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }        
    }


    // function getdispatchCount()
    // {
    //     $out = DB::select("select count(*) as total from (select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status union select a.inquiry_no as id,a.inquiry_no,'INQUIRY' as type,a.created_at as request_date,'Inquiry' as dispatch_type,b.description as status from purchase_indent a,process_status b where a.is_ready_for_pre_dispatch_docx_list='Y' and a.status=b.status) a");
        
    //     return json_decode(json_encode($out), true);
    // }


    function getdispatchCount($location_id)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            $out = DB::select("select count(*) as total from sample_master a, sample_details b,process_status c  where a.status='VENDOR_SAMPLE_RECEIVED' and a.id =b.sample_id and a.status=c.status $str");

            $out = DB::select("select count(*) as total from (select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status $str union select a.inquiry_no as id,a.inquiry_no,'INQUIRY' as type,a.created_at as request_date,'Inquiry' as dispatch_type,b.description as status from purchase_indent a,process_status b where a.is_ready_for_pre_dispatch_docx_list='Y' and a.status=b.status $str) a");

            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }        
    }



    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function maxDispatchDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from dispatch_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxDispatchAttachmentsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from dispatch_attachments");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveDispatchInfo($sampleId,$object_type,$user_id,$dispatchService,$dispatch_amount,$dispatchdateDay,$dispatchDateMonth,$dispatchDateyear,$deliverydateDay,$deliveryDateMonth,$deliveryDateyear,$dispatch_docx_number,$dispatchStatus,$docx_receipt_attacment,$dispatch_table_document_name,$location_id)
    {
       
        $getTypeOfDocName = gettype($dispatch_table_document_name);

       // dd($getTypeOfDocName);

        if($getTypeOfDocName=='array')
        {
            $dispatchDate =  $this->string_to_date($dispatchdateDay,$dispatchDateMonth,$dispatchDateyear);

            $deliveryDate = $this->string_to_date($deliverydateDay,$deliveryDateMonth,$deliveryDateyear);

            $maxDispatchDetailsId = $this->maxDispatchDetailsId();

            $out = DB::insert("insert into dispatch_details(id,object_type,object_id,service_id,status,amount,dispatch_date,delivery_date,dispatch_docx_num,dispatch_docx_receipt,created_at,created_by,location_id) values('$maxDispatchDetailsId','$object_type','$sampleId','$dispatchService','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER','$dispatch_amount','$dispatchDate','$deliveryDate','$dispatch_docx_number','$docx_receipt_attacment','$this->created_at','$user_id','$location_id')");

            DB::update("update sample_master set status = 'CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER',updated_at = '$this->created_at',updated_by = '$user_id' where id ='$sampleId'");

            $countTable = count($dispatch_table_document_name);

            foreach ($dispatch_table_document_name as $key_code => $value_code) {
                $document_name[] = $value_code['document_name'];
            }

            for($i=0;$i<$countTable;$i++)
            {
                $maxDispatchAttachmentsId = $this->maxDispatchAttachmentsId();

                $doc_name = $document_name[$i];
            
                $out = DB::insert("insert into dispatch_attachments (id,dispatch_details_id,attached_docx_name,created_at,created_by) values('$maxDispatchAttachmentsId','$maxDispatchDetailsId','$doc_name','$this->created_at','$user_id')");
            }
        }
    }

    function getDispatchDetails($object_type,$sampleId)
    {
        $out = DB::select("select * from dispatch_details a, dispatch_attachments b where a.object_id='$sampleId' and a.object_type='$object_type' and a.id=b.dispatch_details_id");

        return json_decode(json_encode($out), true);
    }

    function editDispatchInfo($sampleId,$object_type,$user_id,$dispatchStatus,$location_id)
    {
        if($object_type=='INQUIRY')
        {
            DB::update("update inquiry_master set status = 'CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER',modified_at = '$this->created_at',updated_by = '$user_id' where id ='$sampleId'");

            DB::update("update user_cart set status = 'CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER',updated_at = '$this->created_at',updated_by = '$user_id' where inquiry_number ='$sampleId'");

            DB::update("update dispatch_details set status = 'CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER',location_id='$location_id',updated_at='$this->created_at',updated_by='$user_id' where object_id ='$sampleId' and object_type='$object_type'");
        }
        else
        {
            DB::update("update sample_master set status = 'CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER',updated_at = '$this->created_at',updated_by = '$user_id' where id ='$sampleId'");

            DB::update("update dispatch_details set status = 'CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER',location_id='$location_id',updated_at='$this->created_at',updated_by='$user_id' where object_id ='$sampleId' and object_type='$object_type'");
        }
    }
}