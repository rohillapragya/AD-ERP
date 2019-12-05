<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\lib\Product_class;

use Illuminate\Support\Facades\Session;

use Illuminate\Support\Facades\File;

class Product extends Controller
{

    public function __construct(Product_class $product) 
    {
        $this->product = $product;
    }


    public function getUOM()
    {
        $output = $this->product->getUOM();
        return $output;
    }

    /*product section start here*/
        public function getProductList()
        {
            $output = $this->product->getProuductList();
            return $output;
        }

        public function productIndex()
        {
            $output = $this->product->gettingFullProuductList();

            return view('product.index',compact('output'));
        }

        public function addProduct()
        {
            $activeCategoryList = $this->product->activeCategoryList();

            $activeMethodList = $this->product->activeMethodList();

            return view('product.new',compact('activeCategoryList','activeMethodList'));
        }

        public function saveProduct(Request $request)
        {
            $user_id = Session::get('UID');

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

            $data['message'] ='Product Added. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data);           

        }

        public function showProduct(Request $request)
        {
            $productID = $request->segment(3);

            $output  = $this->product->gettingProductDetailsByProductID($productID);

            $activeCategoryList = $this->product->activeCategoryList();

            $activeMethodList = $this->product->activeMethodList();

            return view('product.edit',compact('output','activeCategoryList','activeMethodList'));
        }

        public function removeproductImage(Request $request)
        {
            $updated_by = Session::get('UID');

            $productId = $request->input('productId');

            $productImage = $request->input('productImage');

            $image_path = 'product_image/'. $productImage;

            if (file_exists($image_path)) 
            {
                @unlink($image_path);
                \File::delete($image_path);
            }

            $out = $this->product->removeproductImage($updated_by,$productId);

            $output = $this->product->getProductCategory();

            return $output;
        }

        public function editProduct(Request $request)
        {
            $user_id = Session::get('UID');

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

            $productID = request('productID');
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

            $out = $this->product->editProduct($user_id,$productID,$product_name,$product_botanical_name,$product_specification,$product_application,$product_category,$product_method,$product_max_price,$product_min_price,$priceValidDay,$priceValidMonth,$priceValidyear,$hsn_code,$imageName,$product_ratio_based);

            $data['message'] ='Product Information Edit. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data); 
        }

        public function editProductActiveStatus(Request $request)
        {
            $updated_by = Session::get('UID');

            $id = $request->input('id');

            $status = $request->input('status');

            $out = $this->product->editProductActiveStatus($updated_by,$id,$status);

            $output = $this->product->getProductCategory();

            return $output;
        }

        public function getProductByCategoryId(Request $request)
        {
            $categoryId = $request->input('category');

            $out = $this->product->getProductByCategoryId($categoryId);

            return $out;
        }
    /*product section end here*/


    /*Category Section start here*/

        public function categoryIndex()
        {
            $output = $this->product->getProductCategory();

            return view('product_category.index',compact('output'));
        }
        public  function addCategory()
        {
            return view('product_category.add');
        }

        public function saveCategory(Request $request)
        {
            $user_id = Session::get('UID');

            $category_name = request('category_name');

            $output = $this->product->saveCategory($user_id,$category_name);

            $data['message'] ='Product Category Added. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function showCategory(Request $request)
        {
            $categoryId = $request->segment(4);

            $output = $this->product->showCategoryDetails($categoryId);

            return view('product_category.edit',compact('output'));
        }

        public function editCategory(Request $request)
        {
            $user_id = Session::get('UID');

            $categoryId = request('categoryId');

            $category_name = request('category_name');

            $output = $this->product->editCategory($user_id,$categoryId,$category_name);

            $data['message'] ='Product Category Edit. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function editProductCategoryStatus(Request $request)
        {
            $updated_by = Session::get('UID');

            $id = $request->input('id');

            $status = $request->input('status');

            $out = $this->product->editProductCategoryStatus($updated_by,$id,$status);

            $output = $this->product->getProductCategory();

            return $output;
        }
    /*Category Section end here*/


    /*Method Section start here*/

        public function getMethod()
        {
            $output = $this->product->getMethod();
            return $output;
        }

        public function methodIndex()
        {
            $output = $this->product->getMethod();

            return view('product_method.index',compact('output'));
        }

        public function addMethod()
        {
            return view('product_method.add');
        }

        public function saveMethod()
        {
            $user_id = Session::get('UID');

            $method_name = request('method_name');

            $output = $this->product->saveMethod($user_id,$method_name);

            $data['message'] ='Product Method Added. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function showMethod(Request $request)
        {
            $methodId = $request->segment(4);

            $output = $this->product->showMethodDetails($methodId);

            return view('product_method.edit',compact('output'));
        }

        public function editMethod(Request $request)
        {
            $user_id = Session::get('UID');

            $methodId = request('methodId');

            $method_name = request('method_name');

            $output = $this->product->editMethod($user_id,$methodId,$method_name);

            $data['message'] ='Product Method Edit. Go to  Dashboard using button';

            $data['text'] = '';

            return view('dashboard_return.success',$data);
        }

        public function editProductMethodStatus(Request $request)
        {
            $updated_by = Session::get('UID');

            $id = $request->input('id');

            $status = $request->input('status');

            $out = $this->product->editProductMethodStatus($updated_by,$id,$status);

            $output = $this->product->getMethod();

            return $output;
        }
    /*Method Section end here*/
}