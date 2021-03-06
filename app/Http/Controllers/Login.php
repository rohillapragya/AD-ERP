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
    
    // public function doLogin()
    // {
    //     $email = request('authKey');
    //     $password = request('authValue');

    //     $role_id = request('role_id');

    //     if(empty($email) || empty($password)) 
    //     {
    //         $data['message'] ='Both Email and password should not be blank';
    //         return view('error.message',$data);
    //     }
    //     else
    //     {
    //         if(!$this->user->doLogin($email,$password))
    //         {
    //             $data['message'] ='Invalid Login Credentials';
    //             return view('error.message',$data);
    //         }
    //         else
    //         {
    //             $module = "login";

    //             $out = $this->log->write_log($module);

    //             $this->user->populate($email,$role_id);

    //             return redirect()->route('dashboard');

    //            // return view('dashboard.index');
    //         }
    //     }
    // }



    public function doLogin()
    {
        $email = request('authKey');
        $password = request('authValue');

        // $role_id = request('role_id');

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

                $userEmailRegisteredLocation = $this->user->populate($email);

                return redirect()->route('dashboard');

                // return view('dashboard.index',compact('userEmailRegisteredLocation'));
               
                // $countOutput = count($output);

                // if($countOutput >0)
                // {
                //     return redirect()->route('selectLocation');
                // }
                // else
                // {
                //     return redirect()->route('dashboard');
                // }

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


    public function UserLocation()
    {
        $user_id = Session::get('UID');

        $role_id = Session::get('role_id');

        $arr = array();

        $userEmailRegisteredLocation = $this->user->checkUseIDRegisteredLocation($user_id,$role_id);
        
        $arr['userEmailRegisteredLocation'] = $userEmailRegisteredLocation;
        
        $arr['first_id'] = $userEmailRegisteredLocation[0]['location_id'];
    
        return $arr;
    }   
     

    public function userAllocatedLocation()
    {
        $user_id = Session::get('UID');

        $role_id = Session::get('role_id');

        $arr = array();

        $userEmailRegisteredLocation = $this->user->userAllocatedLocation($user_id,$role_id);
        
        $arr['userEmailRegisteredLocation'] = $userEmailRegisteredLocation;
        
        $arr['first_id'] = $userEmailRegisteredLocation[0]['location_id'];
    
        return $arr;
    }

}