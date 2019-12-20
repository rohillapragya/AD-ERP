<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Wish_Master_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showWishList($role_id,$user_id)
    {
        if($role_id=='3') /*Role id 3 for adminsitrator... If role is administrator he /she can see every wish list otherwise will see indvisual*/
        {
            $out = DB::select("select a.*,b.first_name,b.last_name from user_wish_master a,user_master b where a.user_id=b.id and status='WISH-CREATED'");
        }
        else
        {
            $out = DB::select("select a.*,b.first_name,b.last_name from user_wish_master a,user_master b where a.user_id=b.id and a.created_by='$user_id' and status='WISH-CREATED'");
        }
        
        return json_decode(json_encode($out), true);
    }


    function getWishCount($role_id,$user_id)
    {
        if($role_id=='3') /*Role id 3 for adminsitrator... If role is administrator he /she can see every wish list otherwise will see indvisual*/
        {
            $out = DB::select("select count(*) as total from user_wish_master a,user_master b where a.user_id=b.id and status='WISH-CREATED'");
        }
        else
        {
            $out = DB::select("select count(*) as total from user_wish_master a,user_master b where a.user_id=b.id and a.created_by='$user_id' and status='WISH-CREATED'");
        }
        
        return json_decode(json_encode($out), true);
    }



    function getActiveUOM()
    {
        $out = DB::select("select * from UOM_master where is_active='Y'");
        return json_decode(json_encode($out), true);
    }

    function maxUserWishMmasterID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_wish_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function wish_number()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from user_wish_master where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-WISH-'.$date_1.$maxSampleNum;
    }

    function addWish($user_id,$imageName,$wish_name,$wish_description,$wish_method,$wish_application,$wish_qty,$wish_other_info)
    {
        $maxUserWishMmasterID = $this->maxUserWishMmasterID();
        $wish_number = $this->wish_number();
        $status ='WISH-CREATED';

        $out = DB::insert("insert into user_wish_master(id,wish_id,user_id,name,description,method,application,qunatity,image,status,created_at,created_by,other_info) values('$maxUserWishMmasterID','$wish_number','$user_id','$wish_name','$wish_description','$wish_method','$wish_application','$wish_qty','$imageName','$status','$this->created_at','$user_id','$wish_other_info')");
    }

    function gettingWishDetails($wishId)
    {
        $out = DB::select("select * from user_wish_master where id='$wishId'");
        return json_decode(json_encode($out), true);
    }

    function editWish($user_id,$wishId,$imageName,$wish_name,$wish_description,$wish_method,$wish_application,$wish_qty,$wish_other_info)
    {
        $out = DB::update("update user_wish_master set name='$wish_name',description='$wish_description',method='$wish_method',application='$wish_application',qunatity='$wish_qty',image='$imageName',other_info='$wish_other_info',updated_by='$user_id',updated_at='$this->created_at' where id='$wishId'");
    }

    function removeWishImage($updated_by,$wishId)
    {
        DB::update("update user_wish_master set image=NULL,updated_at='$this->created_at' where id='$wishId'");
    }


    function getWishFullDetailsbyWishId($wishId)
    {
        $out = DB::select("select a.*,b.first_name,b.last_name,c.name as method_name from user_wish_master a,user_master b,product_method_master c where a.user_id=b.id and a.id='$wishId' and a.method=c.id");

        return json_decode(json_encode($out), true);
    }

    function discardProduct($wishId)
    {
        $status = 'WISH-DISCARD';

        DB::update("update user_wish_master set status='$status',updated_at='$this->created_at' where id='$wishId'");
    }
}