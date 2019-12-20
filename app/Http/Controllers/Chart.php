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
        $fromDateDay = $request->input('fromDateDay');
        $fromDateMonth = $request->input('fromDateMonth');
        $fromDateYear = $request->input('fromDateYear');
        $toDateDay = $request->input('toDateDay');
        $toDateMonth = $request->input('toDateMonth');
        $toDateYear = $request->input('toDateYear');

        $count = $this->chart->getSampleCount($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $output = $this->chart->getSampleDetails($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $arr['count'] = $count;
        $arr['output'] = $output;

        return $arr;
    }

    public function inquiry(Request $request)
    {
        $fromDateDay = $request->input('fromDateDay');
        $fromDateMonth = $request->input('fromDateMonth');
        $fromDateYear = $request->input('fromDateYear');
        $toDateDay = $request->input('toDateDay');
        $toDateMonth = $request->input('toDateMonth');
        $toDateYear = $request->input('toDateYear');

        $count = $this->chart->getInquiryCount($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $output = $this->chart->getInquiryDetails($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear);

        $arr['count'] = $count;
        $arr['output'] = $output;

        return $arr;
    }
}