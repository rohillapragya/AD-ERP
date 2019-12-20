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
    var $user_id;
    var $cart_id;
	
    function __construct()
	{
		$this->info = null;

        $this->created_at =  date("Y/m/d");

        $this->user_id='';

        $this->cart_id='';
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

    function populate($email,$role_id)
    {
        $out = DB::select("select distinct a.user_id as user_id,b.first_name,b.last_name,d.id as role_id,d.name as role_name  from user_auth a,user_master b,app_user_role_map c,app_role_master d  where a.auth_key='$email' and a.user_id=b.id and a.user_id=c.user_id and c.role_id=d.id and b.is_active='Y'");

        Session::put('EMAIL',$email);

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
           // $totalEmailCount=$value['total'];
            Session::put('UID',$value['user_id']);
            Session::put('full_name',$value['first_name'].' '.$value['last_name']);
            Session::put('role_name',$value['role_name']); 
            Session::put('role_id',$value['role_id']);

            $this->user_id = $value['user_id'];
        }

        if($role_id >0) // 0 means no role..If user have multiple role will select role from drop down list
        {
            Session::put('role_id',$role_id);

            $out = DB::select("select * from app_role_master where id='$role_id'");
             $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                Session::put('role_name',$value['name']); 
                Session::put('role_id',$value['id']);
            }
        }

        if($role_id=='3' || $role_id=='5' || $role_id=='7')
        {
            $this->createCart();
        }

        
    }


    function createCart()
    {
        $maxCartId = $this->maxCartId();

        DB::insert("insert into user_cart(id,user_id,status,created_at) values('$maxCartId','$this->user_id','PENDING','$this->created_at')");

        Session::put('cart_id',$maxCartId);
    }

    function maxCartId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_cart");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function gettingCustomerList($role_id,$user_id)
    {
        if($role_id)
        {
            if($role_id=='3')
            {
                $out = DB::select("select id,company_name from user_master where user_master_type='1' and is_active ='Y' order by company_name");
            }
            else
            {
                $out = DB::select("select id,company_name from user_master where user_master_type='1' and joined_by='$user_id'  and is_active ='Y' order by company_name");
            }
            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }
        
    }

    function checkRole($authKey)
    {
        $out = DB::select("select c.* from user_auth a,app_user_role_map b,app_role_master c where a.auth_key='$authKey' and a.user_id=b.user_id and b.role_id=c.id");

        return json_decode(json_encode($out), true);
    }
}