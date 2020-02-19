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

    function isUserLocationHavingAdministratorAccess($user_id,$locationId)
    {
        /* Role id 3 for Adminsitrator role. Using this will able to check  whether user role along with location having  Administrator access or not*/

        $out = DB::select("select count(*) as total from app_user_menu_access_map where user_id='$user_id' and location_id='$locationId' and role_id ='3'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $count = $value['total'];

            if($count=='1'){ $isUserLocationHavingAdministratorRole = 'Y';}
            else { $isUserLocationHavingAdministratorRole = 'N';}
        }

        return $isUserLocationHavingAdministratorRole;
    }


    function isUserLocationHavingOperationAdminAccess($user_id,$locationId)
    {
        /* Role id 3 for Adminsitrator role. Using this will able to check  whether user role along with location having  Administrator access or not*/

        $out = DB::select("select count(*) as total from app_user_menu_access_map where user_id='$user_id' and location_id='$locationId' and role_id ='7'");

        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            $count = $value['total'];

            if($count=='1'){ $isUserLocationHavingOperationAdminRole = 'Y';}
            else { $isUserLocationHavingOperationAdminRole = 'N';}
        }

        return $isUserLocationHavingOperationAdminRole;
    }


    function getSampleCount($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

            $out = DB::select("select count(*) as total from sample_master a where a.created_at between '$fromDate' and '$toDate'  $str");
            return json_decode(json_encode($out), true);
        }       
    }


    function getSampleDetails($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

            $out = DB::select("select a.*,b.*,concat(c.first_name,' ',c.last_name) as request_by,a.status as type_status from sample_master a,sample_details b,user_master c where a.id=b.sample_id and a.created_by=c.id and a.created_at between '$fromDate' and '$toDate' $str order by a.type");

            return json_decode(json_encode($out), true);
        }
    }

    function getInquiryCount($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%') { $str.= " and a.location_id ='$location_id'"; }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

           $out = DB::select("select count(*) as total from inquiry_master a,purchase_indent b,user_master c,user_master d where a.created_at between '$fromDate' and '$toDate' and a.id=b.inquiry_no  and b.created_by=c.id and a.customer_id=d.id $str");

            return json_decode(json_encode($out), true);
        }
    }


    function getInquiryDetails($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%') { $str.= " and a.location_id ='$location_id'"; }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

            $out = DB::select("select a.*,b.*,concat(c.first_name,' ',c.last_name) as inquiry_proceed_by,d.company_name as customer_name,d.* from inquiry_master a,purchase_indent b,user_master c,user_master d where a.created_at between '$fromDate' and '$toDate' and a.id=b.inquiry_no  and b.created_by=c.id and a.customer_id=d.id $str");
           
            return json_decode(json_encode($out), true);
        }
    }


    function getWishCount($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%') { $str.= " and a.location_id ='$location_id'"; }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

            $out = DB::select("select count(*) as total from user_wish_master a where a.created_at between '$fromDate' and '$toDate' $str");
          
            return json_decode(json_encode($out), true);
        }
    }

    function getWishDetails($role_id,$user_id,$location_id,$fromDateDay,$fromDateMonth,$fromDateYear,$toDateDay,$toDateMonth,$toDateYear)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%') { $str.= " and a.location_id ='$location_id'"; }

            $isAdministratorAccess = $this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            $isOperationAdminAccess = $this->isUserLocationHavingOperationAdminAccess($user_id,$location_id);

            if(($role_id!='1') && ($role_id!=2) && ($isAdministratorAccess=='N') && ($isOperationAdminAccess=='N'))
            {
                $str.= " and a.created_by='$user_id'";
            }
           
            $fromDate = $this->string_to_date($fromDateDay,$fromDateMonth,$fromDateYear);
            $toDate = $this->string_to_date($toDateDay,$toDateMonth,$toDateYear);

            $out = DB::select("select a.*,concat(b.first_name,' ',b.last_name) as full_name from user_wish_master a,user_master b where a.created_at between '$fromDate' and '$toDate' and a.created_by=b.id $str");
          
            return json_decode(json_encode($out), true);
        }
    }

}