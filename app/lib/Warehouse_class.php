<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Warehouse_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showWarehouseList()
    {
        $out = DB::select("select a.id as id,a.name as name,a.address as address,a.city as city_id,a.is_active as is_active,a.created_at as created_at,a.created_by as created_by,b.name as city from warehouse_master a, city_master b where a.city = b.id order by a.name");

        return json_decode(json_encode($out), true);
    }

    function getWarehouseList()
    {
        $out = DB::select("select * from warehouse_master order by name desc");

        return json_decode(json_encode($out), true);
    }

    function getStateList($country_id)
    {
        $out = DB::select("select * from state_master where country_id ='$country_id' and is_active is NULL order by name");

        return json_decode(json_encode($out), true);
    }

    function getCityList($stateVal)
    {
        $out = DB::select("select * from city_master where state_id='$stateVal' order by name");

        return json_decode(json_encode($out), true);
    }


    function maxWarehouseMasterId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from warehouse_master");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
        
            return $value['max_id'];
        }
    }

    function maxWarehouseContactsDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from warehouse_contacts_details");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
        
            return $value['max_id'];
        }
    }

    function save($user_id,$warehouse_name,$warehouse_address,$warehouseCity,$primary_contact_first_name,$primary_contact_last_name,$primary_contact_mobile,$primary_contact_phone,$primary_contact_email)
    {
        
        $maxWarehouseMasterId = $this->maxWarehouseMasterId();

        $maxWarehouseContactsDetailsId = $this->maxWarehouseContactsDetailsId();

        $warehouse_master = DB::insert("insert into warehouse_master (id,name,address,city,is_active,created_at,created_by) values('$maxWarehouseMasterId','$warehouse_name','$warehouse_address','$warehouseCity','Y','$this->created_at','$user_id')");

        if(($primary_contact_first_name!='') || ($primary_contact_last_name!='') || ($primary_contact_mobile!='') || ($primary_contact_phone!='') || ($primary_contact_email!=''))
        {
            $warehouse_contacts_details = DB::insert("insert into warehouse_contacts_details (id,warehouse_id,primary_contacts_person_first_name,primary_contacts_person_last_name,primary_contacts_person_mobile,primary_contacts_person_phone_no,primary_contacts_person_email,created_at,created_by) values('$maxWarehouseContactsDetailsId','$maxWarehouseMasterId','$primary_contact_first_name','$primary_contact_last_name','$primary_contact_mobile','$primary_contact_phone','$primary_contact_email','$this->created_at','$user_id')");
        }
    }

    function getWarehouseInfoByWarehouseId($warehouseId)
    {
       // $out = DB::select("select * from warehouse_master a,warehouse_contacts_details b  where a.id='$warehouseId' and a.id=b.warehouse_id");

       $out = DB::select("select a.id as id, a.name as name,a.address as address,a.city as city,b.primary_contacts_person_first_name,b.primary_contacts_person_last_name,b.primary_contacts_person_mobile,b.primary_contacts_person_phone_no,b.primary_contacts_person_email,c.name as city_name,c.state_id as state_id from warehouse_master a,warehouse_contacts_details b,city_master c  where a.id='$warehouseId' and a.id=b.warehouse_id and a.city=c.id");

        return json_decode(json_encode($out), true);
    }

    function update($user_id,$warehouseId,$warehouse_name,$warehouse_address,$warehouseCity,$primary_contact_first_name,$primary_contact_last_name,$primary_contact_mobile,$primary_contact_phone,$primary_contact_email)
    {
        DB::update("update warehouse_master set name = '$warehouse_name',address = '$warehouse_address',city = '$warehouseCity',created_at = '$this->created_at',created_by = '$user_id' where id ='$warehouseId'");

        DB::update("update warehouse_contacts_details set primary_contacts_person_first_name = '$primary_contact_first_name',primary_contacts_person_last_name = '$primary_contact_last_name',primary_contacts_person_mobile = '$primary_contact_mobile',primary_contacts_person_phone_no = '$primary_contact_phone',primary_contacts_person_email = '$primary_contact_email' where warehouse_id ='$warehouseId'");
    }

    function gettingCityStateCountry($cityVal)
    {
        $out = DB::select("select a.id as city_code,a.name as city_name,b.id as state_code,b.name as state_name,c.id as country_id,c.name as city_name from  city_master a,state_master b,country_master c where a.id='$cityVal' and a.state_id=b.id and b.country_id=c.id");

        return json_decode(json_encode($out), true);
    }

}
