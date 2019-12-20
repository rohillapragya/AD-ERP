<?php
namespace App\lib;
 
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

use DB;

class PurchaseIndent_class 
{
    var $created_by;
	
    function __construct()
	{
        $this->info = null;
      
        $this->created_at =  date("Y/m/d");
    }

    function showPendingInquiryList()
    {
        //$out = DB::select("select a.*,b.first_name,b.last_name from inquiry_master a left join user_master b on a.sales_executive_id =b.id and a.status='PENDING'");
        
       // $out = DB::select("select pi.inquiry_no,pi.date,pi.status,pi.purchase_indent_number,pi.first_name,pi.last_name from(select a.id as inquiry_no,date,status,purchase_indent_number,b.first_name,b.last_name from(select id,date,status,type,sales_executive_id,'' as purchase_indent_number from inquiry_master  where status='PENDING') a left join user_master b on a.sales_executive_id=b.id union select inquiry_no,created_at as date,status,purchase_indent_id as purchase_indent_number ,'' as first_name,'' as last_name from purchase_indent) pi");

       // $out = DB::select("select pi.purchase_indent_id,pi.inquiry_no,pi.date,pi.status,pi.purchase_indent_number,pi.first_name,pi.last_name from ( select purchase_indent_id,a.id as inquiry_no,date,status,purchase_indent_number,b.first_name,b.last_name from (select '0' as purchase_indent_id,id,date,status,type,sales_executive_id,'' as purchase_indent_number from inquiry_master  where status='PENDING') a left join user_master b on a.sales_executive_id=b.id union select id as purchase_indent_id,inquiry_no,created_at as date,status,purchase_indent_id as purchase_indent_number ,'' as first_name,'' as last_name from purchase_indent) pi");

        $out = DB::select("select pi.purchase_indent_id,pi.inquiry_no,pi.date,pi.status,pi.purchase_indent_number,pi.first_name,pi.last_name,is_sample_request from ( select purchase_indent_id,a.id as inquiry_no,date,status,purchase_indent_number,b.first_name,b.last_name,is_sample_request from ( select '0' as purchase_indent_id,id,date,status,type,sales_executive_id,'' as purchase_indent_number,'N' as is_sample_request from inquiry_master where status='PENDING') a left join user_master b on a.sales_executive_id=b.id union select id as purchase_indent_id,inquiry_no,created_at as date,status,purchase_indent_id as purchase_indent_number ,'' as first_name,'' as last_name,IFNULL(is_sample_request,'NA') as is_sample_request from purchase_indent where status in ('PURCAHSE_INDENT_CREADTED','INQUIRY_DISCARD_DUE_STOCK_NOT_AVAILABLE','INQUIRY_REQUEST_FOR_SAMPLE','INQUIRY_PROCEED_WITHOUT_SAMPLE','INQUIRY_STOCK_IS_READY_FOR_DISPATCH','INQUIRY_STOCK_IS_NOT_READY_FOR_DISPATCH')) pi");

        return json_decode(json_encode($out), true);
    }


    function getPICount()
    {
         $out = DB::select("select count(*) as total from (select pi.purchase_indent_id,pi.inquiry_no,pi.date,pi.status,pi.purchase_indent_number,pi.first_name,pi.last_name,is_sample_request from ( select purchase_indent_id,a.id as inquiry_no,date,status,purchase_indent_number,b.first_name,b.last_name,is_sample_request from ( select '0' as purchase_indent_id,id,date,status,type,sales_executive_id,'' as purchase_indent_number,'N' as is_sample_request from inquiry_master where status='PENDING') a left join user_master b on a.sales_executive_id=b.id union select id as purchase_indent_id,inquiry_no,created_at as date,status,purchase_indent_id as purchase_indent_number ,'' as first_name,'' as last_name,IFNULL(is_sample_request,'NA') as is_sample_request from purchase_indent where status in ('PURCAHSE_INDENT_CREADTED','INQUIRY_DISCARD_DUE_STOCK_NOT_AVAILABLE','INQUIRY_REQUEST_FOR_SAMPLE','INQUIRY_PROCEED_WITHOUT_SAMPLE','INQUIRY_STOCK_IS_READY_FOR_DISPATCH','INQUIRY_STOCK_IS_NOT_READY_FOR_DISPATCH')) pi) purchase_indent");

        return json_decode(json_encode($out), true);
    }


    function maxPurchaseIndentID()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_indent");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }

    function purchase_indent_no()
    {
        $date_1 = date("Ymd");

        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_indent where created_at = '$this->created_at'");

        $result = json_decode(json_encode($out), true);

        foreach ($result as $key => $value) {
            $maxSampleNum = $value['max_id'];
        }

        if($maxSampleNum <10){
            $maxSampleNum = '0'.$maxSampleNum;
        }
        
        return 'NBT-PURCHASE-INDENT-'.$date_1.$maxSampleNum;
    }

    function savePI($inquiryNo,$user_id,$table_product_name,$table_product_method,$table_product_qty,$table_product_uom)
    {
       $maxPurchaseIndentID = $this->maxPurchaseIndentID();

       $purchaseIndentNo = $this->purchase_indent_no();

       $status = 'PURCAHSE_INDENT_CREADTED';

       $out = DB::insert("insert into purchase_indent (id,purchase_indent_id,inquiry_no,status,created_at,created_by) values('$maxPurchaseIndentID','$purchaseIndentNo','$inquiryNo','$status','$this->created_at','$user_id')");

       $countTable = count($table_product_name);

        foreach ($table_product_name as $key_code => $value_code) { $product_code[] = $value_code['product_code']; }

        foreach ($table_product_method as $key_method => $value_method) { $product_method[] = $value_method['method']; }

        foreach ($table_product_qty as $key_qty => $value_qty) { $product_qty[] = $value_qty['qty']; }

        foreach ($table_product_uom as $key_uom => $value_uom) { $product_uom[] = $value_uom['uom']; }

        for($i=0;$i<$countTable;$i++)
        {
            $product_code_sample = $product_code[$i];
     
            $product_method_sample = $product_method[$i];
        
            $product_qty_sample = $product_qty[$i];
         
            $product_uom_sample = $product_uom[$i];

            $maxPurchaseIndentDetailsId = $this->maxPurchaseIndentDetailsId();

            $out = DB::insert("insert into purchase_indent_details (id,purchase_indent_id,item_code,method,qty,uom) values('$maxPurchaseIndentDetailsId','$maxPurchaseIndentID','$product_code_sample','$product_method_sample','$product_qty_sample','$product_uom_sample')");
        }

        $out = DB::update("update inquiry_master set status='$status' where id='$inquiryNo'");

        $out = DB::update("update user_cart set status='$status' where inquiry_number='$inquiryNo'");
    }

    function maxPurchaseIndentDetailsId()
    {
        $out = DB::select("select COALESCE(max(id), 0) + 1 as max_id from purchase_indent_details");
        $result = json_decode(json_encode($out), true);
        foreach ($result as $key => $value) 
        {
            return $value['max_id'];
        }
    }


    function getPurchaseIndentDetails($piID)
    {
       // $out = DB::select("select a.*,b.*,c.name as product_name,c.scrientific_name,d.name as method_name,e.name as uom from purchase_indent a,purchase_indent_details b ,product_master c,product_method_master d,UOM_master e where a.id='$piID' and a.id=b.purchase_indent_id and b.item_code=c.code and b.method=d.id and b.uom=e.id");
       
       $out = DB::select("select a.*,b.id as purchase_indent_detail_id,b.purchase_indent_id as purchase_indent_master_id,b.qty as qty,c.name as product_name,c.scrientific_name,d.name as method_name,e.name as uom,b.item_code as product_code from purchase_indent a,purchase_indent_details b ,product_master c,product_method_master d,UOM_master e where a.id='$piID' and a.id=b.purchase_indent_id and b.item_code=c.code and b.method=d.id and b.uom=e.id");

        return json_decode(json_encode($out), true);
    }


    function getPurchaseIndentDetailsInfo($piID)
    {
        $out = DB::select("select * from purchase_indent_details where purchase_indent_id='$piID'");

        return json_decode(json_encode($out), true);
    }


    function action_save($user_id,$purchase_indent_id,$piArranagemnetPossible,$CustomerRequestForSample,$pi_remark,$proceedforDispatch,$inquiry_number)
    {
        if($piArranagemnetPossible=='N') {  $status='INQUIRY_DISCARD_DUE_STOCK_NOT_AVAILABLE';  }

        else {

            if($CustomerRequestForSample=='Y') { $status='INQUIRY_REQUEST_FOR_SAMPLE'; }
            else { $status='INQUIRY_PROCEED_WITHOUT_SAMPLE';}
        }

        $out = DB::update("update purchase_indent set remarks='$pi_remark',status='$status',is_ready_for_pre_dispatch_docx_list='$proceedforDispatch',is_arrangement_possible='$piArranagemnetPossible',is_sample_request='$CustomerRequestForSample',updated_by='$user_id',updated_at='$this->created_at' where id='$purchase_indent_id'");


        $out = DB::update("update inquiry_master set status='$status',modified_at='$this->created_at' where id='$inquiry_number'");

        $out = DB::update("update user_cart set status='$status',updated_at='$this->created_at' where inquiry_number='$inquiry_number'");

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
    
    function updateSampleInPurchaseIndent($pID)
    {
        $out = DB::update("update purchase_indent set sample_id='$this->sample_max_id',status='CUSTOMER_SAMPLE_REQUEST' where id='$pID'");
    }

}
