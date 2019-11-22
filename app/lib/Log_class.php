<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use Monolog\Logger;

use Monolog\Handler\StreamHandler;

class Log_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        date_default_timezone_set("Asia/Calcutta"); 

        $this->created_at = date("Y-m-d h:i:sa");

        $this->processLog = new Logger('Natura ERP');
        
        $this->processLog->pushHandler(new StreamHandler(storage_path('logs/process.log')), Logger::INFO);
    }

    function write_log($module)
    {
        $user_id = Session::get('UID');

        $full_name = Session::get('full_name');
        
        $role_name = Session::get('role_name');
        
        $role_id = Session::get('role_id');

        // print_r("user-".$user_id."created at-". $this->created_at);
        // dd("In Log Class");

        $log = ['Module'=>"$module" ,'Created_at' => $this->created_at,'User Id' => $user_id,'user name '=> $full_name,'Role name '=> $role_name,'role_id '=> $role_id ,"description' => 'User name $full_name having access for $role_name ($role_id) $module successfully."];

        $this->processLog->info('Natura Process log', $log);
    }

    function write_sample_log($module,$request_date,$delivery_date,$befalf_of,$name,$mobile,$email,$address)
    {
        $user_id = Session::get('UID');

        $role_id = Session::get('role_id');

        $log = ['Module'=>$module ,'Created_at' => $this->created_at,'User Id' => $user_id,'Role Id '=> $role_id,'Request Date'=>$request_date ,'Delivery Date' => $delivery_date,'Befalf of' => $befalf_of,'Name '=> $name,'Email '=> $email,'Mobile '=> $mobile,'Address '=> $address];

        $this->processLog->info('Natura Process log', $log);

    }

}
