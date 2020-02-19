@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');

    $valid_till = $output[0]['valid_till'];
    $valid_till_date_arr = explode("/",$valid_till);
    $valid_year =  $valid_till_date_arr[0];
    $valid_month =  $valid_till_date_arr[1];
    $valid_day =  $valid_till_date_arr[2];

@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Product /  Price Range & Valid till</li>
        </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/{productId}/priceRange')=='YES')

        <form method="post" action="/product/updatePrice_valid">
            {{ csrf_field() }}

            <input type="hidden" id="productId" name="productId" value="{{$output[0]['id']}}">

            <div class="form-group row">
                <div class="card card-class">
                <div class="card-header card_header"> Product Details </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-4 card-block-header">Code </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["code"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Name </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["name"]}}</div>
                        </div> 

                        <div class="row">
                            <div class="col-md-4 card-block-header">Botanical Name </div>
                            <div class="col-md-8 card-block-detail" style="font-weight: 600;font-style: italic;">{{$output[0]["scrientific_name"]}}</div>
                        </div> 

                        <div class="row">
                            <div class="col-md-4 card-block-header">Specification </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["specification"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Application </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["application"]}}</div>
                        </div>

                        <br>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Price</label>
                            <div class="col-sm-8" style="display: flex">
                                <input type="number" class="form-control" id="product_min_price" name="product_min_price" placeholder="min price" value="{{ isset($output[0]['min_price']) ? $output[0]['min_price'] : '' }}" style="margin-right: 10%" >

                                <input type="number" class="form-control" id="product_max_price" name="product_max_price" placeholder="max price" value="{{ isset($output[0]['max_price']) ? $output[0]['max_price'] : '' }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Price Valid Date</label>
                            <div class="col-sm-8">
                                <div class="day-month-yaer-class">
                                    <select class="form-control date-class" id="priceValidDay" name="priceValidDay">
                                        @for ($i = 1; $i <= 31; $i++)
                                            @if($i==$valid_day)
                                                <option selected value={{ $i}}>{{ $i}}</option>
                                            @else  
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endif 
                                        @endfor
                                    </select>
                                    <select class="form-control date-class" id="priceValidMonth" name="priceValidMonth">
                                        @if($valid_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                                        @if($valid_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                                        @if($valid_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                                        @if($valid_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                                        @if($valid_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                                        @if($valid_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                                        @if($valid_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                                        @if($valid_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                                        @if($valid_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                                        @if($valid_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                                        @if($valid_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                                        @if($valid_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                                    </select>
                                    <select class="form-control date-class" id="priceValidyear" name="priceValidyear">
                                        @for ($i = 2019; $i <= 2022; $i++)
                                            @if($i==$valid_year)
                                                <option selected value={{ $i}}>{{ $i}}</option>
                                            @else  
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endif 
                                        @endfor
                                    </select>
                                </div> 
                            </div>
                        </div>

                        <div class="form-group row" style="margin-top: 5%"> 
                            <div class="col-sm-4"></div>
                            <div class="col-sm-8">
                                <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Update Price</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>

         @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>