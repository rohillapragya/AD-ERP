<?php

namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class User_Registration 
{
    var $id;
	var $info;
	var $session;
	
    function __construct()
	{
		$this->info = null;

        $this->created_at =  date("Y/m/d");
	}
    
   function getERPUserList()
   {
        $out = DB::select("select distinct a.id,a.first_name,a.last_name,a.offical_email,a.offical_mobile,a.email as personal_email,a.mobile as personal_mobile,a.is_active,c.name as role_name from user_master a,app_user_role_map b,app_role_master c where a.id=b.user_id and b.role_id in (3,4,5,7,8,9,10,11,12,13) and b.role_id=c.id and a.id not in ('1') order by id");

        return json_decode(json_encode($out), true);
   }

   function getRole()
   {
        // here role id 6 for customer. No need to add customer here for a particulars time

        $out = DB::select("select * from app_role_master where is_active='Y' and id not in ('5','6') order by name");

        return json_decode(json_encode($out), true);
   }

   function maxUserMasterId()
   {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
   }

    
    function maxUserAuthId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_auth");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveERPUser($first_name,$last_name,$offical_email,$offical_mobile,$personal_email,$personal_mobile,$erpuser_role,$password_erp_user,$created_by)
    {
        $user_master_type = '2';

        $maxUserMasterId = $this->maxUserMasterId();

        $maxUserAuthId = $this->maxUserAuthId();

        $q = DB::select("select count(*) as total from user_auth where auth_key='$offical_email'");

        $result = json_decode(json_encode($q), true);
        foreach ($result as $key => $value) 
        {
            $totalAuthEmailCount=$value['total'];
        }

        if($totalAuthEmailCount==0)
        {
            $out = DB::insert("insert into user_master(Id,first_name,last_name,email,mobile,joined_by,user_master_type,offical_email,offical_mobile,is_active,created_at) values('$maxUserMasterId','$first_name','$last_name','$personal_email','$personal_mobile','$created_by','$user_master_type','$offical_email','$offical_mobile','Y','$this->created_at')");

            $out_1 = DB::insert("insert into user_auth(id,user_id,auth_type,auth_key,auth_value) values('$maxUserAuthId','$maxUserMasterId',1,'$offical_email','$password_erp_user')");

            $out_2 = DB::insert("insert into app_user_role_map(user_id,role_id) values('$maxUserMasterId','$erpuser_role')");

            $mess = 'OK';
        }
        else
        {
            $mess = 'ERR';
        } 

        return $mess;      
    }

    function getERPUserInformation($erpUserId)
    {
        $out = DB::select("select * from user_master a,user_auth b,app_user_role_map c where a.id='$erpUserId' and a.id =b.user_id and a.id=c.user_id and a.is_active='Y'");

        return json_decode(json_encode($out), true);
    }

    function updateERPUser($erpuserid,$first_name,$last_name,$offical_mobile,$personal_email,$personal_mobile,$erpuser_role,$password_erp_user,$updated_by)
    {
        $out = DB::update("update user_master set first_name='$first_name',last_name='$last_name',email='$personal_email',mobile='$personal_mobile',offical_mobile='$offical_mobile',updated_at='$this->created_at',updated_by='$updated_by' where id='$erpuserid'");

        $out_1 = DB::update("update user_auth set updated_at='$this->created_at',auth_value='$password_erp_user' where user_id='$erpuserid'");

        $out_2 = DB::update("update app_user_role_map set role_id='$erpuser_role' where user_id='$erpuserid'");
    }

    function changeERPUserStatus($updated_by,$erpuserid,$status)
    {
        $out = DB::update("update user_master set is_active='$status',updated_at='$this->created_at',updated_by='$updated_by' where id='$erpuserid'");
    }
}