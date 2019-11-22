@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css//production/init.css') }}">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $production_start_date = $output[0]['production_start_date'];
    $production_start_date_arr = explode("-",$production_start_date);
    $production_start_year =  $production_start_date_arr[0];
    $production_start_month =  $production_start_date_arr[1];
    $production_start_day =  $production_start_date_arr[2];

    $expected_delivery_date = $output[0]['expected_delivery_date'];
    $expected_end_date_arr = explode("-",$expected_delivery_date);
    $expected_end_year =  $expected_end_date_arr[0];
    $expected_end_month =  $expected_end_date_arr[1];
    $expected_end_day =  $expected_end_date_arr[2];

@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Production  /  Edit </li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='3' || $user_role_id=='8')
        <form method="post" action="/production/update">
            {{ csrf_field() }}
                <input type="hidden" value="{{$output[0]['production_id']}}" name="productionId">

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Production Start Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="productionStartDay" name="productionStartDay">
                            @for ($i = 1; $i <= 31; $i++)
                                @if($i==$production_start_day)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="productionStartMonth" name="productionStartMonth">
                            @if($production_start_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                            @if($production_start_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($production_start_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($production_start_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($production_start_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($production_start_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($production_start_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($production_start_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($production_start_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($production_start_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($production_start_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($production_start_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="productionStartyear" name="productionStartyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                                @if($i==$production_start_year)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                @endif 
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
                                @if($i==$expected_end_day)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="productionExpectedEndMonth" name="productionExpectedEndMonth">
                            @if($expected_end_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                            @if($expected_end_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($expected_end_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($expected_end_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($expected_end_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($expected_end_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($expected_end_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($expected_end_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($expected_end_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($expected_end_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($expected_end_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($expected_end_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="productionExpectedEndyear" name="productionExpectedEndyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               @if($i==$expected_end_year)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                @endif 
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
                                @if($output[0]['source_warehouse']==$warehouseList[$i]['id'])
                                        <option  selected value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                                    @else  
                                        <option  value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                                @endif 
                               
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
                                @if($output[0]['target_warehouse']==$warehouseList[$i]['id'])
                                        <option  selected value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                                    @else  
                                        <option  value="{{ $warehouseList[$i]['id']}}">{{ $warehouseList[$i]['name']}}</option>
                                @endif 
                               
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">BOM No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bom_no" name="bom_no" placeholder="bom no" required="required" onblur="validateObjectID(this)" value="{{$output[0]['BOM_no']}}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Item to Manufacture</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="item_to_manufacture" name="item_to_manufacture" placeholder="item to manufacture" required="required" value="{{$output[0]['items_to_manufacturer']}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Manufacture Item Qty</label>
                <div class="col-sm-8">

                    <div class="day-month-yaer-class">
                       <input type="input" class="form-control" id="manugfacture_item_qty" name="manugfacture_item_qty" placeholder="manufacture item qty" required="required" value="{{$output[0]['qty']}}">

                        <select class="form-control" id="manufacture_uom" name="manufacture_uom" style="margin-left: 10%;width: 40%;">
                            @for ($i = 0; $i < count($uom); $i++)

                                 @if($output[0]['qty_uom']==$uom[$i]['id'])
                                        <option  selected value="{{ $uom[$i]['id']}}">{{ $uom[$i]['name']}}</option>
                                    @else  
                                        <option  value="{{ $uom[$i]['id']}}">{{ $uom[$i]['name']}}</option>
                                @endif 
                                
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Remark</label>
                <div class="col-sm-8">
                   <textarea class="form-control" id="production_remark" name="production_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="2000">{{$output[0]['remarks']}}</textarea>
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
                            @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <th style="vertical-align:middle">{{$i+1}}</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 250px">
                                        <@for ($ix = 0; $ix < count($product); $ix++) 
                                            @if($output[$i]['item_code']==$product[$ix]['id'])
                                                 <option  selected value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>

                                </th>

                                <th>
                                    <select name='product_source_warhouse[][product_source_warhouse]' class="form-control" id='product_source_warhouse' style="width: 150px">
                                        @for ($ix = 0; $ix < count($warehouseList); $ix++) 
                                            @if($output[$i]['source_warehouse']==$warehouseList[$ix]['id'])
                                                 <option  selected value="{{ $warehouseList[$ix]['id']}}">{{ $warehouseList[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $warehouseList[$ix]['id']}}">{{ $warehouseList[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 101px">
                                       @for ($ix = 0; $ix < count($method); $ix++) 
                                            @if($output[$i]['method']==$method[$ix]['id'])
                                                 <option  selected value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="required_qty" type="number" name="product_required_qty[][product_required_qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['required_qty']}}">
                                </th>

                                <th>
                                    <input class="form-control qty" id="transfered_qty" type="number" name="product_transfered_qty[][product_transfered_qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['transfered_qty']}}">
                                </th>

                                <th>
                                    <input class="form-control qty" id="consumed_qty" type="number" name="product_consumed_qty[][product_consumed_qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['consumed_qty']}}">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]" style="width: 80px;">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($output[$i]['uom']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
                            @endfor
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