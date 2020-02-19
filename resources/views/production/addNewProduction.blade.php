@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css//production/init.css') }}">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Production  /  Add </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/production/save')=='YES')
        <form method="post" action="/production/save">
            {{ csrf_field() }}
    
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Production Start Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="productionStartDay" name="productionStartDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="productionStartMonth" name="productionStartMonth">
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
                        <select class="form-control date-class" id="productionStartyear" name="productionStartyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Production Expected End Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="productionExpectedEndDay" name="productionExpectedEndDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="productionExpectedEndMonth" name="productionExpectedEndMonth">
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
                        <select class="form-control date-class" id="productionExpectedEndyear" name="productionExpectedEndyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Source Warehouse</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="sourceWarehouse" name="sourceWarehouse">
                            @for ($i = 0; $i < count($warehouseList); $i++)
                                <option  value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Destination Warehouse</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="destinationWarehouse" name="destinationWarehouse">
                            @for ($i = 0; $i < count($warehouseList); $i++)
                                <option  value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">BOM No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bom_no" name="bom_no" placeholder="bom no" required="required" onblur="validateObjectID(this)">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Item to Manufacture</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="item_to_manufacture" name="item_to_manufacture" placeholder="item to manufacture" required="required">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Manufacture Item Qty</label>
                <div class="col-sm-8">

                    <div class="day-month-yaer-class">
                       <input type="input" class="form-control" id="manugfacture_item_qty" name="manugfacture_item_qty" placeholder="manufacture item qty" required="required">

                        <select class="form-control" id="manufacture_uom" name="manufacture_uom" style="margin-left: 10%;width: 40%;">
                            @for ($i = 0; $i < count($uom); $i++)
                                <option  value="{{ $uom[$i]['id']}}">{{ $uom[$i]['name']}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Remark</label>
                <div class="col-sm-8">
                   <textarea class="form-control" id="production_remark" name="production_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="2000"></textarea>
                   <span id="production_remark_span">Only 2000 characters are allowed</span>
                </div>
            </div>

           
             <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="productionItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Name</th>
                                <th scope="col" style="vertical-align: middle;">Source Warehouse</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Required Qty</th>
                                <th scope="col" style="vertical-align: middle;">Transfered Qty</th>
                                <th scope="col" style="vertical-align: middle;">Consumed Qty</th>
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
                                    <select name='product_source_warhouse[][product_source_warhouse]' class="form-control" id='product_source_warhouse' style="width: 150px">
                                        <option value="0">NA</option>
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 101px">
                                        <option value="0">Select Method</option>
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="required_qty" type="number" name="product_required_qty[][product_required_qty]" placeholder="qty" required="required" min="0">
                                </th>

                                <th>
                                    <input class="form-control qty" id="transfered_qty" type="number" name="product_transfered_qty[][product_transfered_qty]" placeholder="qty" required="required" min="0">
                                </th>

                                <th>
                                    <input class="form-control qty" id="consumed_qty" type="number" name="product_consumed_qty[][product_consumed_qty]" placeholder="qty" required="required" min="0">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]" style="width: 80px;">
                                        <option value="1">KG</option>
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="addSampleNewRow()">Add New Row</button>
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

<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/production/init.js') }}"></script>

<script scr="{{ asset('js/production/function.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->