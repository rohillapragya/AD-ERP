<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\user_registration;

class UserRegistration extends Controller
{
    var $uid;

    public function __construct(User_Registration $user_registration) 
    {
        $this->user_registration = $user_registration;
    }
    
    public function index()
	{
        return view('registration.customer_registration');
    }
    
    public function vendor_index()
    {
        return view('registration.vendor_registration');
    }

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
            return view('dashboard_return.success',$data);
        } 
        else
        { 
            $data['message'] ='User created';
            return view('dashboard_return.success',$data);
        }
    }

    public function show(Request $request)
    {
        $erpUserId = $request->segment(3);

        $role = $this->user_registration->getRole();

        $erpUserInfo = $this->user_registration->getERPUserInformation($erpUserId);

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
