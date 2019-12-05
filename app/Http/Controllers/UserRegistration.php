<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\user_registration;
use App\lib\Product_class;

class UserRegistration extends Controller
{
    var $uid;

    public function __construct(User_Registration $user_registration,Product_class $product) 
    {
        $this->user_registration = $user_registration;

        $this->product = $product;
    }

    public function IsCompanyExits(Request $request)
    {
        $companyName = $request->input('companyName');

        $output = $this->user_registration->IsCompanyExits($companyName);

        return $output;
    }

    public function IsGSTNExits(Request $request)
    {
        $gstn = $request->input('gstn');

        $output = $this->user_registration->IsGSTNExits($gstn);

        return $output;
    }

    // customer registration function blocks
        public function customer_index()
    	{
            $role_id = Session::get('role_id');

            $user_id = Session::get('UID');

            $output = $this->user_registration->getCustomerList($role_id,$user_id);

            return view('registration.customer_registration',compact('output'));
        }

        public function addCustomer()
        {
            $country_id ='101';

            $state_id = '1';

            $country = $this->user_registration->getCustomerCountyList();

            $state = $this->user_registration->getStateList($country_id);

            $city = $this->user_registration->getCityList($state_id);

            $type_of_business = $this->user_registration->getTypeOfTheBusiness();

            $busniess_activity = $this->user_registration->getBusniessActivity();

            $product_category = $this->product->getProductCategory();

            $userContactInformationMaster = $this->user_registration->getUserContactInformationMaster();

            return view('registration.add_customer',compact('country','state','city','type_of_business','busniess_activity','product_category','userContactInformationMaster'));
        }


        public function saveCustomer(Request $request)
        {
            $joined_id = Session::get('UID');

            $request->validate([
                    'name_of_business' => 'required',
                    'name_address_address' => 'required',
                    'name_address_business_city_name' => 'required',
                    'name_address_pin' =>  ['required', 'digits:6'],
                    'name_address_mobile' => ['required', 'digits:10'],
                    'name_address_pan_no' => 'required',
                    'name_address_gstn_no' => 'required',
                    'primary_conatct_email' => 'required|email',
                    'primary_conatct_mobile' => ['required', 'digits:10'],
                    'in_business_since' => ['required', 'digits:4'],
                ]
            );

            $name_of_business = request('name_of_business');
            $name_address_address = request('name_address_address');
            $name_address_business_city_name = request('name_address_business_city_name');
            $name_address_pin = request('name_address_pin');
            $name_address_mobile = request('name_address_mobile');
            $name_address_email = request('name_address_email');
            $name_address_pan_no = request('name_address_pan_no');
            $name_address_cin_no = request('name_address_cin_no');
            $name_address_gstn_no = request('name_address_gstn_no');
            $company_information_type_business = request('company_information_type_business');
            $company_information_primary_product = request('company_information_primary_product');
            $company_information_parent_company = request('company_information_parent_company');
            $in_business_since = request('in_business_since');
            $primary_conatct_mobile = request('primary_conatct_mobile');
            $primary_conatct_email = request('primary_conatct_email');
            $company_information_business_activity = request('company_information_business_activity');
            $contact_information_type = request('contact_information_type');
            $contact_information_first_name = request('contact_information_first_name');
            $contact_information_last_name = request('contact_information_last_name');
            $contact_information_email = request('contact_information_email');
            $contact_information_mobile = request('contact_information_mobile');
            $bank_reference_bank_name = request('bank_reference_bank_name');
            $bank_reference_ifsc_Code = request('bank_reference_ifsc_Code');
            $bank_reference_branch = request('bank_reference_branch');
            $bank_reference_account_detail = request('bank_reference_account_detail');
            $trade_reference_company_name = request('trade_reference_company_name');
            $trade_reference_contact_name = request('trade_reference_contact_name');
            $trade_reference_address = request('trade_reference_address');
            $trade_reference_phone = request('trade_reference_phone');
            $trade_reference_ac_opened_since = request('trade_reference_ac_opened_since');
            $trade_reference_credit_limit = request('trade_reference_credit_limit');
            $trade_reference_current_balance = request('trade_reference_current_balance');

            //print_r($company_information_primary_product);
            //print_r($contact_information_type);
            //dd("AS");

            $output = $this->user_registration->saveCustomer($joined_id,$name_of_business,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$contact_information_type,$contact_information_first_name,$contact_information_last_name,$contact_information_email,$contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail,$trade_reference_company_name,$trade_reference_contact_name,$trade_reference_address,$trade_reference_phone,$trade_reference_ac_opened_since,$trade_reference_credit_limit,$trade_reference_current_balance);

            $data['message'] ='Customer Added';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function showCustomer(Request $request)
        {
            $customerId = $request->segment(3);

            $country_id ='101';

            $state_id = '1';

            $customer_registration_output = $this->user_registration->getUserInfoByUserId($customerId);
            $getUserCompanyInformation = $this->user_registration->getUserCompanyInformation($customerId);
            $gettingUserComoanyBusinessActivityMap = $this->user_registration->gettingUserComoanyBusinessActivityMap($customerId);
            $gettingUserComoanyBusinessTypeMap = $this->user_registration->gettingUserComoanyBusinessTypeMap($customerId);
            $gettingUserContactsInformation = $this->user_registration->gettingUserContactsInformation($customerId);
            $gettingUserBankReferces = $this->user_registration->gettingUserBankReferces($customerId);
            $gettingUserTradeReferces = $this->user_registration->gettingUserTradeReferces($customerId);

           // dd($customer_registration_output);

            $country = $this->user_registration->getCustomerCountyList();

            $state = $this->user_registration->getStateList($country_id);

            $city = $this->user_registration->getCityList($state_id);

            $type_of_business = $this->user_registration->getTypeOfTheBusiness();

            $busniess_activity = $this->user_registration->getBusniessActivity();

            $product_category = $this->product->getProductCategory();

            $userContactInformationMaster = $this->user_registration->getUserContactInformationMaster();

            return view('registration.edit_customer',compact('country','state','city','type_of_business','busniess_activity','product_category','userContactInformationMaster','customer_registration_output','getUserCompanyInformation','gettingUserComoanyBusinessActivityMap','gettingUserComoanyBusinessTypeMap','gettingUserContactsInformation','gettingUserBankReferces','gettingUserTradeReferces'));
        }


        public function editCustomer(Request $request)
        {
            $joined_id = Session::get('UID');

            $request->validate([
                    'name_of_business' => 'required',
                    'name_address_address' => 'required',
                    'name_address_business_city_name' => 'required',
                    'name_address_pin' =>  ['required', 'digits:6'],
                    'name_address_mobile' => ['required', 'digits:10'],
                    'name_address_pan_no' => 'required',
                    'name_address_gstn_no' => 'required',
                    'primary_conatct_email' => 'required|email',
                    'primary_conatct_mobile' => ['required', 'digits:10'],
                    'in_business_since' => ['required', 'digits:4'],
                ]
            );

            $customerId = request('customerId');
            $name_of_business = request('name_of_business');
            $name_address_address = request('name_address_address');
            $name_address_business_city_name = request('name_address_business_city_name');
            $name_address_pin = request('name_address_pin');
            $name_address_mobile = request('name_address_mobile');
            $name_address_email = request('name_address_email');
            $name_address_pan_no = request('name_address_pan_no');
            $name_address_cin_no = request('name_address_cin_no');
            $name_address_gstn_no = request('name_address_gstn_no');
            $company_information_type_business = request('company_information_type_business');
            $company_information_primary_product = request('company_information_primary_product');
            $company_information_parent_company = request('company_information_parent_company');
            $in_business_since = request('in_business_since');
            $primary_conatct_mobile = request('primary_conatct_mobile');
            $primary_conatct_email = request('primary_conatct_email');
            $company_information_business_activity = request('company_information_business_activity');
            $contact_information_type = request('contact_information_type');
            $contact_information_first_name = request('contact_information_first_name');
            $contact_information_last_name = request('contact_information_last_name');
            $contact_information_email = request('contact_information_email');
            $contact_information_mobile = request('contact_information_mobile');
            $bank_reference_bank_name = request('bank_reference_bank_name');
            $bank_reference_ifsc_Code = request('bank_reference_ifsc_Code');
            $bank_reference_branch = request('bank_reference_branch');
            $bank_reference_account_detail = request('bank_reference_account_detail');
            $trade_reference_company_name = request('trade_reference_company_name');
            $trade_reference_contact_name = request('trade_reference_contact_name');
            $trade_reference_address = request('trade_reference_address');
            $trade_reference_phone = request('trade_reference_phone');
            $trade_reference_ac_opened_since = request('trade_reference_ac_opened_since');
            $trade_reference_credit_limit = request('trade_reference_credit_limit');
            $trade_reference_current_balance = request('trade_reference_current_balance');

            //print_r($company_information_primary_product);
            //print_r($contact_information_type);
            //dd("AS");

            $output = $this->user_registration->editCustomer($joined_id,$customerId,$name_of_business,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$contact_information_type,$contact_information_first_name,$contact_information_last_name,$contact_information_email,$contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail,$trade_reference_company_name,$trade_reference_contact_name,$trade_reference_address,$trade_reference_phone,$trade_reference_ac_opened_since,$trade_reference_credit_limit,$trade_reference_current_balance);

            $data['message'] ='Customer Edit';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

    // customer registration function blocks



    // Vendor registration function blocks
        public function vendor_index()
        {
            $output = $this->user_registration->getVendorList();

            return view('vendor_registration.index',compact('output'));
        }

        public function addVendor()
        {
            $country_id ='101';

            $state_id = '1';

            $country = $this->user_registration->getCountyList();

            $state = $this->user_registration->getStateList($country_id);

            $city = $this->user_registration->getCityList($state_id);

            $type_of_business = $this->user_registration->getTypeOfTheBusiness();

            $busniess_activity = $this->user_registration->getBusniessActivity();

            $product_category = $this->product->getProductCategory();

            $userContactInformationMaster = $this->user_registration->getUserContactInformationMaster();

            return view('vendor_registration.add',compact('country','state','city','type_of_business','busniess_activity','product_category','userContactInformationMaster'));
        }

        public function getUserContactInformation()
        {
            $userContactInformationMaster = $this->user_registration->getUserContactInformationMaster();

            return $userContactInformationMaster;
        }

        public function saveVendor(Request $request)
        {
            $joined_id = Session::get('UID');

            $request->validate([
                    'name_of_business' => 'required',
                    'name_address_vendor_code' => 'required',
                    'name_address_address' => 'required',
                    'name_address_business_city_name' => 'required',
                    'name_address_pin' =>  ['required', 'digits:6'],
                    'name_address_mobile' => ['required', 'digits:10'],
                    'name_address_pan_no' => 'required',
                    'name_address_gstn_no' => 'required',
                    'primary_conatct_email' => 'required|email',
                    'primary_conatct_mobile' => ['required', 'digits:10'],
                    'in_business_since' => ['required', 'digits:4'],
                ]
            );

            $name_of_business = request('name_of_business');
            $name_address_vendor_code = request('name_address_vendor_code');
            $name_address_address = request('name_address_address');
            $name_address_business_city_name = request('name_address_business_city_name');
            $name_address_pin = request('name_address_pin');
            $name_address_mobile = request('name_address_mobile');
            $name_address_email = request('name_address_email');
            $name_address_pan_no = request('name_address_pan_no');
            $name_address_cin_no = request('name_address_cin_no');
            $name_address_gstn_no = request('name_address_gstn_no');
            $company_information_type_business = request('company_information_type_business');
            $company_information_primary_product = request('company_information_primary_product');
            $company_information_parent_company = request('company_information_parent_company');
            $in_business_since = request('in_business_since');
            $primary_conatct_mobile = request('primary_conatct_mobile');
            $primary_conatct_email = request('primary_conatct_email');
            $company_information_business_activity = request('company_information_business_activity');
            $contact_information_type = request('contact_information_type');
            $contact_information_first_name = request('contact_information_first_name');
            $contact_information_last_name = request('contact_information_last_name');
            $contact_information_email = request('contact_information_email');
            $contact_information_mobile = request('contact_information_mobile');
            $bank_reference_bank_name = request('bank_reference_bank_name');
            $bank_reference_ifsc_Code = request('bank_reference_ifsc_Code');
            $bank_reference_branch = request('bank_reference_branch');
            $bank_reference_account_detail = request('bank_reference_account_detail');

            //print_r($company_information_primary_product);
            //print_r($contact_information_type);
            //dd("AS");

            $output = $this->user_registration->saveVendor($joined_id,$name_of_business,$name_address_vendor_code,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$contact_information_type,$contact_information_first_name,$contact_information_last_name,$contact_information_email,$contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail);

            $data['message'] ='Vendor Added';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }


        public function showVendor(Request $request)
        {
            $vendorId = $request->segment(3);

            $country_id ='101';

            $state_id = '1';

            $vendor_registration_output = $this->user_registration->getUserInfoByUserId($vendorId);
            $getUserCompanyInformation = $this->user_registration->getUserCompanyInformation($vendorId);
            $gettingUserComoanyBusinessActivityMap = $this->user_registration->gettingUserComoanyBusinessActivityMap($vendorId);
            $gettingUserComoanyBusinessTypeMap = $this->user_registration->gettingUserComoanyBusinessTypeMap($vendorId);
            $gettingUserContactsInformation = $this->user_registration->gettingUserContactsInformation($vendorId);
            $gettingUserBankReferces = $this->user_registration->gettingUserBankReferces($vendorId);
            // $gettingUserTradeReferces = $this->user_registration->gettingUserTradeReferces($vendorId);

           // dd($gettingUserBankReferces);
            /*print_r("vendor_registration_output");print_r($vendor_registration_output);
            print_r("getUserCompanyInformation");print_r($getUserCompanyInformation);
            print_r("gettingUserComoanyBusinessActivityMap");print_r($gettingUserComoanyBusinessActivityMap);
            print_r("gettingUserComoanyBusinessTypeMap");print_r($gettingUserComoanyBusinessTypeMap);
            print_r("gettingUserContactsInformation");print_r($gettingUserContactsInformation);
            print_r("gettingUserTradeReferces");print_r($gettingUserTradeReferces);

            dd("AS");*/

            $country = $this->user_registration->getCountyList();

            $state = $this->user_registration->getStateList($country_id);

            $city = $this->user_registration->getCityList($state_id);

            $type_of_business = $this->user_registration->getTypeOfTheBusiness();

            $busniess_activity = $this->user_registration->getBusniessActivity();

            $product_category = $this->product->getProductCategory();

            $userContactInformationMaster = $this->user_registration->getUserContactInformationMaster();

            return view('vendor_registration.edit',compact('country','state','city','type_of_business','busniess_activity','product_category','userContactInformationMaster','vendor_registration_output','getUserCompanyInformation','gettingUserComoanyBusinessActivityMap','gettingUserComoanyBusinessTypeMap','gettingUserContactsInformation','gettingUserBankReferces'));
        }

        public function editVendor(Request $request)
        {
            $updated_by = Session::get('UID');

            $request->validate([
                    'name_of_business' => 'required',
                    'name_address_vendor_code' => 'required',
                    'name_address_address' => 'required',
                    'name_address_business_city_name' => 'required',
                    'name_address_pin' =>  ['required', 'digits:6'],
                    'name_address_mobile' => ['required', 'digits:10'],
                    'name_address_pan_no' => 'required',
                    'name_address_gstn_no' => 'required',
                    'primary_conatct_email' => 'required|email',
                    'primary_conatct_mobile' => ['required', 'digits:10'],
                    'in_business_since' => ['required', 'digits:4'],
                ]
            );

            $vendorId = request('vendorId');
            $name_of_business = request('name_of_business');
            $name_address_vendor_code = request('name_address_vendor_code');
            $name_address_address = request('name_address_address');
            $name_address_business_city_name = request('name_address_business_city_name');
            $name_address_pin = request('name_address_pin');
            $name_address_mobile = request('name_address_mobile');
            $name_address_email = request('name_address_email');
            $name_address_pan_no = request('name_address_pan_no');
            $name_address_cin_no = request('name_address_cin_no');
            $name_address_gstn_no = request('name_address_gstn_no');
            $company_information_type_business = request('company_information_type_business');
            $company_information_primary_product = request('company_information_primary_product');
            $company_information_parent_company = request('company_information_parent_company');
            $in_business_since = request('in_business_since');
            $primary_conatct_mobile = request('primary_conatct_mobile');
            $primary_conatct_email = request('primary_conatct_email');
            $company_information_business_activity = request('company_information_business_activity');
            $contact_information_type = request('contact_information_type');
            $contact_information_first_name = request('contact_information_first_name');
            $contact_information_last_name = request('contact_information_last_name');
            $contact_information_email = request('contact_information_email');
            $contact_information_mobile = request('contact_information_mobile');
            $bank_reference_bank_name = request('bank_reference_bank_name');
            $bank_reference_ifsc_Code = request('bank_reference_ifsc_Code');
            $bank_reference_branch = request('bank_reference_branch');
            $bank_reference_account_detail = request('bank_reference_account_detail');

            //print_r($company_information_primary_product);
            //print_r($contact_information_type);
            //dd("AS");

            $output = $this->user_registration->editVendor($updated_by,$vendorId,$name_of_business,$name_address_vendor_code,$name_address_address,$name_address_business_city_name,$name_address_pin,$name_address_mobile,$name_address_email,$name_address_pan_no,$name_address_cin_no,$name_address_gstn_no,$company_information_type_business,$company_information_primary_product,$company_information_parent_company,$in_business_since,$primary_conatct_mobile,$primary_conatct_email,$company_information_business_activity,$contact_information_type,$contact_information_first_name,$contact_information_last_name,$contact_information_email,$contact_information_mobile,$bank_reference_bank_name,$bank_reference_ifsc_Code,$bank_reference_branch,$bank_reference_account_detail);

            $data['message'] ='User Information Updated';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }
    // Vendor registration function blocks



    public function erp_user_index()
    {
        $output = $this->user_registration->getERPUserList();

        return view('erp_user_registration.index',compact('output'));
    }

    public function addNewERPUser()
    {
        $output = $this->user_registration->getRole();
        
        return view('erp_user_registration.new',compact('output'));
    }

    public function save(Request $request)
    {
         $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'offical_mobile' => ['required', 'digits:10'],
                'offical_email' => 'required|email',
                'personal_mobile' => ['digits:10'],
                'personal_email' => 'email',
                'password_erp_user' => 'required',
            ]
        );

        $user_id = Session::get('UID');

        $first_name = request('first_name');
        $last_name = request('last_name');
        $offical_email = request('offical_email');
        $offical_mobile = request('offical_mobile');
        $personal_email = request('personal_email');
        $personal_mobile = request('personal_mobile');
        $erpuser_role = request('erpuser_role');
        $password_erp_user = request('password_erp_user');

        $output = $this->user_registration->saveERPUser($first_name,$last_name,$offical_email,$offical_mobile,$personal_email,$personal_mobile,$erpuser_role,$password_erp_user,$user_id);

       // dd($output);

        if($output=='ERR')
        {
            $data['message'] ='Email is already registered.Unable to create new user. Please proceed by another user / email';
            $data['text'] = '';
            return view('dashboard_return.success',$data);
        } 
        else
        { 
            $data['message'] ='User created';
            $data['text'] = '';
            return view('dashboard_return.success',$data);
        }
    }

    public function show(Request $request)
    {
        $erpUserId = $request->segment(3);

        $role = $this->user_registration->getRole();

        $erpUserInfo = $this->user_registration->getERPUserInformation($erpUserId);

        //dd($erpUserInfo);

        return view('erp_user_registration.edit',compact('erpUserInfo','role'));
    }

    public function update(Request $request)
    {
        $user_id = Session::get('UID');

        $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'offical_mobile' => ['required', 'digits:10'],
                'personal_mobile' => ['digits:10'],
                'personal_email' => 'email',
                'password_erp_user' => 'required',
            ]
        );

        $erpuserid = request('erpuserid');
        $first_name = request('first_name');
        $last_name = request('last_name');
        $offical_mobile = request('offical_mobile');
        $personal_email = request('personal_email');
        $personal_mobile = request('personal_mobile');
        $erpuser_role = request('erpuser_role');
        $password_erp_user = request('password_erp_user');

        //dd(Session::get('UID'));
        $output = $this->user_registration->updateERPUser($erpuserid,$first_name,$last_name,$offical_mobile,$personal_email,$personal_mobile,$erpuser_role,$password_erp_user,$user_id);

        $data['message'] ='User Information Updated';
        $data['text'] = '';
        
        return view('dashboard_return.success',$data);
    }

    public function changeERPUserStatus(Request $request)
    {
        $updated_by = Session::get('UID');

        $id = $request->input('id');

        $status = $request->input('status');

        $out = $this->user_registration->changeERPUserStatus($updated_by,$id,$status);

        $output = $this->user_registration->getERPUserList();

        return $output;
    }
}