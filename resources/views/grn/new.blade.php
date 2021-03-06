@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css"> -->

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Goods Rececipt Note (GRN) /  Add </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/grn/save')=='YES')
        <form method="post" action="/grn/save">
            {{ csrf_field() }}
    
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">PRN(Purchase Requisition Number) No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="prn_no" name="prn_no" placeholder="purchase requisition number" required="required" value="{{ old('prn_no') }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Request Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="grnRequestDay" name="grnRequestDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="grnRequestMonth" name="grnRequestMonth">
                            <option value="01">Jan</option> 
                            <option value="02">Feb</option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select>
                        <select class="form-control date-class" id="grnRequestYear" name="grnRequestYear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Delivered Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="grnDeliveredDay" name="grnDeliveredDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="grnDeliveredMonth" name="grnDeliveredMonth">
                            <option value="01">Jan</option> 
                            <option value="02">Feb</option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select>
                        <select class="form-control date-class" id="grnDeliveredYear" name="grnDeliveredYear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Supplier</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="supplier" name="supplier">
                            @for ($i = 0; $i < count($getVendorList); $i++)
                                <option value={{ $getVendorList[$i]["Id"]}}>{{ $getVendorList[$i]["company_name"]}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Bill No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bill_no" name="bill_no" placeholder="bill no" required="required" value="{{ old('bill_no') }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">LR No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="lr_no" name="lr_no" placeholder="LR no" required="required" value="{{ old('lr_no') }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Dispatch Service</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="dispatch_service" name="dispatch_service">
                            @for ($i = 0; $i < count($dispatchServiceList); $i++)
                                <option value={{ $dispatchServiceList[$i]["id"]}}>{{ $dispatchServiceList[$i]["name"]}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Delivery Location</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="delivery_location" name="delivery_location">
                            @for ($i = 0; $i < count($warehouseList); $i++)
                                <option value={{ $warehouseList[$i]["id"]}}>{{ $warehouseList[$i]["name"]}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Total Amount</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="total_amount" name="total_amount" placeholder="total amount of GRN" required="required" value="{{ old('total_amount') }}">
                </div>
            </div>


           
             <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="grnItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Name</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Qty</th>
                                <th scope="col" style="vertical-align: middle;">Price</th>
                                <th scope="col" style="vertical-align: middle;">UOM</th>
                                <th scope="col" style="vertical-align: middle;">Action</th>
                               
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            <tr>
                                <th style="vertical-align:middle">1</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 250px">
                                        <option value="0">NA</option>
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 150px">
                                        <option value="0">Select Method</option>
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0">
                                </th>

                                <th>
                                    <input class="form-control qty" id="price" type="number" name="product_price[][price]" placeholder="price" required="required" min="1">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
                                        <option value="1">KG</option>
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                                
                            </tr>
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="addGRNNewRow()">Add New Row</button>
                    </div>

                </div> 
            </div>  

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                </div>
            </div>    

        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/grn/init.js') }}"></script>

<!-- <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="{{ asset('js/prn/function.js') }}"></script> -->
<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->