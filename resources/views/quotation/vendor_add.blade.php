@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Purchase Request / Add</li>
        </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/quotation/save')=='YES')
         <form method="post" action="/quotation/save"> 
            {{ csrf_field() }}
            <div class="form-group row">
                <div class="col-sm-12">
                    <div class="card card-class">
                        <div class="card-header card_header">Quotation Details </div>
                        <div class="card-body">          

                            <div id="qID">{{$output[0]["id"]}}</div>       

                            <input type="hidden" id="quotationid" name="quotationid" value="{{$output[0]['id']}}">          
                            
                            <div class="row">
                                <div class="col-md-5 card-block-header">Quotation Number </div>
                                <div class="col-md-7 card-block-detail">{{$output[0]["quotation_no"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 card-block-header">Quotation Request Date (YYYY-MM-DD)</div>
                                <div class="col-md-7 card-block-detail">{{$output[0]["request_date"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 card-block-header">Quotation Delivery Date (YYYY-MM-DD)</div>
                                <div class="col-md-7 card-block-detail">{{$output[0]["delivery_date"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 card-block-header">Remarks</div>
                                <div class="col-md-7 card-block-detail">{{$output[0]["other_info"]}}</div>
                            </div><br>

                            <div class="row">
                                <table class="table table-bordered" style="margin: 0% 2%">
                                    <thead style="background-color: #eef1ed;font-size: 14px;">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Code</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Scientific Name</th>
                                            <th scope="col">Method</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">UOM</th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-size: 14px">
                                        @for ($i = 0; $i < count($getQuotationMasterDetails); $i++)
                                        <tr>
                                            <td>{{$i+1}}</td>
                                            <td>{{$getQuotationMasterDetails[$i]['item_code']}}</td>
                                            <td>{{$getQuotationMasterDetails[$i]['product_name']}}</td>
                                            <td>{{$getQuotationMasterDetails[$i]['scrientific_name']}}</td>
                                            <td>{{$getQuotationMasterDetails[$i]['method_name']}}</td>
                                            <td>{{ isset($getQuotationMasterDetails[0]["qty"] ) ? $getQuotationMasterDetails[0]["qty"]  : '' }}</td>
                                            <td>{{$getQuotationMasterDetails[$i]['uom_name']}}</td>
                                        </tr>
                                        @endfor    
                                    </tbody>
                                </table>
                            </div><br> 
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-12">
                    <div class="card card-class">
                        <div class="card-header card_header">Supplier / Vendor Information Details </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col-md-5 card-block-header">Is Vendor Registered ?</div>
                                <div class="col-md-7 card-block-detail">
                                    <select class="form-control" id="is_vendor_regisered" name="is_vendor_regisered" onchange="onChangeSupplierVendor()">
                                       <option  value="YES">Yes</option>
                                       <option  value="NO">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 card-block-header" id="supplier_vendor_name">Vendor Name</div>
                                <div class="col-md-7 card-block-detail">
                                    <select class="form-control" id="is_vendor_supplier_name" name="is_vendor_supplier_name">
                                        @for ($ia = 0; $ia < count($vendorList); $ia++)
                                           <option value={{$vendorList[$ia]["Id"]}}>{{$vendorList[$ia]["company_name"]}}</option>
                                        @endfor
                                    </select><br>
                                    <div style="float: right;">
                                        <button type="button" class="btn btn-primary" style="font-weight: 600;display: none" id="addSupplier" onclick="addNewSupplier()">Add New Supplier</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>            


            <div class="form-group row" id="addNewSupplierID" style="display: none">
                <div class="col-sm-12">
                    <div class="card card-class">
                        <div class="card-header card_header">Add New Supplier </div>
                        <div class="card-body">

                            <div class="row">
                                <label class="col-sm-5 card-block-header">Name</label>
                                <div class="col-sm-7 card-block-detail">
                                    <div style="display: flex;">
                                        <input type="input" class="form-control" id="supplier_first_name" placeholder="first name" style="width: 50%;margin-right: 2%;">
                                        <input type="input" class="form-control" id="supplier_last_name" placeholder="last name" style="width: 50%;">
                                    </div>
                                </div>
                            </div>
                                
                            <div class="row">
                                <label class="col-sm-5 card-block-header">Address</label>
                                <div class="col-sm-7 card-block-detail">
                                        <textarea class="form-control" id="supplier_address" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="200"></textarea>
                                        <span id="remark_span">Only 200 characters are allowed</span>
                                    
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-5 col-form-label">Country</label>
                                
                                <div class="col-sm-7">
                                    <div class="day-month-yaer-class">
                                        <select class="form-control date-class" id="supplier_address_country_name" name="supplier_address_country_name" onchange="onChangeCountry(this)">
                                           @for ($i = 0; $i < count($country); $i++)
                                                <option value={{ $country[$i]["id"]}}>{{ $country[$i]["name"]}}</option>
                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="supplier_address_state_name" name="supplier_address_state_name" onchange="onChangeState(this)">
                                            @for ($i=0; $i < count($state); $i++)
                                                <option value={{ $state[$i]["id"]}}>{{ $state[$i]["name"]}}</option>
                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="supplier_address_city_name" name="supplier_address_city_name">
                                            @for ($i = 0; $i < count($city); $i++)
                                                <option value={{ $city[$i]["id"]}}>{{ $city[$i]["name"]}}</option>
                                            @endfor
                                        </select>
                                    </div> 
                                </div>
                            </div>


                            <div class="row">
                                <label class="col-sm-5 card-block-header">Contact -1 </label>
                                <div class="col-sm-7 card-block-detail">
                                    <div style="display: flex;">
                                        <input type="number" class="form-control" id="offical_mobile" placeholder="offical mobile" style="width: 50%;margin-                            <input type="email" class="form-control" id="offical_email" placeholder="offical email" style="width: 50%;">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-5 card-block-header">Contact -2 </label>
                                <div class="col-sm-7 card-block-detail">
                                    <div style="display: flex;">
                                        <input type="number" class="form-control" id="personal_mobile" placeholder="personal mobile" style="width: 50%;margin-right: 2%;">
                                        <input type="email" class="form-control" id="personal_email" placeholder="personal email" style="width: 50%;">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-5 card-block-header"></label>
                                <div class="col-sm-7 card-block-detail">
                                    <button type="button" class="btn btn-primary" style="font-weight: 600;" id="saveSupplier" onclick="saveSupplier()">Save Supplier</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-12 card-block-detail">
                            <button type="button" class="btn btn-primary" style="font-weight: 600;" id="populateQuotation" onclick="populateQuotationItem()">Populate Quotation</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="VendorItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Type</th>
                                <th scope="col" style="vertical-align: middle;">Type ID</th>
                                <th scope="col" style="vertical-align: middle;">Product Name</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Qty</th>
                                <th scope="col" style="vertical-align: middle;">UOM</th>
                                <th scope="col" style="vertical-align: middle;">Price</th>
                                <th scope="col" style="vertical-align: middle;">Price Validity (In days Only)</th>
                                <th scope="col" style="vertical-align: middle;">Delivery Days (Approx)</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                                <td>1</td>
                                <td>
                                    <select name='type[][supplier_vendor_type]' class="form-control" id='type_0' style="width: 95px;" onchange="onChangeSupplierVendorType(id)">
                                        <option value="VENDOR">Vendor</option>
                                        <option value="SUPPLIER">Supplier</option>
                                    </select>
                                </td>
                                <td>
                                    <select name='type_id[][supplier_vendor_id]' class="form-control" id='type_id_0' style="width: 140px;">
                                        <@for ($ix = 0; $ix < count($vendorList); $ix++) 
                                            <option  selected value="{{ $vendorList[$ix]['Id']}}">{{ $vendorList[$ix]['company_name']}}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 139px;">
                                        <@for ($ix = 0; $ix < count($getQuotationMasterDetails); $ix++) 
                                            <option  selected value="{{ $getQuotationMasterDetails[$ix]['item_code']}}">{{ $getQuotationMasterDetails[$ix]['product_name']}}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 70px;">
                                         <@for ($ix = 0; $ix < count($getQuotationMasterDetails); $ix++) 
                                            <option  selected value="{{ $getQuotationMasterDetails[$ix]['method']}}">{{ $getQuotationMasterDetails[$ix]['method_name']}}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                     <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0">
                                </td>
                                <td>
                                     <select id="uom" class="form-control" name="product_uom[][uom]" style="width: 80px;">
                                         <@for ($ix = 0; $ix < count($getQuotationMasterDetails); $ix++) 
                                            <option  selected value="{{ $getQuotationMasterDetails[$ix]['UOM']}}">{{ $getQuotationMasterDetails[$ix]['uom_name']}}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <input class="form-control price" id="price" type="number" name="product_price[][price]" placeholder="price" required="required" min="0">
                                </td>
                                <td>
                                    <input class="form-control price_valid_till" id="price_valid_till" type="number" name="product_price_valid_till[][price_valid_till]" placeholder="price_valid_till" required="required" min="0">
                                </td>
                                <td>
                                    <input class="form-control approx_delivery_day" id="approx_delivery_day" type="number" name="product_approx_delivery_day[][approx_delivery_day]" placeholder="approx_delivery_day" required="required" min="0">
                                </td>
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="addNewRow()">Add New Row</button>
                    </div>

                </div>
            </div>

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                </div>
            </div>  

        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/quotation/vendor_supplier.js') }}"></script>