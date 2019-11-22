<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\lib\Inquiry_class;



class Inquiry extends Controller
{

    public function __construct(Inquiry_class $inquiry) 
    {
        $this->inquiry = $inquiry;
    }
   
}