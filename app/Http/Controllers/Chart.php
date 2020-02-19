<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Chart_class;

class Chart extends Controller
{
    public function __construct(Chart_class $chart)  
    {
        $this->chart = $chart;
    }

    public function index()
    {
        return view('Chart.index');
    }

    public function sample(Request $request)
    {
        $role_id = Session::get('role_id');
        $user_id = Session::get('UID');
        $locationId = Session::get('location_id');

        $fromDateDay = $request->input('fromDateDay');
        $fromDateMonth = $request->input('fromDateMonth');
        $fromDateYear = $request->input('fromDateYear');
        $toDateDay = $request->input('toDateDay');
        $toDateMonth = $request->input('toDateMonth');
        $toDateYear = $request->input('toDateYear');

        $count = $this->chart->getSampleCount($role_id,$user_id,$locationId,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $output = $this->chart->getSampleDetails($role_id,$user_id,$locationId,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $arr['count'] = $count;
        $arr['output'] = $output;

        return $arr;
    }

    public function inquiry(Request $request)
    {
        $role_id = Session::get('role_id');
        $user_id = Session::get('UID');
        $locationId = Session::get('location_id');

        $fromDateDay = $request->input('fromDateDay');
        $fromDateMonth = $request->input('fromDateMonth');
        $fromDateYear = $request->input('fromDateYear');
        $toDateDay = $request->input('toDateDay');
        $toDateMonth = $request->input('toDateMonth');
        $toDateYear = $request->input('toDateYear');

        $count = $this->chart->getInquiryCount($role_id,$user_id,$locationId,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $output = $this->chart->getInquiryDetails($role_id,$user_id,$locationId,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $arr['count'] = $count;
        $arr['output'] = $output;

        return $arr;
    }

    public function wish(Request $request)
    {
        $role_id = Session::get('role_id');
        $user_id = Session::get('UID');
        $location_id = Session::get('location_id');

        $fromDateDay = $request->input('fromDateDay');
        $fromDateMonth = $request->input('fromDateMonth');
        $fromDateYear = $request->input('fromDateYear');
        $toDateDay = $request->input('toDateDay');
        $toDateMonth = $request->input('toDateMonth');
        $toDateYear = $request->input('toDateYear');

        $count = $this->chart->getWishCount($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $output = $this->chart->getWishDetails($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $arr['count'] = $count;
        $arr['output'] = $output;

        return $arr;
    }

}