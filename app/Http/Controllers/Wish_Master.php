<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\Product_class;

use App\lib\Wish_Master_class;


class Wish_Master extends Controller
{
    public function __construct(Product_class $product,Wish_Master_class $wish) 
    {
        $this->product = $product;

        $this->wish = $wish;
    }
    
    public function index()
    {
        $role_id = Session::get('role_id');

        $user_id = Session::get('UID');

        $location_id = Session::get('location_id');

        $output = $this->wish->showWishList($role_id,$user_id,$location_id);

        return view('wish_master.index',compact('output'));
    }

    public function getWishCount()
    {
        $role_id = Session::get('role_id');

        $user_id = Session::get('UID');

        $location_id = Session::get('location_id');

        return $this->wish->getWishCount($role_id,$user_id,$location_id);
    }

    public function add()
    {
        $activeMethodList = $this->product->activeMethodList();

        $getActiveUOM = $this->wish->getActiveUOM();

        return view('wish_master.add',compact('activeMethodList','getActiveUOM'));
    }

    public function save(Request $request)
    {
        $user_id = Session::get('UID');
        $location_id = Session::get('location_id');

        $wish_image = request('wish_image');
        $request->validate([
                    'wish_name' => 'required',
                    'wish_application' => 'required',
                    'wish_qty' => 'required',
                ]
            );

            if($wish_image) {
                $request->validate([  'wish_image' => 'image|mimes:jpeg,png,jpg,pdf|max:2048', ]);
            }
            
            $wish_image = request('wish_image');

            if($wish_image) {

                $imageName = time().'.'.request()->wish_image->getClientOriginalExtension();
                request()->wish_image->move(public_path() . '/wish_image', $imageName);
            }

            else {   $imageName =''; }

        $wish_name = request('wish_name');
        $wish_description = request('wish_description');
        $wish_method = request('wish_method');
        $wish_application = request('wish_application');
        $wish_qty = request('wish_qty');
        $wish_other_info = request('wish_other_info');
        
        $out = $this->wish->addWish($user_id,$imageName,$wish_name,$wish_description,$wish_method,$wish_application,$wish_qty,$wish_other_info,$location_id);

        $data['message'] ='Wish Added. Go to  Dashboard using button';

        $data['text'] = '';

        return view('dashboard_return.success',$data);   
    }

    public function show(Request $request)
    {
        $wishId =  $request->segment(3);

       // dd($wishId);
        $activeMethodList = $this->product->activeMethodList();

        $output = $this->wish->gettingWishDetails($wishId);

        return view('wish_master.edit',compact('output','activeMethodList'));
    }

    public function removeWishImage(Request $request)
    {
        $updated_by = Session::get('UID');

        $wishId = $request->input('wishId');

        $wishImage = $request->input('wishImage');

        $image_path = 'wish_image/'. $wishImage;

        if (file_exists($image_path)) 
        {
            @unlink($image_path);
            \File::delete($image_path);
        }

        $out = $this->wish->removeWishImage($updated_by,$wishId);

        $output = $this->product->getProductCategory();

        return $output;
    }

    public function edit(Request $request)
    {
        $user_id = Session::get('UID');
        $location_id = Session::get('location_id');


        $wish_image = request('wish_image');
        $request->validate([
                    'wish_name' => 'required',
                    'wish_application' => 'required',
                    'wish_qty' => 'required',
                ]
            );

            if($wish_image) {
                $request->validate([  'wish_image' => 'image|mimes:jpeg,png,jpg,pdf|max:2048', ]);
            }
            
            $wish_image = request('wish_image');

            if($wish_image) {

                $imageName = time().'.'.request()->wish_image->getClientOriginalExtension();
                request()->wish_image->move(public_path() . '/wish_image', $imageName);
            }

            else {   $imageName =''; }

        $wishId = request('wishID');    
        $wish_name = request('wish_name');
        $wish_description = request('wish_description');
        $wish_method = request('wish_method');
        $wish_application = request('wish_application');
        $wish_qty = request('wish_qty');
        $wish_other_info = request('wish_other_info');
        
        $out = $this->wish->editWish($user_id,$wishId,$imageName,$wish_name,$wish_description,$wish_method,$wish_application,$wish_qty,$wish_other_info,$location_id);

        $data['message'] ='Wish edit. Go to  Dashboard using button';

        $data['text'] = '';

        return view('dashboard_return.success',$data);   
    }

    public function action(Request $request)
    {
        $wishId =  $request->segment(3);
    
        $output = $this->wish->getWishFullDetailsbyWishId($wishId);

        return view('wish_master.action',compact('output','activeMethodList'));
    }

    public function discardProduct(Request $request)
    {
        $wishId =  $request->segment(2);

        $output = $this->wish->discardProduct($wishId);

        $data['message'] ='Wish Discarded. Go to  Dashboard using button';

        $data['text'] = '';

        return view('dashboard_return.success',$data);  
    }

    public function proceedAsProduct(Request $request)
    {
        $wishId =  $request->segment(2);

        $activeMethodList = $this->product->activeMethodList();

        $activeCategoryList = $this->product->activeCategoryList();

        $output = $this->wish->gettingWishDetails($wishId);

        return view('wish_master.proceedAsProduct',compact('output','activeMethodList','activeCategoryList'));
    }

    public function wishAddedAsProduct(Request $request)
    {
        $user_id = Session::get('UID');

        $wishID = request('wishID');

        $product_image = request('product_image');

        $request->validate([
                'product_code' => 'required',
                'product_name' => 'required',
                'product_botanical_name' => 'required',
                'hsn_code' => 'required',
            ]
        );

        if($product_image) {
            $request->validate([
                'product_image' => 'image|mimes:jpeg,png,jpg|max:2048',
                ]
            );
        }
        
        $product_image = request('product_image');

        if($product_image) {

            $imageName = time().'.'.request()->product_image->getClientOriginalExtension();
           // request()->product_image->move(storage_path() . '/product_image', $imageName);
            request()->product_image->move(public_path() . '/product_image', $imageName);
        }

        else {   $imageName =''; }

        $product_code = request('product_code');
        $product_name = request('product_name');
        $product_botanical_name = request('product_botanical_name');
        $product_specification = request('product_specification');
        $product_application = request('product_application');
        $product_category = request('product_category');
        $product_method = request('product_method');
        $product_max_price = request('product_max_price');
        $product_min_price = request('product_min_price');
        $priceValidDay = request('priceValidDay');
        $priceValidMonth = request('priceValidMonth');
        $priceValidyear = request('priceValidyear');
        $hsn_code = request('hsn_code');
        $product_ratio_based = request('product_ratio_based');

        if($product_min_price==null){ $product_min_price=0; }
        if($product_max_price==null){ $product_max_price=0; }

        $out = $this->product->addProduct($user_id,$product_code,$product_name,$product_botanical_name,$product_specification,$product_application,$product_category,$product_method,$product_max_price,$product_min_price,$priceValidDay,$priceValidMonth,$priceValidyear,$hsn_code,$imageName,$product_ratio_based);

        $out = $this->product->addProductIDInWishMaster($wishID);

        $data['message'] ='Product Added. Go to  Dashboard using button';

        $data['text'] = '';

        return view('dashboard_return.success',$data); 
    }

}