<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\lib\Inquiry_class;

use App\lib\Product_class;

use Illuminate\Support\Facades\Session;

use App\lib\Users;

use App\lib\user_registration;


class Inquiry extends Controller
{

    public function __construct(Inquiry_class $inquiry,Product_class $product,Users $user,User_Registration $user_registration) 
    {
        $this->inquiry = $inquiry;

        $this->product = $product;

        $this->user = $user;

        $this->user_registration = $user_registration;
    }
   
   	public function index()
   	{
      $user_id = Session::get('UID');

      $this->user->createCart($user_id);

   		$getCategoryList = $this->product->activeCategoryList();

   		return view('inquiry.index',compact('getCategoryList'));
   	}

   	public function addProductInCart(Request $request)
   	{
      $user_id = Session::get('UID');

      $product_id = $request->input('product_id');

      $product_qty = $request->input('product_qty');

      $cart_id = $request->input('cart_id');

      $out = $this->inquiry->addProductInCart($cart_id,$product_id,$product_qty,$user_id);

      $output = $this->inquiry->getCartCountByCartId($cart_id);

      return $output;
   	}

   	public function getCartCount()
   	{
   		$cart_id = Session::get('cart_id');
   		
   		$output = $this->inquiry->getCartCountByCartId($cart_id);

      return $output;
   	}

   	public function proceedCart()
   	{
        $cart_id = Session::get('cart_id');

        $role_id = Session::get('role_id');

        $user_id = Session::get('UID');

        $output = $this->inquiry->gettingCartDetails($cart_id);

        $uom = $this->product->getUOM();

        $customerList = $this->user->gettingCustomerList($role_id,$user_id);

        $country_id ='101';

        $state_id = '1';

        $country = $this->user_registration->getCustomerCountyList();

        $state = $this->user_registration->getStateList($country_id);

        $city = $this->user_registration->getCityList($state_id);

        return view('inquiry.proceedCart',compact('output','uom','customerList','country','state','city'));
   	}

    public function inactiveProductInCart(Request $request)
    {
        $productID = $request->segment(2);

        $cart_id = Session::get('cart_id');

        $role_id = Session::get('role_id');

        $user_id = Session::get('UID');

        $out = $this->inquiry->inactiveProductInCart($productID,$cart_id,$user_id);

        return redirect()->route('/inquiry/proceedCart');
    }

    public function save(Request $request)
    {
        $location_id = Session::get('location_id');

        $request->validate([
                    'customerName' => 'required',
                ]
        );

        $cart_id = Session::get('cart_id');
        $user_id = Session::get('UID');
        $table_inquiry_code = request('inquiry_code');
        $table_inquiry_product_id = request('inquiry_product_id');
        //dd($table_inquiry_product_id);
        // $table_inquiry_name = request('inquiry_name');
        // $table_inquiry_sci_name = request('inquiry_sci_name');
        // $table_inquiry_specification = request('inquiry_specification');
        $table_inquiry_qty = request('inquiry_qty');
        $table_inquiry_uom = request('inquiry_uom');
        $customerName = request('customerName');
        $billing_address_city_name = request('billing_address_city_name');
        $billing_pin = request('billing_pin');
        $billing_address = request('billing_address');
        $shipping_address_city_name = request('shipping_address_city_name');
        $shipping_pin = request('shipping_pin');
        $shipping_address = request('shipping_address');

        $output = $this->inquiry->saveInquiry($cart_id,$user_id,$table_inquiry_product_id,$table_inquiry_qty,$table_inquiry_uom,$customerName,$billing_address_city_name,$billing_pin,$billing_address,$shipping_address_city_name,$shipping_pin,$shipping_address,$location_id);

        $data['message'] ='Inquiry Added. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }
}