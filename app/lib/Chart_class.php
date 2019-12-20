<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Chart_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function getSampleCount($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
        $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

        $out = DB::select("select count(*) as total from sample_master where created_at between '$fromDate' and '$toDate'");
        return json_decode(json_encode($out), true);
    }

    function getSampleDetails($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
        $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);
        //$out = DB::select("select * from sample_master where created_at between '$fromDate' and '$toDate'");
        $out = DB::select("select a.*,b.*,concat(c.first_name,' ',c.last_name) as request_by,a.status as type_status from sample_master a,sample_details b,user_master c where a.id=b.sample_id and a.created_by=c.id and a.created_at between '$fromDate' and '$toDate' order by a.type");

        return json_decode(json_encode($out), true);
    }

    function getInquiryCount($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
        $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

        $out = DB::select("select count(*) as total from inquiry_master where created_at between '$fromDate' and '$toDate'");
        return json_decode(json_encode($out), true);
    }

    function getInquiryDetails($fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
        $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);
    }
}