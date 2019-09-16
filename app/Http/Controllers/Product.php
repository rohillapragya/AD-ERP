<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\lib\Product_class;



class Product extends Controller
{

    public function __construct(Product_class $product) 
    {
        $this->product = $product;
    }
    
    public function getMethod()
    {
       // dd("AS");
        $output = $this->product->getMethod();
        return $output;
       // dd($output);
    }

    public function getProductList()
    {
        $output = $this->product->getProuductList();
        return $output;
    }

    public function getUOM()
    {
        $output = $this->product->getUOM();
        return $output;
    }
}