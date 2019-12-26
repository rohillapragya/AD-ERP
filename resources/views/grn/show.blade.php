@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css"> -->

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $request_date = $output[0]['request_date'];
    $req_date_arr = explode("-",$request_date);
    $req_year =  $req_date_arr[0];
    $req_month =  $req_date_arr[1];
    $req_day =  $req_date_arr[2];


    $delivered_date = $output[0]['delivery_date'];
    $deli_date_arr = explode("-",$delivered_date);
    $deli_year =  $deli_date_arr[0];
    $deli_month =  $deli_date_arr[1];
    $deli_day =  $deli_date_arr[2];

@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Goods Rececipt Note (GRN) /  Edit </li>
    </ol>
    </nav>

    <div class="container box-shadow">
       @if($user_role_id=='3' || $user_role_id=='7' ||  $user_role_id=='11')
        <form method="post" action="/grn/update">
            {{ csrf_field() }}
            
            <input type="hidden" id="grn_number" name="grn_number" value="{{$output[0]['grn_number']}}">
            
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">PRN(Purchase Requisition Number) No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="prn_no" name="prn_no" placeholder="purchase requisition number" required="required" value="{{ isset($output[0]['PRN_no'] ) ? $output[0]['PRN_no']  : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Request Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="grnRequestDay" name="grnRequestDay">
                            @for ($i = 1; $i <= 31; $i++)
                                @if($i==$req_day)
                                    <option selected value={{ $i}}>{{ $i}}</option>
                                @else  
                                    <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="grnRequestMonth" name="grnRequestMonth">
                            @if($req_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                            @if($req_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($req_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($req_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($req_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($req_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($req_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($req_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($req_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($req_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($req_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($req_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="grnRequestYear" name="grnRequestYear">
                            @for ($i = 2019; $i <= 2022; $i++)
                                @if($i==$req_year)
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
                <label class="col-sm-4 col-form-label">Delivered Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="grnDeliveredDay" name="grnDeliveredDay">
                            @for ($i = 1; $i <= 31; $i++)
                                @if($i==$deli_day)
                                    <option selected value={{ $i}}>{{ $i}}</option>
                                @else  
                                    <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="grnDeliveredMonth" name="grnDeliveredMonth">
                            @if($deli_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                            @if($deli_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($deli_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($deli_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($deli_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($deli_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($deli_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($deli_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($deli_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($deli_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($deli_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($deli_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="grnDeliveredYear" name="grnDeliveredYear">
                            @for ($i = 2019; $i <= 2022; $i++)
                                @if($i==$deli_day)
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
                <label class="col-sm-4 col-form-label">Supplier</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="supplier" name="supplier">
                            @for ($i = 0; $i < count($getVendorList); $i++)
                                @if($output[0]['supplier']==$getVendorList[$i]['Id'])
                                    <option selected value={{ $getVendorList[$i]["Id"] }}>{{ $getVendorList[$i]["company_name"]}}</option>
                                @else
                                    <option value={{ $getVendorList[$i]["Id"] }}>{{ $getVendorList[$i]["company_name"]}}</option>
                                @endif
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Bill No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bill_no" name="bill_no" placeholder="bill no" required="required" value="{{ $output[0]['bill_no'] }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">LR No</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="lr_no" name="lr_no" placeholder="LR no" required="required" value="{{ $output[0]['LR_no'] }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Dispatch Service</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="dispatch_service" name="dispatch_service">
                            @for ($i = 0; $i < count($dispatchServiceList); $i++)
                                @if($output[0]['transporter']==$dispatchServiceList[$i]['id'])
                                    <option selected value={{ $dispatchServiceList[$i]["id"]}}>{{ $dispatchServiceList[$i]["name"]}}</option>
                                @else
                                    <option value={{ $dispatchServiceList[$i]["id"]}}>{{ $dispatchServiceList[$i]["name"]}}</option>
                                @endif
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
                                @if($output[0]['delivery_warehouse']==$warehouseList[$i]['id'])
                                    <option selected value={{ $warehouseList[$i]["id"]}}>{{ $warehouseList[$i]["name"]}}</option>
                                @else
                                    <option value={{ $warehouseList[$i]["id"]}}>{{ $warehouseList[$i]["name"]}}</option>
                                @endif
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Total Amount</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="total_amount" name="total_amount" placeholder="total amount of GRN" required="required" value="{{ $output[0]['net_amount'] }}">
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
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 150px">
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
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['qty']}}">
                                </th>

                                <th>
                                    <input class="form-control qty" id="price" type="number" name="product_price[][price]" placeholder="price" required="required" min="1" value="{{$output[$i]['price']}}">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
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
<script src="{{ asset('js/grn/init-edit.js') }}"></script>

<!-- <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="{{ asset('js/prn/function.js') }}"></script> -->
<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->