<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

class Login extends Controller
{
    
    // public function __construct()
    // {
    // }

    public function __construct(Users $user) 
    {
        $this->user = $user;
    }
    
    public function show()
    {
       //dd('AS');
       return view ('home.login');
    }
    
    public function doLogin()
    {
        $email = request('authKey');
        $password = request('authValue');

        if(empty($email) || empty($password)) 
        {
            $data['message'] ='Both Email and password should not be blank';
            return view('error.message',$data);
        }
        else
        {
            if(!$this->user->doLogin($email,$password))
            {
                $data['message'] ='Invalid Login Credentials';
                return view('error.message',$data);
            }
            else
            {
                $this->user->populate($email);
                return redirect()->route('dashboard');

               // return view('dashboard.index');
            }
        }
    }

    public function signoff()
    {
        Session::flush();
        return redirect()->route('login');
    }
}