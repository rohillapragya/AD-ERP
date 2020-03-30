<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class UserMonthlyTarget_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at = date("Y/m/d");
    }

    
    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";

        return date("Y/m/d", strtotime($odate));
    }

    function getSessionList()
    {
        $out = DB::select("select * from session_master");

        return json_decode(json_encode($out), true);
    }


    function maxUserMonthlyTargetMasterID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_monthly_target_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function maxUserMonthlyTargetDetailsID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_monthly_target_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function add($user_id,$session,$monthlyTargetDay,$monthlyTargetMonth,$monthlyTargetYear,$amount,$remark)
    {
        $targetDate = $this->string_to_date($monthlyTargetDay,$monthlyTargetMonth,$monthlyTargetYear);

        $out = DB::select("select COALESCE(monthly_target, 0 ) as amt from user_master where Id='$user_id'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $userMonthlyTarget = $value['amt'];
        } 

        $out1 = DB::select("select id,count(*) as total from user_monthly_target_master where session='$session' and user_id='$user_id'");

        $result1 = json_decode(json_encode($out1), true);
        foreach ($result1 as $key => $value) 
        {
            $userSessionCount = $value['total'];

            $userMonthlyTargetMaxID = $value['id'];
        }


        if($userSessionCount=='0')
        {
            // insert record in user_monthly_target_master table
            $maxUserMonthlyTargetMasterID = $this->maxUserMonthlyTargetMasterID();

            $out = DB::insert("insert into user_monthly_target_master(id,user_id,monthly_target,session,created_by,created_at) values('$maxUserMonthlyTargetMasterID','$user_id','$userMonthlyTarget','$session','$user_id','$this->created_at')");

            $user_monthly_target_master_id = $maxUserMonthlyTargetMasterID;
        }
        else
        {
            // update record in user_monthly_target_master table

            $out = DB::update("update user_monthly_target_master set monthly_target='$userMonthlyTarget',updated_by='$user_id',updated_at='$this->created_at' where id='$userMonthlyTargetMaxID'");

            $user_monthly_target_master_id = $userMonthlyTargetMaxID;
        }

        $maxUserMonthlyTargetDetailsID = $this->maxUserMonthlyTargetDetailsID();

        $o = DB::insert("insert into user_monthly_target_details(id,user_monthly_target_master_id,target_amt,target_date,created_by,created_at,remarks) values ('$maxUserMonthlyTargetDetailsID','$user_monthly_target_master_id','$amount','$targetDate','$user_id','$this->created_at','$remark')");
    }

    function getUserWiseMonthlyDetails($userId)
    {
        $out = DB::select("select * from user_monthly_target_master a,user_monthly_target_details b where a.id=b.user_monthly_target_master_id  and a.created_by='$userId' order by session, a.created_at");

        return json_decode(json_encode($out), true);
    }

    function getReport($se_value,$session_value,$fromDay_value,$fromMonth_value,$fromYear_value,$toDay_value,$toMonth_value,$toYear_value)
    {
        $strQuery = ' and 1 = 1 ';

        if(($fromDay_value!='%') && ($fromMonth_value!='%') && ($fromYear_value!='%') && ($toDay_value!='%') && ($toMonth_value!='%') && ($toYear_value!='%') )
        {
            $formDate = $this->string_to_date($fromDay_value,$fromMonth_value,$fromYear_value);

            $toDate = $this->string_to_date($toDay_value,$toMonth_value,$toYear_value);

            $strQuery.= " and b.target_date between '$formDate' and '$toDate'";
        }

        if($se_value !='%')
        {
            $strQuery.=" and a.user_id ='$se_value'";
        }

        if($session_value !='%')
        {
            $strQuery.= " and a.session='$session_value'";
        }

        $out = DB::select("select a.*,b.*,c.first_name,c.last_name from user_monthly_target_master a,user_monthly_target_details b,user_master c where  a.id=b.user_monthly_target_master_id and a.created_by=c.Id $strQuery order by c.first_name,c.last_name,a.created_at");

        return json_decode(json_encode($out), true);
    }
    
}