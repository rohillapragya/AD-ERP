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

    function IsCompanyExits($companyName)
    {
        //$out = DB::select("select a.joined_by,b.first_name,b.last_name,count(*) as total from user_master a,user_master b where a.company_name='$companyName' and a.user_master_type='1' and a.joined_by = b.id");
        $out = DB::select("select a.joined_by,b.first_name as joined_by_first_name,b.last_name as joined_by_last_name,a.company_name,count(*) as total from user_master a,user_master b where a.company_name=trim('$companyName') and a.user_master_type='1' and a.joined_by = b.id");
        return json_decode(json_encode($out), true);
    }

    function IsGSTNExits($gstn)
    {
        $out = DB::select("select a.company_name,count(*) as total from user_master a,user_master b where trim(a.gst_no)=trim('$gstn') and a.joined_by = b.id and a.user_master_type='1'");
        return json_decode(json_encode($out), true);
    }
    
   function getERPUserList()
   {
        $out = DB::select("select distinct a.id,a.first_name,a.last_name,a.offical_email,a.offical_mobile,a.email as personal_email,a.mobile as personal_mobile,a.is_active,c.name as role_name from user_master a,app_user_role_map b,app_role_master c where a.id=b.user_id and b.role_id in (3,4,5,7,8,9,10,11,12,13) and b.role_id=c.id and a.id not in ('1') order by id");

        return json_decode(json_encode($out), true);
   }

   function getRole()
   {
        // here role id 6 for customer. No need to add customer here for a particulars time

        $out = DB::select("select * from app_role_master where is_active='Y' and id not in ('9','6') order by name");

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
       // $out = DB::select("select * from user_master where user_master_type='3'");

        $out = DB::select("select a.*,b.name as city_name from user_master a,city_master b where a.user_master_type='3' and a.city_code=b.id");

        return json_decode(json_encode($out), true);
    }

    function getCountyList()
    {
        //$out = DB::select("select * from country_master where id in ('101','1','18','44','116')");

        $out = DB::select("select * from country_master where id in ('101')");

        return json_decode(json_encode($out), true);
    }

    function getCustomerCountyList()
    {
        $out = DB::select("select * from country_master where id in ('101','1','18','44','116')");

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

    function maxUserContactsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_contacts_information");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function maxUserBankReferenceId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_bank_reference");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxUserTradeReferenceId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_trade_reference");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function saveVendor($joined_id,$name_of_business,$name_address_vendor_code,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$table_contact_information_type,$table_contact_information_first_name,$table_contact_information_last_name,$table_contact_information_email,$table_contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail)
    {
        $user_master_type = '3'; // here user type is vendoruser_master_type


        $maxUserMasterId = $this->maxUserMasterId();

        $first_last_name ='Vendor';

        DB::insert("insert into user_master(id,first_name,last_name,address,city_code,pin_code,email,mobile,pan_no,cin_no,gst_no,user_master_type,joined_by,company_name,is_active,user_master_type_code) values('$maxUserMasterId','$first_last_name','$first_last_name','$name_address_address','$name_address_business_city_name','$name_address_pin','$name_address_email','$name_address_mobile','$name_address_pan_no','$name_address_cin_no','$name_address_gstn_no','$user_master_type','$joined_id','$name_of_business','Y','$name_address_vendor_code')");

        $max_user_company_info_id = $this->maxUserCompanyInformation();
        $maxUserCompanyBusinessActivityMapID = $this->maxUserCompanyBusinessActivityMap();

        $primary_products ='';
       // dd($company_information_primary_product);
        if($company_information_primary_product)
        {
            foreach ($company_information_primary_product as $product_key => $product_value) 
            {
                $primary_products =$primary_products.",".$product_value;
            }

            $primary_products = ltrim($primary_products,",");
        }
        else
        {
            $primary_products = 0;
        }

        DB::insert("insert into user_company_information(id,user_id,business_since,primary_product,parent_company_name,primary_mobile_number,primary_email) values('$max_user_company_info_id','$maxUserMasterId','$in_business_since','$primary_products','$company_information_parent_company','$primary_conatct_mobile','$primary_conatct_email')");

        if($company_information_type_business)
        {
            for ($i=0; $i < count($company_information_type_business); $i++) { 

                $maxUserCompanyBusinessTypaMapID = $this->maxUserCompanyBusinessTypaMap();

                $type = $company_information_type_business[$i];

                DB::insert("insert into user_company_business_type_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaMapID','$type','$max_user_company_info_id')");
            }
        }

        if($company_information_business_activity)
        {
            for ($i=0; $i < count($company_information_business_activity); $i++) { 

                $maxUserCompanyBusinessTypaActivityID = $this->maxUserCompanyBusinessActivityMap();

                $activity = $company_information_business_activity[$i];

                DB::insert("insert into user_company_business_activity_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaActivityID','$activity','$max_user_company_info_id')");
            }
        }
       
        $countTable = count($table_contact_information_type);

        foreach ($table_contact_information_type as $key_type => $value_type) { $contact_information_type[] = $value_type['contact_type']; }

        foreach ($table_contact_information_first_name as $key_first_name => $value_first_name) { $contact_information_first_name[] = $value_first_name['contact_information_first_name']; }

        foreach ($table_contact_information_last_name as $key_last_name => $value_last_name) { $contact_information_last_name[] = $value_last_name['contact_information_last_name']; }

        foreach ($table_contact_information_email as $key_email => $value_email) { $contact_information_email[] = $value_email['contact_information_email']; }

        foreach ($table_contact_information_mobile as $key_mobile => $value_mobile) { $contact_information_mobile[] = $value_mobile['contact_information_mobile']; }

        for($i=0;$i<$countTable;$i++)
        {
            $contact_information_type_contacts = $contact_information_type[$i];
     
            $contact_information_first_name_contacts = $contact_information_first_name[$i];
        
            $contact_information_last_name_contacts = $contact_information_last_name[$i];
         
            $contact_information_email_contacts = $contact_information_email[$i];

            $contact_information_mobile_contacts = $contact_information_mobile[$i];

            $max_user_contacts_id = $this->maxUserContactsId();

            $out = DB::insert("insert into user_contacts_information (id,user_id,contact_information_type,contact_person_first_name,contact_person_last_name,contact_person_email,contact_person_mobile,created_at) values('$max_user_contacts_id','$maxUserMasterId','$contact_information_type_contacts','$contact_information_first_name_contacts','$contact_information_last_name_contacts','$contact_information_email_contacts','$contact_information_mobile_contacts','$this->created_at')");
        }
      
        $maxUserBankReferenceId = $this->maxUserBankReferenceId();
        
        DB::insert("insert into user_bank_reference(id,user_id,Account_no,insitution_name,Ifsc,bank_address,created_at) values('$maxUserBankReferenceId','$maxUserMasterId','$bank_reference_account_detail','$bank_reference_bank_name','$bank_reference_ifsc_Code','$bank_reference_branch','$this->created_at')");
    }

    
    
    function editVendor($updated_by,$vendorId,$name_of_business,$name_address_vendor_code,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$table_contact_information_type,$table_contact_information_first_name,$table_contact_information_last_name,$table_contact_information_email,$table_contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail)
    {
        DB::update("update user_master set company_name='$name_of_business',address='$name_address_address',city_code='$name_address_business_city_name',pin_code='$name_address_pin',email='$name_address_email',mobile='$name_address_mobile',pan_no='$name_address_pan_no',cin_no='$name_address_cin_no',gst_no='$name_address_gstn_no',user_master_type_code='$name_address_vendor_code',updated_by='$updated_by' where Id='$vendorId'");

        $primary_products ='';

        if($company_information_primary_product) {

            foreach ($company_information_primary_product as $product_key => $product_value) {
                $primary_products =$primary_products.",".$product_value;
            }

            $primary_products = ltrim($primary_products,",");
        }
        else {
            $primary_products = 0;
        }

        DB::update("update user_company_information set business_since='$in_business_since',primary_product='$primary_products',parent_company_name='$company_information_parent_company',primary_mobile_number='$primary_conatct_mobile',primary_email='$primary_conatct_email' where user_id='$vendorId'"); 

        $output = DB::select("select id from  user_company_information where user_id='$vendorId'");

        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $max_user_company_info_id=$value['id'];
        }

        if($company_information_type_business)
        {
            DB::delete("delete from user_company_business_type_map where user_company_information_id='$max_user_company_info_id'");
            for ($i=0; $i < count($company_information_type_business); $i++) { 

                $maxUserCompanyBusinessTypaMapID = $this->maxUserCompanyBusinessTypaMap();

                $type = $company_information_type_business[$i];

                DB::insert("insert into user_company_business_type_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaMapID','$type','$max_user_company_info_id')");
            }
        }

        if($company_information_business_activity)
        {
            DB::delete("delete from user_company_business_activity_map where user_company_information_id='$max_user_company_info_id'");
            for ($i=0; $i < count($company_information_business_activity); $i++) { 

                $maxUserCompanyBusinessTypaActivityID = $this->maxUserCompanyBusinessActivityMap();

                $activity = $company_information_business_activity[$i];

                DB::insert("insert into user_company_business_activity_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaActivityID','$activity','$max_user_company_info_id')");
            }
        }

        DB::delete("delete from user_contacts_information where user_id='$vendorId'");

        $countTable = count($table_contact_information_type);

        foreach ($table_contact_information_type as $key_type => $value_type) { $contact_information_type[] = $value_type['contact_type']; }

        foreach ($table_contact_information_first_name as $key_first_name => $value_first_name) { $contact_information_first_name[] = $value_first_name['contact_information_first_name']; }

        foreach ($table_contact_information_last_name as $key_last_name => $value_last_name) { $contact_information_last_name[] = $value_last_name['contact_information_last_name']; }

        foreach ($table_contact_information_email as $key_email => $value_email) { $contact_information_email[] = $value_email['contact_information_email']; }

        foreach ($table_contact_information_mobile as $key_mobile => $value_mobile) { $contact_information_mobile[] = $value_mobile['contact_information_mobile']; }

        for($i=0;$i<$countTable;$i++)
        {
            $contact_information_type_contacts = $contact_information_type[$i];
     
            $contact_information_first_name_contacts = $contact_information_first_name[$i];
        
            $contact_information_last_name_contacts = $contact_information_last_name[$i];
         
            $contact_information_email_contacts = $contact_information_email[$i];

            $contact_information_mobile_contacts = $contact_information_mobile[$i];

            $max_user_contacts_id = $this->maxUserContactsId();

            $out = DB::insert("insert into user_contacts_information (id,user_id,contact_information_type,contact_person_first_name,contact_person_last_name,contact_person_email,contact_person_mobile,created_at) values('$max_user_contacts_id','$vendorId','$contact_information_type_contacts','$contact_information_first_name_contacts','$contact_information_last_name_contacts','$contact_information_email_contacts','$contact_information_mobile_contacts','$this->created_at')");
        }

        $output = DB::select("select count(*) as total from user_bank_reference where user_id='$vendorId'");
        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $total=$value['total'];
        }

        if($total=='0')
        {

            $maxUserBankReferenceId = $this->maxUserBankReferenceId();
        
            DB::insert("insert into user_bank_reference(id,user_id,Account_no,insitution_name,Ifsc,bank_address,created_at) values('$maxUserBankReferenceId','$vendorId','$bank_reference_account_detail','$bank_reference_bank_name','$bank_reference_ifsc_Code','$bank_reference_branch','$this->created_at')");
        }
        else{

            DB::update("update user_bank_reference set Account_no='$bank_reference_account_detail',insitution_name='$bank_reference_bank_name',Ifsc='$bank_reference_ifsc_Code',bank_address='$bank_reference_branch' where user_id='$vendorId'");
        }
    }


    function getUserInfoByUserId($userId)
    {
        //$out = DB::select("select * from user_master where Id='$userId' and is_active='Y'");
        $out = DB::select("select * from user_master a,city_master b where a.Id='$userId' and a.is_active='Y' and a.city_code=b.id");

        return json_decode(json_encode($out), true);
    }

    function getUserCompanyInformation($userId)
    {
        $out = DB::select("select * from user_company_information where user_id='$userId'");

        return json_decode(json_encode($out), true);
    }

    function gettingUserComoanyBusinessActivityMap($userId)
    {
        $out = DB::select("select a.type from user_company_business_activity_map a,user_company_information b where a.user_company_information_id=b.id and b.user_id='$userId'");

        $result = json_decode(json_encode($out), true);
        $output_1= '';

        for ($i=0; $i <count($result) ; $i++) { 
            $output_1 = $output_1.','.$result[$i]['type'];
        }

        $output_1 = ltrim($output_1, ',');
        return $output_1;
    }

    function gettingUserComoanyBusinessTypeMap($userId)
    {
        $out = DB::select("select a.type from user_company_business_type_map a,user_company_information b where a.user_company_information_id=b.id and b.user_id='$userId'");
        
        $result = json_decode(json_encode($out), true);
        $output_1= '';

        for ($i=0; $i <count($result) ; $i++) { 
            $output_1 = $output_1.','.$result[$i]['type'];
        }

        $output_1 = ltrim($output_1, ',');
        return $output_1;
    }

    function gettingUserContactsInformation($userId)
    {
        $out = DB::select("select * from user_contacts_information where user_id='$userId'");
        return json_decode(json_encode($out), true);
    }

    function gettingUserTradeReferces($userId)
    {
        $out = DB::select("select * from user_trade_reference where user_Id='$userId'");
        return json_decode(json_encode($out), true);
    }

    function gettingUserBankReferces($userId)
    {
        $out = DB::select("select * from user_bank_reference where user_Id='$userId'");
        return json_decode(json_encode($out), true);
    }


    function getCustomerList($role_id,$user_id)
    {
        // user_master_type 3 for vendor type.. 1 for Customer, 2 for user 
       // $out = DB::select("select * from user_master where user_master_type='3'");

        if($role_id)
        {
            if($role_id=='3')
            {
               $out = DB::select("select a.*,b.name as city_name from user_master a,city_master b where a.user_master_type='1' and a.city_code=b.id");
    
            }
            else
            {
               $out = DB::select("select a.*,b.name as city_name from user_master a,city_master b where a.user_master_type='1' and a.city_code=b.id and joined_by='$user_id'");
            }
           
            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }

        return json_decode(json_encode($out), true);
    }



    function saveCustomer($joined_id,$name_of_business,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$table_contact_information_type,$table_contact_information_first_name,$table_contact_information_last_name,$table_contact_information_email,$table_contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail,$trade_reference_company_name,$trade_reference_contact_name,$trade_reference_address,$trade_reference_phone,$trade_reference_ac_opened_since,$trade_reference_credit_limit,$trade_reference_current_balance)
    {
        $user_master_type = '1'; // here user type 1 is customer


        $maxUserMasterId = $this->maxUserMasterId();

        $first_last_name ='Vendor';

        DB::insert("insert into user_master(id,first_name,last_name,address,city_code,pin_code,email,mobile,pan_no,cin_no,gst_no,user_master_type,joined_by,company_name,is_active) values('$maxUserMasterId','$first_last_name','$first_last_name','$name_address_address','$name_address_business_city_name','$name_address_pin','$name_address_email','$name_address_mobile','$name_address_pan_no','$name_address_cin_no','$name_address_gstn_no','$user_master_type','$joined_id','$name_of_business','Y')");

        $max_user_company_info_id = $this->maxUserCompanyInformation();
        $maxUserCompanyBusinessActivityMapID = $this->maxUserCompanyBusinessActivityMap();

        $primary_products ='';
       // dd($company_information_primary_product);
        if($company_information_primary_product)
        {
            foreach ($company_information_primary_product as $product_key => $product_value) 
            {
                $primary_products =$primary_products.",".$product_value;
            }

            $primary_products = ltrim($primary_products,",");
        }
        else
        {
            $primary_products = 0;
        }

        DB::insert("insert into user_company_information(id,user_id,business_since,primary_product,parent_company_name,primary_mobile_number,primary_email) values('$max_user_company_info_id','$maxUserMasterId','$in_business_since','$primary_products','$company_information_parent_company','$primary_conatct_mobile','$primary_conatct_email')");

        if($company_information_type_business)
        {
            for ($i=0; $i < count($company_information_type_business); $i++) { 

                $maxUserCompanyBusinessTypaMapID = $this->maxUserCompanyBusinessTypaMap();

                $type = $company_information_type_business[$i];

                DB::insert("insert into user_company_business_type_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaMapID','$type','$max_user_company_info_id')");
            }
        }

        if($company_information_business_activity)
        {
            for ($i=0; $i < count($company_information_business_activity); $i++) { 

                $maxUserCompanyBusinessTypaActivityID = $this->maxUserCompanyBusinessActivityMap();

                $activity = $company_information_business_activity[$i];

                DB::insert("insert into user_company_business_activity_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaActivityID','$activity','$max_user_company_info_id')");
            }
        }
       
        $countTable = count($table_contact_information_type);

        foreach ($table_contact_information_type as $key_type => $value_type) { $contact_information_type[] = $value_type['contact_type']; }

        foreach ($table_contact_information_first_name as $key_first_name => $value_first_name) { $contact_information_first_name[] = $value_first_name['contact_information_first_name']; }

        foreach ($table_contact_information_last_name as $key_last_name => $value_last_name) { $contact_information_last_name[] = $value_last_name['contact_information_last_name']; }

        foreach ($table_contact_information_email as $key_email => $value_email) { $contact_information_email[] = $value_email['contact_information_email']; }

        foreach ($table_contact_information_mobile as $key_mobile => $value_mobile) { $contact_information_mobile[] = $value_mobile['contact_information_mobile']; }

        for($i=0;$i<$countTable;$i++)
        {
            $contact_information_type_contacts = $contact_information_type[$i];
     
            $contact_information_first_name_contacts = $contact_information_first_name[$i];
        
            $contact_information_last_name_contacts = $contact_information_last_name[$i];
         
            $contact_information_email_contacts = $contact_information_email[$i];

            $contact_information_mobile_contacts = $contact_information_mobile[$i];

            $max_user_contacts_id = $this->maxUserContactsId();

            $out = DB::insert("insert into user_contacts_information (id,user_id,contact_information_type,contact_person_first_name,contact_person_last_name,contact_person_email,contact_person_mobile,created_at) values('$max_user_contacts_id','$maxUserMasterId','$contact_information_type_contacts','$contact_information_first_name_contacts','$contact_information_last_name_contacts','$contact_information_email_contacts','$contact_information_mobile_contacts','$this->created_at')");
        }
      
        $maxUserBankReferenceId = $this->maxUserBankReferenceId();
        
        DB::insert("insert into user_bank_reference(id,user_id,Account_no,insitution_name,Ifsc,bank_address,created_at) values('$maxUserBankReferenceId','$maxUserMasterId','$bank_reference_account_detail','$bank_reference_bank_name','$bank_reference_ifsc_Code','$bank_reference_branch','$this->created_at')");


        $maxUserTradeReferenceId = $this->maxUserTradeReferenceId();
        
        DB::insert("insert into user_trade_reference(id,user_Id,Company_name,contact_name,address,mobile,account_opened_since,credit_limit,current_balance,created_at) values('$maxUserTradeReferenceId','$maxUserMasterId','$trade_reference_company_name','$trade_reference_contact_name','$trade_reference_address','$trade_reference_phone','$trade_reference_ac_opened_since','$trade_reference_credit_limit','$trade_reference_current_balance','$this->created_at')");

    }



    function editCustomer($updated_by,$customerId,$name_of_business,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$table_contact_information_type,$table_contact_information_first_name,$table_contact_information_last_name,$table_contact_information_email,$table_contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail,$trade_reference_company_name,$trade_reference_contact_name,$trade_reference_address,$trade_reference_phone,$trade_reference_ac_opened_since,$trade_reference_credit_limit,$trade_reference_current_balance)
    {
        DB::update("update user_master set company_name='$name_of_business',address='$name_address_address',city_code='$name_address_business_city_name',pin_code='$name_address_pin',email='$name_address_email',mobile='$name_address_mobile',pan_no='$name_address_pan_no',cin_no='$name_address_cin_no',gst_no='$name_address_gstn_no',updated_by='$updated_by' where Id='$customerId'");

        $primary_products ='';

        if($company_information_primary_product) {

            foreach ($company_information_primary_product as $product_key => $product_value) {
                $primary_products =$primary_products.",".$product_value;
            }

            $primary_products = ltrim($primary_products,",");
        }
        else {
            $primary_products = 0;
        }

        DB::update("update user_company_information set business_since='$in_business_since',primary_product='$primary_products',parent_company_name='$company_information_parent_company',primary_mobile_number='$primary_conatct_mobile',primary_email='$primary_conatct_email' where user_id='$customerId'"); 

        $output = DB::select("select id from  user_company_information where user_id='$customerId'");

        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $max_user_company_info_id=$value['id'];
        }

        if($company_information_type_business)
        {
            DB::delete("delete from user_company_business_type_map where user_company_information_id='$max_user_company_info_id'");
            for ($i=0; $i < count($company_information_type_business); $i++) { 

                $maxUserCompanyBusinessTypaMapID = $this->maxUserCompanyBusinessTypaMap();

                $type = $company_information_type_business[$i];

                DB::insert("insert into user_company_business_type_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaMapID','$type','$max_user_company_info_id')");
            }
        }

        if($company_information_business_activity)
        {
            DB::delete("delete from user_company_business_activity_map where user_company_information_id='$max_user_company_info_id'");
            for ($i=0; $i < count($company_information_business_activity); $i++) { 

                $maxUserCompanyBusinessTypaActivityID = $this->maxUserCompanyBusinessActivityMap();

                $activity = $company_information_business_activity[$i];

                DB::insert("insert into user_company_business_activity_map(id,type,user_company_information_id) values('$maxUserCompanyBusinessTypaActivityID','$activity','$max_user_company_info_id')");
            }
        }

        DB::delete("delete from user_contacts_information where user_id='$customerId'");

        $countTable = count($table_contact_information_type);

        foreach ($table_contact_information_type as $key_type => $value_type) { $contact_information_type[] = $value_type['contact_type']; }

        foreach ($table_contact_information_first_name as $key_first_name => $value_first_name) { $contact_information_first_name[] = $value_first_name['contact_information_first_name']; }

        foreach ($table_contact_information_last_name as $key_last_name => $value_last_name) { $contact_information_last_name[] = $value_last_name['contact_information_last_name']; }

        foreach ($table_contact_information_email as $key_email => $value_email) { $contact_information_email[] = $value_email['contact_information_email']; }

        foreach ($table_contact_information_mobile as $key_mobile => $value_mobile) { $contact_information_mobile[] = $value_mobile['contact_information_mobile']; }

        for($i=0;$i<$countTable;$i++)
        {
            $contact_information_type_contacts = $contact_information_type[$i];
     
            $contact_information_first_name_contacts = $contact_information_first_name[$i];
        
            $contact_information_last_name_contacts = $contact_information_last_name[$i];
         
            $contact_information_email_contacts = $contact_information_email[$i];

            $contact_information_mobile_contacts = $contact_information_mobile[$i];

            $max_user_contacts_id = $this->maxUserContactsId();

            $out = DB::insert("insert into user_contacts_information (id,user_id,contact_information_type,contact_person_first_name,contact_person_last_name,contact_person_email,contact_person_mobile,created_at) values('$max_user_contacts_id','$customerId','$contact_information_type_contacts','$contact_information_first_name_contacts','$contact_information_last_name_contacts','$contact_information_email_contacts','$contact_information_mobile_contacts','$this->created_at')");
        }

        $output = DB::select("select count(*) as total from user_bank_reference where user_id='$customerId'");
        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $total=$value['total'];
        }

        if($total=='0')
        {

            $maxUserBankReferenceId = $this->maxUserBankReferenceId();
        
            DB::insert("insert into user_bank_reference(id,user_id,Account_no,insitution_name,Ifsc,bank_address,created_at) values('$maxUserBankReferenceId','$customerId','$bank_reference_account_detail','$bank_reference_bank_name','$bank_reference_ifsc_Code','$bank_reference_branch','$this->created_at')");
        }
        else{

            DB::update("update user_bank_reference set Account_no='$bank_reference_account_detail',insitution_name='$bank_reference_bank_name',Ifsc='$bank_reference_ifsc_Code',bank_address='$bank_reference_branch' where user_id='$customerId'");
        }

        $output = DB::select("select count(*) as total from user_trade_reference where user_id='$customerId'");
        $result = json_decode(json_encode($output), true);
        foreach ($result as $key => $value) 
        {
            $total=$value['total'];
        }

        if($total=='0')
        {

           $maxUserTradeReferenceId = $this->maxUserTradeReferenceId();
        
            DB::insert("insert into user_trade_reference(id,user_Id,Company_name,contact_name,address,mobile,account_opened_since,credit_limit,current_balance,created_at) values('$maxUserTradeReferenceId','$customerId','$trade_reference_company_name','$trade_reference_contact_name','$trade_reference_address','$trade_reference_phone','$trade_reference_ac_opened_since','$trade_reference_credit_limit','$trade_reference_current_balance','$this->created_at')");
        }
        else{

            DB::update("update user_trade_reference set Company_name='$trade_reference_company_name',contact_name='$trade_reference_contact_name',address='$trade_reference_address',mobile='$trade_reference_phone',account_opened_since='$trade_reference_ac_opened_since',credit_limit='$trade_reference_credit_limit',current_balance='$trade_reference_current_balance' where user_id='$customerId'");
        }

    }


}