<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\BOM_class;

use App\lib\Product_class;

use App\lib\Warehouse_class;

class BOM extends Controller
{
    public function __construct(BOM_class $BOM,Product_class $product,Warehouse_class $warehouse)  
    {
        $this->BOM = $BOM;

        $this->product = $product;

        $this->warehouse = $warehouse;
    }

    public function index()
    {
        $output = $this->BOM->showBOMList();

        //dd($output);

        return view('BOM.index',compact('output'));
    }

    public function addNew()
    {
        return view('BOM.new');
    }

    public function save(Request $request)
    {
        $user_id = Session::get('UID');

        $bom_key_person = request('bom_key_person');

        $bom_remark = request('bom_remark');

        $bom_name = request('bom_name');
       
        $sample_table_product_code = request('product_name');

        $sample_table_product_method = request('product_method');

        $sample_table_product_qty = request('product_qty');

        $sample_table_product_uom = request('product_uom');

        $out = $this->BOM->save($user_id,$bom_key_person,$bom_remark,$bom_name,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        $data['message'] ='Bill Of material Saved. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function show(Request $request)
    {
        $bomID = $request->segment(3);
        
        $output = $this->BOM->showBOMdetails($bomID);

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

        $uom = $this->product->getUOM();

        return view('BOM.edit',compact('output','product','method','uom'));
    }

    function update(Request $request)
    {

        $user_id = Session::get('UID');

        $bomId = request('bomId');

        $bom_key_person = request('bom_key_person');

        $bom_remark = request('bom_remark');

        $bom_name = request('bom_name');
       
        $sample_table_product_code = request('product_name');

        $sample_table_product_method = request('product_method');

        $sample_table_product_qty = request('product_qty');

        $sample_table_product_uom = request('product_uom');

        $out = $this->BOM->edit($user_id,$bomId,$bom_key_person,$bom_remark,$bom_name,$sample_table_product_code,$sample_table_product_method,$sample_table_product_qty,$sample_table_product_uom);

        $data['message'] ='Bill Of material Saved. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }

    public function checkBom(Request $request)
    {
        $objectId = $request->input('objectId');

        $output = $this->BOM->checkBom($objectId);

        return $output;
    }

    public function BomToProduction(Request $request)
    {
        $bomID = $request->segment(2);

        $output = $this->BOM->showBOMdetails($bomID);

        $warehouseList = $this->warehouse->getWarehouseList();

        $uom = $this->product->getUOM();

        $product = $this->product->getProuductList();

        $method = $this->product->getMethod();

       // dd($output);

        return view('production.bom_to_Production',compact('output','warehouseList','uom','product','method'));
    }
}