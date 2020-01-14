<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Development_class;


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

    // section for adding menu  end here


    // section for mapping route and menu start here

        public function menu_route_map()
        {
            // $activeURLList = $this->development->getActiveURLList();

            $activeMenuList = $this->development->getActiveMenuList();

            
            return view ('development.menu_route_map',compact('activeMenuList'));
        }

    // section for mapping route and menu start  end 

}