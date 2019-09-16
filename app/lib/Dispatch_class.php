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

    function getDispatchServiceList()
    {
        $out = DB::select("select * from dispatch_service_master order by id");
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

    function saveService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$user_id)
    {
        $id = $this->maxDispatchServiceMasterId();

        $out = DB::insert("insert into dispatch_service_master(id,name,email,mobile,is_active,created_at,created_by) values('$id','$dispatch_full_name','$dispatch_email','$dispatch_mobile','Y','$this->created_at','$user_id')");
    }

    function serviceDetailsByServiceId($servicId)
    {
      
        $out = DB::select("select * from dispatch_service_master where id='$servicId'");

        return json_decode(json_encode($out), true);
    }

    function editService($dispatch_full_name,$dispatch_mobile,$dispatch_email,$dispatchId)
    {
        DB::update("update dispatch_service_master set name = '$dispatch_full_name',email = '$dispatch_email',mobile = '$dispatch_mobile' where id ='$dispatchId'");
    }

    function getDispatchPendingList()
    {
        $out = DB::select("select a.id as sample_id,a.sample_number as sample_number,a.type as type,a.request_date as request_date,'Sample' as dispatch_type,b.description as status from sample_master a,process_status b where a.status in ('CUSTOMER_SAMPLE_READY_FOR_DISPATCH','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER') and a.status=b.status");
        
        return json_decode(json_encode($out), true);
    }

    // function getDispatchServiceList()
    // {
    //     $out = DB::select("select * from dispatch_service_master");

    //     return json_decode(json_encode($out), true);
    // }
}