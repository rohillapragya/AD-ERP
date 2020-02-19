<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Development_class 
{
    var $created_by;
	
    function __construct()
	{      
        $this->created_at =  date("Y/m/d");
    }

    // section for  route or URL start here
        function getActiveURLList()
        {
            $out = DB::select("select * from app_urls order by url");
            return json_decode(json_encode($out), true);
        }

        function maxAPPUrlsId()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from app_urls");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        }

        function addNewURL($url)
        {
            $maxAPPUrlsId = $this->maxAPPUrlsId();

            $out = DB::select("select count(*) as max_id from app_urls where url = '$url'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $maxURL = $value['max_id'];
            }

            if($maxURL ==0){
                 $out = DB::insert("insert into app_urls (id,url) values('$maxAPPUrlsId','$url')");
            }
        }

        function editURL($id,$url)
        {
            $out = DB::select("select count(*) as max_id from app_urls where url = '$url'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $maxURL = $value['max_id'];
            }

            if($maxURL ==0){
                 $out = DB::insert("update app_urls set url='$url' where id='$id'");
            }
        }
    // section for route or URL end  here

    
    // section for  menu start here

        function getFullMenuList()
        {
            $out = DB::select("select * from app_menu_set where is_active='Y' order by name");
            return json_decode(json_encode($out), true);
        }

        function getActiveMenuList()
        {
            $out = DB::select("select * from app_menu_set where id not in ('0') and is_active='Y' order by name");
            return json_decode(json_encode($out), true);
        }


        function maxMenuSetId()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from app_menu_set");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        }


        function addNewMenu($menu)
        {
            $maxMenuSetId = $this->maxMenuSetId();

            $out = DB::select("select count(*) as max_id from app_menu_set where name = '$menu'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $maxMenu = $value['max_id'];
            }

            if($maxMenu ==0){
                 $out = DB::insert("insert into app_menu_set (id,name,is_active) values('$maxMenuSetId','$menu','Y')");
            }

            else
            {
                $out = DB::select("select is_active,id from app_menu_set where name = '$menu'");

                $result = json_decode(json_encode($out), true);

                foreach ($result as $key => $value) {
                    $is_active = $value['is_active'];
                    $menu_id = $value['id'];
                }

                if($is_active =='N'){
                    $out = DB::update("update app_menu_set set is_active='Y' where id='$menu_id'");
                } 
            } 

        }


        function editMenu($id,$menu)
        {
            $out = DB::select("select count(*) as max_id from app_menu_set where name = '$menu'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $maxMenu = $value['max_id'];
            }

            if($maxMenu ==0){
                 $out = DB::insert("update app_menu_set set name='$menu' where id='$id'");
            }
        }


        function deleteMenu($id)
        {
            $out = DB::update("update app_menu_set set is_active='N' where id='$id'");

            $out_1 = DB::update("update app_menu_url_map set is_active='N' where menu_id='$id'");

            return json_decode(json_encode($out), true);
        }

    // section for  menu  end here

    // section for mapping menu and url start here

        function getMenuUrlMapList()
        {
           // $out = DB::select("select * from app_menu_url_map");
           
            $out = DB::select("select a.menu_id,a.url_id,b.url from app_menu_url_map a,app_urls b where a.url_id=b.id order by a.menu_id");

            return json_decode(json_encode($out), true);
        }

        function addMenuURLMap($menu_id,$url_id)
        {
            $out = DB::select("select count(*) as max_id from app_menu_url_map where menu_id = '$menu_id' and url_id= '$url_id'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::insert("insert into app_menu_url_map (menu_id,url_id,is_active) values('$menu_id','$url_id','Y')");
            }
        }

        function removeMenuUrlMap($menu_id,$url_id)
        {
            $out = DB::delete("delete from app_menu_url_map where menu_id='$menu_id' and url_id='$url_id'");
        }
    // section for mapping menu and url end here


    // section for handling location section start here

        function maxLocationID()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from app_location_master");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        } 

        function getLocation()
        {
            $out = DB::select("select * from app_location_master where is_active='Y' order by location");

            return json_decode(json_encode($out), true);
        }

        function addNewLocation($location)
        {
            /* Logic updated by Pragya dated on 29-jan-20.. 1- first it will check whether location is exist or not. if not exist then insert the value into it.. Second if location exit and in active state it will deny the location.. id location is exist and in In-Active condition status will update the status with active status*/

            $maxLocationID = $this->maxLocationID();

            $out = DB::select("select count(*) as max_id from app_location_master where location = '$location'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::insert("insert into app_location_master(id,location,is_active) values('$maxLocationID','$location','Y')");
            }  
            else
            {
                $out = DB::select("select is_active,id from app_location_master where location = '$location'");

                $result = json_decode(json_encode($out), true);

                foreach ($result as $key => $value) {
                    $is_active = $value['is_active'];
                    $location_id = $value['id'];
                }

                if($is_active =='N'){
                    $out = DB::update("update app_location_master set is_active='Y' where id='$location_id'");
                } 
            }  
        }

        function editLocation($id,$location)
        {
            $out = DB::select("select count(*) as max_id from app_location_master where location = '$location'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::update("update app_location_master set location='$location' where id='$id'");
            }
        }

        function deleteLocation($id)
        {
            $out = DB::update("update app_location_master set is_active='N' where id='$id'");

            return json_decode(json_encode($out), true);
        }

    // section for handling location section end here      


    // section for handling access section start here

        function getAccess()
        {
           // $out = DB::select("select * from app_access_master order by name desc");
            $out = DB::select("select * from app_access_master where id not in ('E','O') order by name desc");
            
            return json_decode(json_encode($out), true);
        }

        function getFullAccessList()
        {
            $out = DB::select("select * from app_access_master where id not in ('E') order by name desc");
            
            return json_decode(json_encode($out), true);
        }
    // section for handling access section end here


    // section for handling region section start here
        function getRegion()
        {
            $out = DB::select("select * from app_region_master  where is_active='Y' order by region");

            return json_decode(json_encode($out), true);
        }

        function maxRegionID()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from app_region_master");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        } 

        function addNewRegion($region)
        {
            
            /* Logic updated by Pragya dated on 29-jan-20.. 1- first it will check whether location is exist or not. if not exist then insert the value into it.. Second if location exit and in active state it will deny the location.. id location is exist and in In-Active condition status will update the status with active status*/

            $maxRegionID = $this->maxRegionID();

            $out = DB::select("select count(*) as max_id from app_region_master where region = '$region'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::insert("insert into app_region_master(id,region,is_active) values('$maxRegionID','$region','Y')");
            } 
            else
            {
                $out = DB::select("select is_active,id from app_region_master where region = '$region'");

                $result = json_decode(json_encode($out), true);

                foreach ($result as $key => $value) {
                    $is_active = $value['is_active'];
                    $region_id = $value['id'];
                }

                if($is_active =='N'){
                    $out = DB::update("update app_region_master set is_active='Y' where id='$region_id'");
                } 
            } 
        }

        function editRegion($id,$region)
        {
            $out = DB::select("select count(*) as max_id from app_region_master where region = '$region'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::update("update app_region_master set region='$region' where id='$id'");
            }
        }

        function changeRegionStatus($id,$status)
        {
            $out = DB::update("update app_region_master set is_active='$status' where id='$id'");
        }

        function regionLocationMapList()
        {
            $out = DB::select("select a.region_id,a.location_id,b.location from app_region_location_map a,app_location_master b where a.location_id=b.id and a.is_active='Y' order by a.region_id");

            return json_decode(json_encode($out), true);
        }

        function addRegionLocationMap($region_id,$location_id)
        {
            $out = DB::select("select count(*) as max_id from app_region_location_map where region_id = '$region_id' and location_id='$location_id' and is_active='Y'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::insert("insert into app_region_location_map(region_id,location_id,is_active) values('$region_id','$location_id','Y')");
            }    
        }

        function removeRegionLocationMap($region_id,$location_id)
        {
            $out = DB::delete("delete from app_region_location_map where region_id = '$region_id' and location_id='$location_id'");
            return json_decode(json_encode($out), true);
        }

        function deleteRegion($id)
        {
            $out = DB::update("update app_region_master set is_active='N' where id='$id'");

            $out_1 =  DB::update("update app_region_location_map set is_active='N' where region_id='$id'");

            return json_decode(json_encode($out), true);
        }

    // section for handling region section end  here    

}