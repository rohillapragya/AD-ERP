<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Routing\Redirector;

use App\lib\Users;

class ForgotPassController extends Controller
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
      // dd('AS');
       return view ('home.forgotPass');
    }

    public function changepassword()
    {
      $email = request('auth_key');
      $password = request('new_auth_key');

      if(empty($email) || empty($password)) 
      {
          $data['message'] ='Both Email and password should not be blank';
          return view('error.message',$data);
      }
      else
      {
        if(!$this->user->changePassword($email,$password))
        {
          $data['message'] ='Something went wrong. Please try after some time';
          return view('error.message',$data);
        }
        else
        {
          $output = $this->user->changePassword($email,$password);

          if($output=='ERR')
          {
            $data['message'] ='Your email is not register. Unable to change password';
            return view('error.message',$data);
          } 
          else
          { 
            $data['message'] ='Your Password was changed';
            return view('error.success',$data);
          }
        }
      }
    }
}