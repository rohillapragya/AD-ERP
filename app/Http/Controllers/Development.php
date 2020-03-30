<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Development_class;

use App\lib\Users;

class Development extends Controller
{
    public function __construct(Development_class $Development)  
    {
        $this->development = $Development;
    }
    // section for adding route or URL start here
        public function addRouteIndex()
        {
            $output = $this->development->getActiveURLList();

            return view ('development.routeIndex',compact('output'));
        }

        public function addNewURL(Request $request)
        {
            $url = $request->input('url');

            $output = $this->development->addNewURL($url);

            return $output;
        }

        public function getURL()
        {
            $output = $this->development->getActiveURLList();

            return $output;
        }

        public function editURL(Request $request)
        {
            $id = $request->input('id');

            $url = $request->input('url');

            $output = $this->development->editURL($id,$url);

            return $output;
        }
    // section for adding route or URL end  here

    
    // section for adding menu start here

        public function addMenuIndex()
        {
            $output = $this->development->getActiveMenuList();

            return view ('development.menuIndex',compact('output'));
        }

        public function addNewMenu(Request $request)
        {
            $menu = $request->input('menu');

            $output = $this->development->addNewMenu($menu);

            return $output;
        }

        public function getMenu()
        {
            $output = $this->development->getActiveMenuList();

            return $output;
        }

        public function editMenu(Request $request)
        {
            $id = $request->input('id');

            $menu = $request->input('menu');

            $output = $this->development->editMenu($id,$menu);

            return $output;
        }

        public function deleteMenu(Request $request)
        {
            $id = $request->input('id');

            $output = $this->development->deleteMenu($id);

            return $output;
        }

    // section for adding menu  end here


    // section for mapping route and menu start here

        public function menu_route_map()
        {
            $activeURLList = $this->development->getActiveURLList();

            $activeMenuList = $this->development->getActiveMenuList();

            $menuUrlMapList = $this->development->getMenuUrlMapList();
            
            return view ('development.menu_route_map',compact('activeMenuList','activeURLList','menuUrlMapList'));
        }

        public function addMenuURLMap(Request $request)
        {
            $menu_id = $request->input('menu_id');

            $url_id = $request->input('url_id');

            $output = $this->development->addMenuURLMap($menu_id,$url_id);

            return $output;
        }

        public function removeMenuUrlMap(Request $request)
        {
            $menu_id = $request->input('menu_id');

            $url_id = $request->input('url_id');

            $output = $this->development->removeMenuUrlMap($menu_id,$url_id);

            return $output;
        }
    // section for mapping route and menu start  end 


    // section for handling location section start here

        public function locationIndex()
        {
            $output = $this->development->getLocation();

            $t_this = new Users;

            $user_id = Session::get('UID');

            $location_id = Session::get('location_id');

            $isUserLocationHavingAdministratorAccess = $t_this->isUserLocationHavingAdministratorAccess($user_id,$location_id);

            return view ('development.locationIndex',compact('output','isUserLocationHavingAdministratorAccess'));
        }

        public function addNewLocation(Request $request)
        {
            $location = $request->input('location');

            $output = $this->development->addNewLocation($location);

            return $output;
        }

        public function getLocation()
        {
            $output = $this->development->getLocation();

            return $output;
        }

        public function editLocation(Request $request)
        {
            $id = $request->input('id');

            $location = $request->input('location');

            $output = $this->development->editLocation($id,$location);

            return $output;
        }

        public function deleteLocation(Request $request)
        {
            $id = $request->input('id');

            $output = $this->development->deleteLocation($id);

            return $output;
        }
    // section for handling location section end here    


    // section for handling region section start here
        public function regionIndex()
        {
            $output = $this->development->getRegion();

            return view ('development.regionIndex',compact('output'));
        }

        public function addNewRegion(Request $request)
        {
            $region = $request->input('region');

            $output = $this->development->addNewRegion($region);

            return $output;
        }

        public function getRegion()
        {
            $output = $this->development->getRegion();

            return $output;
        }

        public function editRegion(Request $request)
        {
            $id = $request->input('id');

            $region = $request->input('region');

            $output = $this->development->editRegion($id,$region);

            return $output;
        }

        public function changeRegionStatus(Request $request)
        {
            $id = $request->input('id');

            $status = $request->input('status');

            $output = $this->development->changeRegionStatus($id,$status);

            return $output;
        }
    // section for handling region section end here


    // section for region_location_map start here
        public function region_location_map()
        {
            $getRegion = $this->development->getRegion();

            $getLocation = $this->development->getLocation();

            $regionLocationMapList = $this->development->regionLocationMapList();
            
            return view ('development.region_location_map',compact('getRegion','getLocation','regionLocationMapList'));
        }

        public function addRegionLocationMap(Request $request)
        {
            $region_id = $request->input('region_id');

            $location_id = $request->input('location_id');

            $output = $this->development->addRegionLocationMap($region_id,$location_id);

            return $output;
        }

        public function removeRegionLocationMap(Request $request)
        {
            $region_id = $request->input('region_id');

            $location_id = $request->input('location_id');

            $output = $this->development->removeRegionLocationMap($region_id,$location_id);

            return $output;
        }

        public function deleteRegion(Request $request)
        {
            $id = $request->input('id');

            $output = $this->development->deleteRegion($id);

            return $output;
        }

    // section for region_location_map start here        
}