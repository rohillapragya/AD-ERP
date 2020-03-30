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

    // function populate($email,$role_id)
    // {
    //     $out = DB::select("select distinct a.user_id as user_id,b.first_name,b.last_name,d.id as role_id,d.name as role_name  from user_auth a,user_master b,app_user_role_map c,app_role_master d  where a.auth_key='$email' and a.user_id=b.id and a.user_id=c.user_id and c.role_id=d.id and b.is_active='Y'");

    //     Session::put('EMAIL',$email);

    //     $result = json_decode(json_encode($out), true);
    //     foreach ($result as $key => $value) 
    //     {
    //        // $totalEmailCount=$value['total'];
    //         Session::put('UID',$value['user_id']);
    //         Session::put('full_name',$value['first_name'].' '.$value['last_name']);
    //         Session::put('role_name',$value['role_name']); 
    //         Session::put('role_id',$value['role_id']);

    //         $this->user_id = $value['user_id'];
    //     }

    //     if($role_id >0) // 0 means no role..If user have multiple role will select role from drop down list
    //     {
    //         Session::put('role_id',$role_id);

    //         $out = DB::select("select * from app_role_master where id='$role_id'");
    //          $result = json_decode(json_encode($out), true);
    //         foreach ($result as $key => $value) 
    //         {
    //             Session::put('role_name',$value['name']); 
    //             Session::put('role_id',$value['id']);
    //         }
    //     }

    //     if($role_id=='3' || $role_id=='5' || $role_id=='7')
    //     {
    //         $this->createCart();
    //     }
    // }



    function populate($email)
    {
        $out = DB::select("select distinct a.user_id as user_id,b.first_name,b.last_name,d.id as role_id,d.name as role_name  from user_auth a,user_master b,app_user_role_map c,app_role_master d  where a.auth_key='$email' and a.user_id=b.id and a.user_id=c.user_id and c.role_id=d.id and b.is_active='Y'");

        Session::put('EMAIL',$email);

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
           // $totalEmailCount=$value['total'];
            Session::put('UID',$value['user_id']);
            Session::put('full_name',$value['first_name'].' '.$value['last_name']);
            // Session::put('role_name',$value['role_name']); 
            // Session::put('role_id',$value['role_id']);

            $this->user_id = $value['user_id'];
        }

        
        if($this->isUserHavingDeveloperRole($email)==1)
        {
            Session::put('role_id','1');
        } 
        else
        {
           if($this->isUserHavingSuperAdminRole($email)==1)
           {
                Session::put('role_id','2');
           } 
           else
           {
                Session::put('role_id','0'); //  role id 0 means their are no role
           }
            
        }    

        return $this->checkUserEmailRegisteredLocation($this->user_id);  

        // if($role_id=='3' || $role_id=='5' || $role_id=='7')
        // {
        //     $this->createCart();
        // }
    }

    function checkUserEmailRegisteredLocation($user_id)
    {
        $out = DB::select("select distinct a.location_id,b.location as location_name from app_user_menu_access_map a,app_location_master b where a.user_id='$user_id' and a.location_id=b.id and b.is_active='Y' order by location_name");

        return json_decode(json_encode($out), true);
    }

    function checkUseIDRegisteredLocation($user_id,$role_id)
    {
        if($role_id=='1' || $role_id=='2')
        {
           // $out = DB::select("select a.location_id,a.location_name,a.pre from (select '%' as location_id,'All' as location_name,'1' as pre from dual union select id as location_id,location as location_name,'2' as pre from app_location_master where is_active ='Y') a order by a.pre,a.location_name");
        
            $out = DB::select("select id as location_id,location as location_name from app_location_master where is_active ='Y' order by location_name");
        }
        else
        {
            $out = DB::select("select distinct a.location_id,b.location as location_name from app_user_menu_access_map a,app_location_master b where a.user_id='$user_id' and a.location_id=b.id and b.is_active='Y' order by location_name");
        }

        return json_decode(json_encode($out), true);
    }


    function userAllocatedLocation($user_id,$role_id)
    {
        if($role_id=='1' || $role_id=='2')
        {
           $out = DB::select("select a.location_id,a.location_name,a.pre from (select '%' as location_id,'All' as location_name,'1' as pre from dual union select id as location_id,location as location_name,'2' as pre from app_location_master where is_active ='Y') a order by a.pre,a.location_name");
        
           // $out = DB::select("select id as location_id,location as location_name from app_location_master where is_active ='Y' order by location_name");
        }
        else
        {
            $out = DB::select("select distinct a.location_id,b.location as location_name from app_user_menu_access_map a,app_location_master b where a.user_id='$user_id' and a.location_id=b.id and b.is_active='Y' order by location_name");
        }

        return json_decode(json_encode($out), true);
    }


    function isUserHavingDeveloperRole($email)
    {
        // role id 1 is for Developer option. Developer having all modules access

        $out = DB::select("select count(*) as total from user_auth a,user_master b,app_user_role_map c where a.auth_key='$email' and a.user_id=b.Id and b.is_active='Y' and a.user_id=c.user_id and c.role_id='1'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $developerRoleCount = $value['total'];
        }

        return $developerRoleCount;
    }


    function isUserHavingSuperAdminRole($email)
    {
        // role id 1 is for Developer option. Developer having all modules access

        $out = DB::select("select count(*) as total from user_auth a,user_master b,app_user_role_map c where a.auth_key='$email' and a.user_id=b.Id and b.is_active='Y' and a.user_id=c.user_id and c.role_id='2'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $superAdminRoleCount = $value['total'];
        }

        return $superAdminRoleCount;
    }


    // function createCart()
    // {
    //     $maxCartId = $this->maxCartId();

    //     DB::insert("insert into user_cart(id,user_id,status,created_at) values('$maxCartId','$this->user_id','PENDING','$this->created_at')");

    //     Session::put('cart_id',$maxCartId);
    // }


    function createCart($user_id)
    {
        $maxCartId = $this->maxCartId();

        DB::insert("insert into user_cart(id,user_id,status,created_at) values('$maxCartId','$user_id','PENDING','$this->created_at')");

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
            if($role_id=='1' || $role_id=='2' || $role_id=='3')
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

    function gettingUserAllocatedRouteByLocationID($user_id,$locationId)
    {
        $out = DB::select("select distinct c.url from app_user_menu_access_map a, app_menu_url_map b,app_urls c where a.user_id='$user_id' and a.location_id='$locationId' and a.is_active='Y' and a.menu_url_map_id=b.menu_id and b.url_id = c.id");

        return json_decode(json_encode($out), true);
    }

    function isUserLocationHavingAdministratorAccess($user_id,$locationId)
    {
        /* Role id 3 for Adminsitrator role. Using this will able to check  whether user role along with location having  Administrator access or not*/

        $out = DB::select("select count(*) as total from app_user_menu_access_map where user_id='$user_id' and location_id='$locationId' and role_id ='3'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $count = $value['total'];

            if($count=='1'){ $isUserLocationHavingAdministratorRole = 'Y';}
            else { $isUserLocationHavingAdministratorRole = 'N';}
        }

        return $isUserLocationHavingAdministratorRole;
    }


    function isUserHavingSalesExecutive($user_id)
    {
        /*Role Id 5 for Sales Executive*/

        $out = DB::select("select count(*) as total from app_user_role_map where user_id='$user_id' and role_id='5'");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $count = $value['total'];

            if($count > 0){ $isUserHavingSalesExecutiveRole = 'Y';}
            else { $isUserHavingSalesExecutiveRole = 'N';}
        }

        return $isUserHavingSalesExecutiveRole;
    }



    function isUserLocationHavingOperationAdminAccess($user_id,$locationId)
    {
        /* Role id 3 for Adminsitrator role. Using this will able to check  whether user role along with location having  Administrator access or not*/

        $out = DB::select("select count(*) as total from app_user_menu_access_map where user_id='$user_id' and location_id='$locationId' and role_id ='7'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $count = $value['total'];

            if($count=='1'){ $isUserLocationHavingOperationAdminRole = 'Y';}
            else { $isUserLocationHavingOperationAdminRole = 'N';}
        }

        return $isUserLocationHavingOperationAdminRole;
    }


}