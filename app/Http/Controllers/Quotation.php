<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Quotation_class;

use App\lib\Product_class;

use App\lib\user_registration;

class Quotation extends Controller
{
    public function __construct(Quotation_class $quotation,Product_class $product,User_Registration $user_registration)  
    {
        $this->quotation = $quotation;

        $this->product = $product;

        $this->user_registration = $user_registration;
    }

    /*Puchase Request section start here*/
        public function index()
        {
            $location_id = Session::get('location_id');

            $output = $this->quotation->verifyPRNList($location_id);

            return view('quotation.index',compact('output'));
        }

        public function add(Request $request)
        {
            $pID = $request->segment(2);

            $output = $this->quotation->gettingVerifyPRNDetails($pID);

            $product = $this->product->getProuductList();

            $method = $this->product->getMethod();

            $uom = $this->product->getUOM();

            return view('quotation.add',compact('output','product','method','uom'));
        }

        public function save(Request $request)
        {
            $user_id = Session::get('UID');
            $location_id = Session::get('location_id');

            $quotationRequestDay = request('quotationRequestDay');
            $quotationRequestMonth = request('quotationRequestMonth');
            $quotationRequestYear = request('quotationRequestYear');
            $quotationDeliveryDay = request('quotationDeliveryDay');
            $quotationDeliveryMonth = request('quotationDeliveryMonth');
            $quotationDeliveryYear = request('quotationDeliveryYear');
            $quotation_remark = request('quotation_remark');
            $product_name = request('product_name');
            $product_method = request('product_method');
            $product_qty = request('product_qty');
            $product_uom = request('product_uom');
            $prnid = request('prnid');

            $output = $this->quotation->save($user_id,$quotationRequestDay,$quotationRequestMonth,$quotationRequestYear,$quotationDeliveryDay,$quotationDeliveryMonth,$quotationDeliveryYear,$quotation_remark,$product_name,$product_method,$product_qty,$product_uom,$prnid,$location_id);

            $data['message'] ='Quotation Details Added Successfully. Go to  Dashboard using button';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }
    /*Puchase Request section start here*/

    
    /* Added by Pragya dated on 10-Feb Vendor Quotation Section start here*/

        public function vendorQuotationInit(Request $request)
        {
            $location_id = Session::get('location_id');

            $output = $this->quotation->getVendorQuotation($location_id);

            return view('quotation.vendor_init',compact('output'));
        }

        public function vendorQuotationAdd(Request $request)
        {
            $qID = $request->segment(2);

            $location_id = Session::get('location_id');

            $output = $this->quotation->getQuotationDetails($qID,$location_id);

            $getQuotationMasterDetails = $this->quotation->getQuotationMasterDetails($qID,$location_id);

            $vendorList = $this->user_registration->getVendorList();

            $product = $this->product->getProuductList();

            $method = $this->product->getMethod();

            $uom = $this->product->getUOM();

            $country_id ='101';

            $state_id = '1';

            $country = $this->user_registration->getCustomerCountyList();

            $state = $this->user_registration->getStateList($country_id);

            $city = $this->user_registration->getCityList($state_id);

            //dd($getQuotationMasterDetails);

            //dd($output);

           return view('quotation.vendor_add',compact('output','product','method','uom','getQuotationMasterDetails','vendorList','country','state','city'));
        }

        public function addSupplier(Request $request)
        {
            $location_id = Session::get('location_id');
            $user_id = Session::get('UID');

            $supplier_first_name = $request->input('supplier_first_name_val');
            $supplier_last_name = $request->input('supplier_last_name_val');
            $supplier_address = $request->input('supplier_address_val');
            $supplier_address_city_name = $request->input('supplier_address_city_name_val');
            $offical_mobile = $request->input('offical_mobile_val');
            $offical_email = $request->input('offical_email_val');
            $personal_mobile = $request->input('personal_mobile_val');
            $personal_email = $request->input('personal_email_val');

            $output = $this->quotation->addSupplier($location_id,$user_id,$supplier_first_name,$supplier_last_name,$supplier_address,$supplier_address_city_name,$offical_mobile,$offical_email,$personal_mobile,$personal_email);

            return $output;
        }

        public function getquotataionProductDetails(Request $request)
        {
            $qID = $request->input('qID');

            $location_id = Session::get('location_id');

            $getQuotationMasterDetails = $this->quotation->getQuotationMasterDetails($qID,$location_id);
           
            return $getQuotationMasterDetails;
        }

        public function saveQuotation(Request $request)
        {
            $location_id = Session::get('location_id');
            $user_id = Session::get('UID');

            $quotationid = $request->input('quotationid');
            $type = $request->input('type');
            $type_id = $request->input('type_id');
            $product_name = $request->input('product_name');
            $product_method = $request->input('product_method');
            $product_qty = $request->input('product_qty');
            $product_uom = $request->input('product_uom');
            $product_price = $request->input('product_price');
            $product_price_valid_till = $request->input('product_price_valid_till');
            $product_approx_delivery_day = $request->input('product_approx_delivery_day');

           // dd($product_approx_delivery_day);

            $output = $this->quotation->saveQuotation($location_id,$user_id,$quotationid,$type,$type_id,$product_name,$product_method,$product_qty,$product_uom,$product_price,$product_price_valid_till,$product_approx_delivery_day);

            $data['message'] ='Vendor Supplier Quotation Added Successfully. Go to  Dashboard using button';
            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function viewQuotation(Request $request)
        {
            $qID = $request->segment(3);

            dd($qID);
        }

    /* Added by Pragya dated on 10-Feb Vendor Quotation Section end  here*/
}