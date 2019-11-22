<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class cron_job_email 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function maxUserCronEmailId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_cron_email");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
        
            return $value['max_id'];
        }
    }

    function save($user_id,$reference_type,$status,$referenceId)
    {
        $maxUserCronEmailId = $this->maxUserCronEmailId();

        $out = DB::insert("insert into user_cron_email (id,user_id,reference_type,status,reference_id,created_at) values('$maxUserCronEmailId','$user_id','$reference_type','$status','$referenceId','$this->created_at')");
    }
}

