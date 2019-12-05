<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

use App\lib\Log_class;

class Login extends Controller
{
    public function __construct(Users $user,Log_class $log) 
    {
        $this->user = $user;

        $this->log = $log;
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

        $role_id = request('role_id');

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
                $module = "login";

                $out = $this->log->write_log($module);

                $this->user->populate($email,$role_id);

                return redirect()->route('dashboard');

               // return view('dashboard.index');
            }
        }
    }

    public function signoff()
    {
        $module = "logout";

        $out = $this->log->write_log($module);

        Session::flush();
        return redirect()->route('login');
    }

    public function checkRole(Request $request)
    {
        $authKey = $request->input('authKey');

        $output = $this->user->checkRole($authKey);

      // dd($output);

        return $output;
    }
}