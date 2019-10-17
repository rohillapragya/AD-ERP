<?php

namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Users 
{
    var $id;
	var $info;
	var $session;
	
    function __construct()
	{
		$this->info = null;

        $this->created_at =  date("Y/m/d");
	}
    
    function doLogin($email,$password)
    {
        $output = DB::select("select * from user_auth a,user_master b where a.auth_key='$email' and a.auth_value='$password' and a.user_id=b.id and b.is_active='Y'");
        
        return $output;
    }

    function changePassword($email,$password)
    {
      //  $output = DB::select("select count(*) as total from user_auth where auth_key='$email'");
        $output = DB::select("select count(*) as total from user_auth a,user_master b where a.auth_key='$email' and a.user_id=b.id and b.is_active='Y'");
        //return json_decode(json_encode($output), true);
        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $totalEmailCount=$value['total'];
        }

        if($totalEmailCount==0)
        {
            $mess = 'ERR';
        }
        else
        {
           // $res = DB::table('user_auth')->where('auth_key', '$email')->update(['auth_value' => '$password']);
            DB::update("update user_auth set auth_value = '$password' where auth_key ='$email'");
            $mess = 'OK';
        }
        return $mess;
    }

    function populate($email)
    {
        $out = DB::select("select distinct a.id as user_id,b.first_name,b.last_name,d.id as role_id,d.name as role_name  from user_auth a,user_master b,app_user_role_map c,app_role_master d  where a.auth_key='$email' and a.user_id=b.id and a.user_id=c.user_id and c.role_id=d.id and b.is_active='Y'");

        Session::put('EMAIL',$email);

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
           // $totalEmailCount=$value['total'];
            Session::put('UID',$value['user_id']);
            Session::put('full_name',$value['first_name'].' '.$value['last_name']);
            Session::put('role_name',$value['role_name']); 
            Session::put('role_id',$value['role_id']);
        }

    }
}
