<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

//use DB;

use App\lib\Users;

use App\Http\Controllers\Config;

class Dashboard extends Controller
{

    public function __construct(Users $user) 
    {
        $this->user = $user;

        $this->url = '';
    }
    
    public function show()
    {
        $t_this = new Users;

        $user_id = Session::get('UID');

        $role_id = Session::get('role_id');

        $userEmailRegisteredLocation = $this->user->checkUseIDRegisteredLocation($user_id,$role_id);

        $countUserEmailRegisteredLocation = count($userEmailRegisteredLocation);

        if($countUserEmailRegisteredLocation > 0)
        {
            $locationId = $userEmailRegisteredLocation[0]['location_id'];

            $location_name = $userEmailRegisteredLocation[0]['location_name'];
        }
        else
        {
            $locationId = 0;
            $location_name='NA';
        }

        $gettingUserAllocatedRouteByLocationId = $t_this->gettingUserAllocatedRouteByLocationID($user_id,$locationId);

        $isUserLocationHavingAdministratorAccess = $t_this->isUserLocationHavingAdministratorAccess($user_id,$locationId);

        $isUserHavingSalesExecutive = $t_this->isUserHavingSalesExecutive($user_id);

        Session::put('URL',$gettingUserAllocatedRouteByLocationId);
        Session::put('location_id',$locationId);
        Session::put('location_name',$location_name);
        Session::put('is_admin_access_for_active_location',$isUserLocationHavingAdministratorAccess);
        Session::put('is_sales_executive_access_for_active_location',$isUserHavingSalesExecutive);

       	return view ('dashboard.index',compact('isUserLocationHavingAdministratorAccess','isUserHavingSalesExecutive'));
    }

    public static function isRouteExistForUser($route)
    {
        $url = Session::get('URL');

        $count = count($url);

        // $arr = array();
        $arr_val = array();

        foreach ($url as $key => $value) 
        {
           $arr_val[] = $value['url'];
        }

        // dd($arr_val);

        if(in_array($route, $arr_val))
        {
            return 'YES';
        }
        else
        {
            return 'NO';
        }
    }

    public function UserRouteByLatestLocation(Request $request)
    {
        $user_id = Session::get('UID');

        $locationId = $request->segment(3);

        Session::put('location_id',$locationId);

        Session::forget('is_admin_access_for_active_location');

        $t_this = new Users;

        $isUserLocationHavingAdministratorAccess = $t_this->isUserLocationHavingAdministratorAccess($user_id,$locationId);

        $isUserHavingSalesExecutive = $t_this->isUserHavingSalesExecutive($user_id);

        Session::put('is_admin_access_for_active_location',$isUserLocationHavingAdministratorAccess);

        Session::put('is_sales_executive_access_for_active_location',$isUserHavingSalesExecutive);

        return redirect()->route('index');
    }

    public function updatedUserRoute(Request $request)
    {
        //dd("updatedUserRoute");
        $t_this = new Users;

        Session::forget('URL');
        //Session::forget('location_id');

        $user_id = Session::get('UID');

        $locationId = Session::get('location_id');

        $gettingUserAllocatedRouteByLocationId = $t_this->gettingUserAllocatedRouteByLocationID($user_id,$locationId);

        $isUserLocationHavingAdministratorAccess = $t_this->isUserLocationHavingAdministratorAccess($user_id,$locationId);

        $isUserHavingSalesExecutive = $t_this->isUserHavingSalesExecutive($user_id);

        Session::put('URL',$gettingUserAllocatedRouteByLocationId);

        Session::put('location_id',$locationId);
        
        Session::put('is_sales_executive_access_for_active_location',$isUserHavingSalesExecutive);

        return view ('dashboard.Index',compact('isUserLocationHavingAdministratorAccess','isUserHavingSalesExecutive'));

    }
}