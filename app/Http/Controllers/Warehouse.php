<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Warehouse_class;

class Warehouse extends Controller
{
    public function __construct(Warehouse_class $warehouse) 
    {
        $this->warehouse = $warehouse;
    }

    public function index()
    {
        $output = $this->warehouse->showWarehouseList();

        return view('warehouse.index',compact('output'));
    }

    public function addNew()
    {
        $country = '101';

        $state = $this->warehouse->getStateList($country);
        
        return view('warehouse.new',compact('state'));
    }

    public function getCityList(Request $request)
    {
        $stateVal = $request->input('stateVal');

        $city = $this->warehouse->getCityList($stateVal);

        return $city;
    }

    public function getStateList(Request $request)
    {
        $CountyrVal = $request->input('CountyrVal');

        $state = $this->warehouse->getStateList($CountyrVal);

        return $state;
    }

    public function gettingCityStateCountry(Request $request)
    {
        $cityVal = $request->input('cityVal');

        $output = $this->warehouse->gettingCityStateCountry($cityVal);

        return $output;
    }

    public function save(Request $request)
    {
        // dd('AS');

        $user_id = Session::get('UID');

        $warehouse_name = request('warehouse_name');

        $warehouse_address = request('warehouse_address');

        $warehouseCity = request('warehouseCity');

        $primary_contact_first_name = request('primary_contact_first_name');

        $primary_contact_last_name = request('primary_contact_last_name');

        $primary_contact_mobile = request('primary_contact_mobile');

        $primary_contact_phone = request('primary_contact_phone');

        $primary_contact_email = request('primary_contact_email');

       $output = $this->warehouse->save($user_id,$warehouse_name,$warehouse_address,$warehouseCity,$primary_contact_first_name,$primary_contact_last_name,$primary_contact_mobile,$primary_contact_phone,$primary_contact_email);

        $data['message'] ='Warehouse Information Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
        $country = '101';

        $warehouseId = $request->segment(3);

        $output = $this->warehouse->getWarehouseInfoByWarehouseId($warehouseId);

        $state = $this->warehouse->getStateList($country);

       return view('warehouse.edit',compact('output','state'));
    }

    public function update(Request $request)
    {
        $user_id = Session::get('UID');

        // $warehouseId = request('warehouseId');

        $warehouseId = request('zdsad');

        $warehouse_name = request('warehouse_name');
       
        $warehouse_address = request('warehouse_address');

        $warehouseCity = request('warehouseCity');

        $primary_contact_first_name = request('primary_contact_first_name');

        $primary_contact_last_name = request('primary_contact_last_name');

        $primary_contact_mobile = request('primary_contact_mobile');

        $primary_contact_phone = request('primary_contact_phone');

        $primary_contact_email = request('primary_contact_email');

        $output = $this->warehouse->update($user_id,$warehouseId,$warehouse_name,$warehouse_address,$warehouseCity,$primary_contact_first_name,$primary_contact_last_name,$primary_contact_mobile,$primary_contact_phone,$primary_contact_email);

        $data['message'] ='Warehouse Information Added Successfully. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function getWarehouseList()
    {
        $output = $this->warehouse->showWarehouseList();

        return $output;
    }

}
