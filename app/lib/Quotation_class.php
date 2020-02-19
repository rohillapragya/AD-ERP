<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class Quotation_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function verifyPRNList($location_id)
    {
        $str = 'and 1=1 ';

        if($location_id)
        {
            if($location_id!='%')
            {
                $str.= " and a.location_id ='$location_id'";
            }

            //$out = DB::select("select * from purchase_request_note a where a.is_verifed_from_purchase_dept='Y' and a.status ='PURCHASE_REQUIZATION_NOTE_VERIFIED' $str");
            
            $out = DB::select("select a.*,b.first_name,b.last_name from purchase_request_note a,user_master b where a.is_verifed_from_purchase_dept='Y' and a.status ='PURCHASE_REQUIZATION_NOTE_VERIFIED' and a.created_by=b.id $str");

            return json_decode(json_encode($out), true);
        }
        else
        {
            return redirect()->route('login');
        }  
    }

    function gettingVerifyPRNDetails($pID)
    {
        $out = DB::select("select * from purchase_request_note_details where purchase_entry_id ='$pID'");

       // $out = DB::select("select * from purchase_request_note a,purchase_request_note_details b where a.id ='$pID' and a.id=b.purchase_entry_id");

        return json_decode(json_encode($out), true);
    }

    function string_to_date($day,$month,$year)
    {
        $odate = "$day-$month-$year";
        return date("Y/m/d", strtotime($odate));
    }

     function maxQuotationRequestNoteID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_master");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function quotation_request_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_master where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-QUOTATION-'.$date_1.$maxSampleNum;
    }


    function maxQuotationDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from quotation_request_items_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function save($user_id,$quotationRequestDay,$quotationRequestMonth,$quotationRequestYear,$quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear,$quotation_remark,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$prn_no,$location_id)
    {
        $maxQuotationRequestNoteID = $this->maxQuotationRequestNoteID();
        $quotationRequestNo = $this->quotation_request_no();
        $requestDate =  $this->string_to_date($quotationRequestDay,$quotationRequestMonth,$quotationRequestYear);
        $deliveryDate =  $this->string_to_date($quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear);
        $status = 'PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED';

        $out = DB::insert("insert into quotation_request_master (id,quotation_no,PRN_no,request_date,delivery_date,status,other_info,created_at,created_by,location_id) values('$maxQuotationRequestNoteID','$quotationRequestNo','$prn_no','$requestDate','$deliveryDate','$status','$quotation_remark','$this->created_at','$user_id','$location_id')");

        $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_quotation = $product_code[$i];
     
            $product_method_quotation = $product_method[$i];
        
            $product_qty_quotation = $product_qty[$i];
         
            $product_uom_quotation = $product_uom[$i];

            $maxQuotationDetailsId = $this->maxQuotationDetailsId();

            $out = DB::insert("insert into quotation_request_items_details (id,quotation_request_id,item_code,method,qty,UOM,created_by) values('$maxQuotationDetailsId','$maxQuotationRequestNoteID','$product_code_quotation','$product_method_quotation','$product_qty_quotation','$product_uom_quotation','$user_id')");
        }

        $o = DB::update("update purchase_request_note set status='$status' where id='$prn_no'");
    }

    
    /* Added by Pragya dated on 10-Feb Vendor Quotation Section start here*/

        function getVendorQuotation($location_id)
        {
            $str = 'and 1=1 ';

            if($location_id)
            {
                if($location_id!='%')
                {
                    $str.= " and a.location_id ='$location_id'";
                }
                
               // $out = DB::select("select a.*,b.first_name,b.last_name from quotation_request_master a, user_master b where a.status='PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED' and a.created_by=b.id $str");

                $out = DB::select("select a.*,b.first_name,b.last_name from quotation_request_master a, user_master b where a.created_by=b.id $str");

                return json_decode(json_encode($out), true);
            }

        }

        function getQuotationDetails($qID,$location_id)
        {
            $str = 'and 1=1 ';

            if($location_id)
            {
                if($location_id!='%')
                {
                    $str.= " and a.location_id ='$location_id'";
                }
                
                $out = DB::select("select * from quotation_request_master a,quotation_request_items_details b where a.id='$qID' and a.id=b.quotation_request_id $str");

                return json_decode(json_encode($out), true);
            }
        }

        function getQuotationMasterDetails($qID,$location_id)
        {
            $str = 'and 1=1 ';

            if($location_id)
            {
                if($location_id!='%')
                {
                    $str.= " and a.location_id ='$location_id'";
                }

                $out = DB::select("select a.*,b.*,c.name as product_name,c.scrientific_name as scrientific_name,c.specification,c.application,d.name as method_name,e.name as uom_name from quotation_request_master a,quotation_request_items_details b,product_master c,product_method_master d,UOM_master e where a.id='$qID' and a.id=b.quotation_request_id and b.item_code=c.code and b.method=d.id and b.UOM=e.id $str");

                return json_decode(json_encode($out), true);
            }    
        }


        function maxSupplierMasterId()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from Supplier_Master");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        }

        function addSupplier($location_id,$user_id,$supplier_first_name,$supplier_last_name,$supplier_address,$supplier_address_city_name,$offical_mobile,$offical_email,$personal_mobile,$personal_email)
        {
            $maxSupplierMasterId = $this->maxSupplierMasterId();

            $out = DB::insert("insert into Supplier_Master(id,first_name,last_name,address,city,mobile,phone,offical_email,personal_email,location_id,created_at,created_by) values('$maxSupplierMasterId','$supplier_first_name','$supplier_last_name','$supplier_address','$supplier_address_city_name','$offical_mobile','$personal_mobile','$offical_email','$personal_email','$location_id','$this->created_at','$user_id')");

            return json_decode(json_encode($out), true);
        }


        function maxSupplierQuotationDetailsID()
        {
            $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from supplier_quotation_details");
            $result = json_decode(json_encode($out), true);
            foreach ($result as $key => $value) 
            {
                return $value['max_id'];
            }
        }


        function saveQuotation($location_id,$user_id,$quotationid,$table_type,$table_type_id,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom,$table_product_price,$table_product_price_valid_till,$table_product_approx_delivery_day)
        {
            $countTable = count($table_type);

            $status= 'PURCHASE_REQUISTION_NUMBER_QUTATION_RECEIVED';

            foreach ($table_type as $key_type => $value_type) { $supplier_vendor_type[] = $value_type['supplier_vendor_type']; }

            foreach ($table_type_id as $key_type_id => $value_type_id) { $supplier_vendor_type_id[] = $value_type_id['supplier_vendor_id']; }

            foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

            foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

            foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

            foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

            foreach ($table_product_price as $key_price => $value_price) { $product_price[] = $value_price['price']; }

            foreach ($table_product_price_valid_till as $key_price_till => $value_price_till) { $product_price_till[] = $value_price_till['price_valid_till']; }

            foreach ($table_product_approx_delivery_day as $key_approx_deivery_day => $value_approx_deivery_day) { $product_approx_deivery_day[] = $value_approx_deivery_day['approx_delivery_day']; }


            for($i=0;$i<$countTable;$i++)
            {
                $product_supplier_vendor_type = $supplier_vendor_type[$i];

                $product_supplier_vendor_type_id = $supplier_vendor_type_id[$i];

                $product_code_sample = $product_code[$i];
         
                $product_method_sample = $product_method[$i];
            
                $product_qty_sample = $product_qty[$i];
             
                $product_uom_sample = $product_uom[$i];

                $product_product_price = $product_price[$i];
                
                $product_priceTill = $product_price_till[$i];

                $product_approx_delivery_day = $product_approx_deivery_day[$i];

                $maxSupplierQuotationDetailsID = $this->maxSupplierQuotationDetailsID();

                $out = DB::insert("insert into supplier_quotation_details(id,supplier_vendor_type,supplie_vendor_id,quotation_id,item_id,method,qty,UOM,price,price_valid_till,approx_delivery_day,is_active,created_at,created_by,location_id) values('$maxSupplierQuotationDetailsID','$product_supplier_vendor_type','$product_supplier_vendor_type_id','$quotationid','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample','$product_product_price','$product_priceTill','$product_approx_delivery_day','Y','$this->created_at','$user_id','$location_id')");
            }

            $out = DB::update("update quotation_request_master set status='$status' where id='$quotationid'");

            return json_decode(json_encode($out), true);
        }

    /* Added by Pragya dated on 10-Feb Vendor Quotation Section end  here*/

}