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
        $user_master_type = '2'; // 2 user_master_type is 2 only. 1 - Customer, 3 vendor

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

    function getVendorList()
    {
        // user_master_type 3 for vendor type.. 1 for Customer, 2 for user 
        $out = DB::select("select * from user_master where user_master_type='3'");

        return json_decode(json_encode($out), true);
    }

    function getCountyList()
    {
        //$out = DB::select("select * from country_master where id in ('101','1','18','44','116')");

        $out = DB::select("select * from country_master where id in ('101')");

        return json_decode(json_encode($out), true);
    }

    function getStateList($country_id)
    {
        $out = DB::select("select * from state_master where country_id='$country_id'");

        return json_decode(json_encode($out), true);
    }

    function getCityList($state_id)
    {
        $out = DB::select("select * from city_master where state_id='$state_id'");

        return json_decode(json_encode($out), true);
    }

    function getTypeOfTheBusiness()
    {
        $out = DB::select("select * from business_type_master");

        return json_decode(json_encode($out), true);
    }

    function getBusniessActivity()
    {
        $out = DB::select("select * from business_activity_master");

        return json_decode(json_encode($out), true);
    }

    function getUserContactInformationMaster()
    {
        $out = DB::select("select * from user_contact_information_master order by type");

        return json_decode(json_encode($out), true);
    }


    function maxUserCompanyInformation()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_company_information");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxUserCompanyBusinessTypaMap()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_company_business_type_map");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxUserCompanyBusinessActivityMap()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_company_business_activity_map");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveVendor($joined_id,$name_of_business,$name_address_vendor_code,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$contact_information_type,$contact_information_first_name,$contact_information_last_name,$contact_information_email,$contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail)
    {
        $user_master_type = '3'; // here user type is vendoruser_master_type

        $maxUserMasterId = $this->maxUserMasterId();

        $first_last_name ='Vendor';

        // DB::insert("insert into user_master(id,first_name,last_name,address,city_code,pin_code,email,mobile,pan_no,cin_no,gst_no,user_master_type,joined_by,company_name,is_active,user_master_type_code) values('$maxUserMasterId','$first_last_name','$first_last_name','$name_address_address','$name_address_business_city_name','$name_address_pin','$name_address_email','$name_address_mobile','$name_address_pan_no','$name_address_cin_no','$name_address_gstn_no','$user_master_type','$joined_id','$name_of_business','Y','$name_address_vendor_code')");

        // $max_user_company_info_id = $this->maxUserCompanyInformation();
        // $maxUserCompanyBusinessActivityMapID = $this->maxUserCompanyBusinessActivityMap();
        $primary_products ='';

        foreach ($company_information_primary_product as $product_key => $product_value) {

            $primary_products =$primary_products.",".$product_value;
        }

        $primary_products = ltrim($primary_products,",");

        // DB::insert("insert into user_company_information(id,user_id,business_since,primary_product,parent_company_name,primary_mobile_number,primary_email) values('$max_user_company_info_id','$maxUserMasterId','$in_business_since','$primary_products','$company_information_parent_company','$primary_conatct_mobile','$primary_conatct_email')");

        $max_user_company_info_id='1';

        for ($i=0; $i < count($company_information_type_business); $i++) { 

            $maxUserCompanyBusinessTypaMapID = $this->maxUserCompanyBusinessTypaMap();

            $type = $company_information_type_business[$i];

            DB::insert("insert into user_company_business_activity_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaMapID','$type','$max_user_company_info_id')");
        }

      
    }

}