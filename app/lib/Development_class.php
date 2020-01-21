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

        function getActiveMenuList()
        {
            $out = DB::select("select * from app_menu_set order by name");
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
                 $out = DB::insert("insert into app_menu_set (id,name) values('$maxMenuSetId','$menu')");
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
                $out = DB::insert("insert into app_menu_url_map (menu_id,url_id) values('$menu_id','$url_id')");
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
            $out = DB::select("select * from app_location_master order by location");

            return json_decode(json_encode($out), true);
        }

        function addNewLocation($location)
        {
            $maxLocationID = $this->maxLocationID();

            $out = DB::select("select count(*) as max_id from app_location_master where location = '$location'");

            $result = json_decode(json_encode($out), true);

            foreach ($result as $key => $value) {
                $max = $value['max_id'];
            }

            if($max ==0){
                $out = DB::insert("insert into app_location_master(id,location,is_active) values('$maxLocationID','$location','Y')");
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

    // section for handling location section end here      

}