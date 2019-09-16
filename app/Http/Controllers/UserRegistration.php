<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

class UserRegistration extends Controller
{
    public function __construct(Users $user) 
    {
        $this->user = $user;
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
        return view('registration.erp_user_registration');
    }
}
