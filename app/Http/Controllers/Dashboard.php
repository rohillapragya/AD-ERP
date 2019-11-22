<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//use DB;

use App\lib\Users;



class Dashboard extends Controller
{

    public function __construct(Users $user) 
    {
        $this->user = $user;
    }
    
    public function show()
    {
    	// $module = "login";
    
    	// $out = $this->log->write_log($module);

       	return view ('dashboard.index');
    }
}