<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Product_class 
{
    var $id;
	var $info;
    var $session;
    var $sample_max_id;
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
       
        $this->created_at =  date("Y/m/d");
    }

    function getMethod()
    {
        $out = DB::select("select id,name from product_method_master");

        return json_decode(json_encode($out), true);
    }

    function getProuductList()
    {
        $out = DB::select("select code as id,concat(name,'( ',code ,' -  ',specification,')') as name from product_master where active='Y' order by name");

        return json_decode(json_encode($out), true);
    }

    function getUOM()
    {
        $out = DB::select("select id,name from UOM_master where is_active='Y' order by name");

        return json_decode(json_encode($out), true);
    }

    function maxSampleId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function maxSampleDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function customerSampleId($type)
    {
       // $date = date("d-m-Y");
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_master where created_at = '$this->created_at' and type='$type'");

      //  print_r("select COALESCE(max(id), 0) + 1 as max_id from sample_master where created_at = '$date' and type='$type'");
       // dd("-AS");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-SAMPLE-'.$type.'-'.$date_1.$maxSampleNum;
       
    }

    function maxSampleItemsDetails()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from sample_items_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

    function saveSampleRequestMaster($type,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear,$behalf_of,$user_id)
    {
        $this->sample_max_id = $this->maxSampleId();
        $this->created_by = $user_id;
        $sample_number = $this->customerSampleId($type);
    
        $request_date = $this->string_to_date($samplerequestDay,$samplerequestMonth,$samplerequestyear);
        $delivery_date = $this->string_to_date($sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear);
    
        $out = DB::insert("insert into sample_master (id,sample_number,type,request_date,delivered_date,status,any_behalf_of,created_at,created_by) values('$this->sample_max_id','$sample_number','$type','$request_date','$delivery_date','CUSTOMER_SAMPLE_REQUEST','$behalf_of','$this->created_at','$this->created_by')");
    }

    function saveSampleRequestDetails($full_name,$mobile,$email,$address,$imageName)
    {
        $sample_details_id = $this->maxSampleDetailsId();
        //$sample_id = $this->maxSampleId();
        $out = DB::insert("insert into sample_details (id,sample_id,ref_name,ref_address,ref_mobile,ref_email,attachment_1,created_at,created_by) values('$sample_details_id','$this->sample_max_id','$full_name','$address','$mobile','$email','$imageName','$this->created_at',' $this->created_by')");
    }

    function saveSampleItemDetails($sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom)
    {
       // $sample_items_id = $this->maxSampleItemsDetails();
       // $id = $this->maxSampleId();
        
        $countTable = count($sample_table_product_code);

        foreach ($sample_table_product_code as $key_code => $value_code) {
            $product_code[] = $value_code['product_code'];
        }

        foreach ($sample_table_product_method as $key_method => $value_method) {
            $product_method[] = $value_method['method'];
        }

        foreach ($sample_table_product_qty as $key_qty => $value_qty) {
            $product_qty[] = $value_qty['qty'];
        }

        foreach ($sample_table_product_uom as $key_uom => $value_uom) {
            $product_uom[] = $value_uom['uom'];
        }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
          //  echo "i-".$i."-product_code_sample-".$product_code_sample."\n";

            $product_method_sample = $product_method[$i];
           // echo "i-".$i."-product_method_sample-".$product_method_sample."\n";

            $product_qty_sample = $product_qty[$i];
          //  echo "i-".$i."-product_qty_sample-".$product_qty_sample."\n";

            $product_uom_sample = $product_uom[$i];
          //  echo "i-".$i."-product_uom_sample-".$product_uom_sample."\n";

            $max_id = $this->maxSampleItemsDetails();

            $out = DB::insert("insert into sample_items_details (id,sample_id,item_code,method,qunatity,uom) values('$max_id','$this->sample_max_id','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }
    }


    function getCustomerSampleList($role_id,$user_id)
    {
        if($role_id)
        {
            if($role_id=='3' || $role_id=='7')
            {
                $out = DB::select("select c.description as customer_status,a.*,b.* from sample_master a, sample_details b,process_status c  where a.status='CUSTOMER_SAMPLE_REQUEST' and a.id =b.sample_id and a.status=c.status");
    
            }
            else
            {
                $out = DB::select(" select c.description as customer_status,a.*,b.* from sample_master a, sample_details b,process_status c  where a.status='CUSTOMER_SAMPLE_REQUEST' and a.id =b.sample_id and a.created_by='$user_id' and a.status=c.status");
            }
           
            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }
    }


    function getCustomerSampleInfoBySampleId($sampleId)
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

       $out = DB::select("select g.first_name as user_first_name,g.last_name as user_last_name, e.name as method_name,f.name as uom_name,a.*,b.*,c.*,d.* from sample_master a,sample_details b, sample_items_details c,product_master d,product_method_master e,UOM_master f,user_master g  where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id and c.item_code=d.code and c.method=e.id and c.uom=f.id and a.created_by=g.id and g.is_active='Y'");
        
        return json_decode(json_encode($out), true);
    }


    function editSampleRequestMaster($sampleId,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear,$behalf_of,$user_id)
    {
        $this->created_by = $user_id;
        $request_date = $this->string_to_date($samplerequestDay,$samplerequestMonth,$samplerequestyear);
        $delivery_date = $this->string_to_date($sampledeliveryDay,$sampledeliveryMonth,$sampledeliveryyear);

        $out = DB::insert("update sample_master set request_date='$request_date',delivered_date='$delivery_date',any_behalf_of='$behalf_of',created_at='$this->created_at',created_by='$this->created_by' where id='$sampleId'");
    }


    function editSampleRequestDetails($sampleId,$full_name,$mobile,$email,$address,$imageName)
    {
        $out = DB::insert("update sample_details set ref_name='$full_name',ref_address='$address',ref_mobile='$mobile',ref_email='$email',attachment_1='$imageName',created_at='$this->created_at',created_by='$this->created_by' where sample_id='$sampleId'");
    }


    function editSampleItemDetails($sampleId,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom)
    {
        $out = DB::insert("delete from sample_items_details where sample_id='$sampleId'");

        $countTable = count($sample_table_product_code);

        foreach ($sample_table_product_code as $key_code => $value_code) {
            $product_code[] = $value_code['product_code'];
        }

        foreach ($sample_table_product_method as $key_method => $value_method) {
            $product_method[] = $value_method['method'];
        }

        foreach ($sample_table_product_qty as $key_qty => $value_qty) {
            $product_qty[] = $value_qty['qty'];
        }

        foreach ($sample_table_product_uom as $key_uom => $value_uom) {
            $product_uom[] = $value_uom['uom'];
        }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
          //  echo "i-".$i."-product_code_sample-".$product_code_sample."\n";

            $product_method_sample = $product_method[$i];
           // echo "i-".$i."-product_method_sample-".$product_method_sample."\n";

            $product_qty_sample = $product_qty[$i];
          //  echo "i-".$i."-product_qty_sample-".$product_qty_sample."\n";

            $product_uom_sample = $product_uom[$i];
          //  echo "i-".$i."-product_uom_sample-".$product_uom_sample."\n";

            $max_id = $this->maxSampleItemsDetails();

            $out = DB::insert("insert into sample_items_details (id,sample_id,item_code,method,qunatity,uom) values('$max_id','$sampleId','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }
    }

    function proceedForDispatch($sampleId,$user_id,$status)
    {
        $out = DB::insert("update sample_master set status='$status',updated_by='$user_id',updated_at='$this->created_at' where id='$sampleId'");
    }

    function getVendorSampleList()
    {
        $out = DB::select("select c.description as customer_status,a.*,b.* from sample_master a, sample_details b,process_status c  where a.status='VENDOR_SAMPLE_RECEIVED' and a.id =b.sample_id and a.status=c.status");

        return json_decode(json_encode($out), true);
    }


    function saveVendorSampleRequestMaster($type,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$samplereceivedDay,$samplereceivedMonth,$samplereceivedyear,$behalf_of,$user_id)
    {
        $this->sample_max_id = $this->maxSampleId();
        $this->created_by = $user_id;
        $sample_number = $this->customerSampleId($type);
    
        $request_date = $this->string_to_date($samplerequestDay,$samplerequestMonth,$samplerequestyear);
        $delivery_date = $this->string_to_date($samplereceivedDay,$samplereceivedMonth,$samplereceivedyear);
    

        $out = DB::insert("insert into sample_master (id,sample_number,type,request_date,received_date,status,any_behalf_of,created_at,created_by) values('$this->sample_max_id','$sample_number','$type','$request_date','$delivery_date','VENDOR_SAMPLE_RECEIVED','$behalf_of','$this->created_at','$this->created_by')");
    }

    function saveVendorSampleRequestDetails($full_name,$mobile,$email,$address,$imageName)
    {
        $sample_details_id = $this->maxSampleDetailsId();

        $out = DB::insert("insert into sample_details (id,sample_id,ref_name,ref_address,ref_mobile,ref_email,attachment_1,created_at,created_by) values('$sample_details_id','$this->sample_max_id','$full_name','$address','$mobile','$email','$imageName','$this->created_at',' $this->created_by')");
    }

    function saveVendorSampleItemDetails($sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom)
    {
        $getTypeOfDocName = gettype($sample_table_product_qty);
       // dd($getTypeOfDocName);

        if($getTypeOfDocName=='array')
        {
            $countTable = count($sample_table_product_code);

            foreach ($sample_table_product_code as $key_code => $value_code) {
                $product_code[] = $value_code['product_code'];
            }

            foreach ($sample_table_product_method as $key_method => $value_method) {
                $product_method[] = $value_method['method'];
            }

            foreach ($sample_table_product_qty as $key_qty => $value_qty) {
                $product_qty[] = $value_qty['qty'];
            }

            foreach ($sample_table_product_uom as $key_uom => $value_uom) {
                $product_uom[] = $value_uom['uom'];
            }

            for($i=0;$i<$countTable;$i++)
            {
                $product_code_sample = $product_code[$i];

                $product_method_sample = $product_method[$i];

                $product_qty_sample = $product_qty[$i];

                $product_uom_sample = $product_uom[$i];

                $max_id = $this->maxSampleItemsDetails();

                $out = DB::insert("insert into sample_items_details (id,sample_id,item_code,method,qunatity,uom) values('$max_id','$this->sample_max_id','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
            }
        }
    }


    function getVendorSampleInfoBySampleId($sampleId)
    {
        //$out = DB::select("select * from sample_master a,sample_details b, sample_items_details c where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id");

       $out = DB::select("select g.first_name as user_first_name,g.last_name as user_last_name, e.name as method_name,f.name as uom_name,a.*,b.*,c.*,d.* from sample_master a,sample_details b, sample_items_details c,product_master d,product_method_master e,UOM_master f,user_master g  where a.id='$sampleId' and a.id =b.sample_id and a.id = c.sample_id and c.item_code=d.code and c.method=e.id and c.uom=f.id and a.created_by=g.id and g.is_active='Y'");
        
        return json_decode(json_encode($out), true);
    }


    function editVendorSampleRequestMaster($sampleId,$samplerequestDay,$samplerequestMonth,$samplerequestyear,$samplereceivedDay,$samplereceivedMonth,$samplereceivedyear,$behalf_of,$user_id)
    {
        $this->created_by = $user_id;
        $request_date = $this->string_to_date($samplerequestDay,$samplerequestMonth,$samplerequestyear);
        $delivery_date = $this->string_to_date($samplereceivedDay,$samplereceivedMonth,$samplereceivedyear);

        $out = DB::insert("update sample_master set request_date='$request_date',received_date='$delivery_date',any_behalf_of='$behalf_of',created_at='$this->created_at',created_by='$this->created_by' where id='$sampleId'");
    }


    function editVendorSampleRequestDetails($sampleId,$full_name,$mobile,$email,$address,$imageName)
    {
        $out = DB::insert("update sample_details set ref_name='$full_name',ref_address='$address',ref_mobile='$mobile',ref_email='$email',attachment_1='$imageName',created_at='$this->created_at',created_by='$this->created_by' where sample_id='$sampleId'");
    }


    function editVendorSampleItemDetails($sampleId,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom)
    {
        $out = DB::insert("delete from sample_items_details where sample_id='$sampleId'");

        $countTable = count($sample_table_product_code);

        foreach ($sample_table_product_code as $key_code => $value_code) {
            $product_code[] = $value_code['product_code'];
        }

        foreach ($sample_table_product_method as $key_method => $value_method) {
            $product_method[] = $value_method['method'];
        }

        foreach ($sample_table_product_qty as $key_qty => $value_qty) {
            $product_qty[] = $value_qty['qty'];
        }

        foreach ($sample_table_product_uom as $key_uom => $value_uom) {
            $product_uom[] = $value_uom['uom'];
        }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
          //  echo "i-".$i."-product_code_sample-".$product_code_sample."\n";

            $product_method_sample = $product_method[$i];
           // echo "i-".$i."-product_method_sample-".$product_method_sample."\n";

            $product_qty_sample = $product_qty[$i];
          //  echo "i-".$i."-product_qty_sample-".$product_qty_sample."\n";

            $product_uom_sample = $product_uom[$i];
          //  echo "i-".$i."-product_uom_sample-".$product_uom_sample."\n";

            $max_id = $this->maxSampleItemsDetails();

            $out = DB::insert("insert into sample_items_details (id,sample_id,item_code,method,qunatity,uom) values('$max_id','$sampleId','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }
    }

    function getProductCategory()
    {
        $out = DB::select("select * from product_category_master");

        return json_decode(json_encode($out), true);
    }

}