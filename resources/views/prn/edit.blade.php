@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css//prn/init.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $required_date = $output[0]['required_date'];
    $req_date_arr = explode("-",$required_date);
    $req_year =  $req_date_arr[0];
    $req_month =  $req_date_arr[1];
    $req_day =  $req_date_arr[2];

@endphp

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Purchase Requisition Note (PRN) /  Edit</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='3' || $user_role_id=='13')
        <form method="post" action="/prn/update">
            {{ csrf_field() }}
            <!-- <input type="hidden" id="warehouseId" name="warehouseId" value="{{$output[0]['id']}}"> -->

            <input type="hidden" id="prnid" name="prnid" value="{{$output[0]['purchase_entry_id']}}">

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Required Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="prnrequiredDay" name="prnrequiredDay">
                            @for ($i = 1; $i <= 31; $i++)
                                @if($i==$req_day)
                                    <option selected value={{ $i}}>{{ $i}}</option>
                                @else  
                                    <option value={{ $i}}>{{ $i}}</option>
                                @endif
                            @endfor
                        </select>
                        <select class="form-control date-class" id="prnrequiredMonth" name="prnrequiredMonth">
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
                        <select class="form-control date-class" id="prnrequiredyear" name="prnrequiredyear">
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
                <label class="col-sm-4 col-form-label">Remark</label>
                <div class="col-sm-8">
                   <textarea class="form-control" id="prn_remark" name="prn_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="200">{{ isset($output[0]['remarks'] ) ? $output[0]['remarks']  : '' }}</textarea>
                   <span id="prn_remark_span">Only 200 characters are allowed</span>
                </div>
            </div>

           
             <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="prnItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Name</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Qty</th>
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
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['item_qty']}}">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($output[$i]['item_uom']==$uom[$ix]['id'])
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/prn/function.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->