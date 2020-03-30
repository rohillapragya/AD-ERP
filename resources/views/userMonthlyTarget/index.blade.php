@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">
<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
$user_role_id = Session::get('role_id');
$is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
$isUserHavingSalesExecutive = Session::get('is_sales_executive_access_for_active_location');
@endphp

   	<nav aria-label="breadcrumb">
	    <ol class="breadcrumb">
	        <span class="glyphicon glyphicon-map-marker"></span>
	        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Update your Monthly target</li>
	    </ol>
    </nav>
    
    @if($errors->all())
        <div class="alert alert-danger" role="alert">
            <div class="row">
                <ul>
                    @foreach($errors->all() as $error)
                        <li>{{$error}}</li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif

    <div class="container box-shadow">
    	@if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/monthly_target')=='YES' || $isUserHavingSalesExecutive=='Y')
            
            <form method="post" action="/monthlyTarget/add">
                {{ csrf_field() }}
                <div class="form-group row">
                    <div class="col-sm-12">
                        <div class="card card-class">
                            <div class="card-header card_header"> Your Information Details </div>
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-md-4 card-block-header">Name </div>
                                    <div class="col-md-8 card-block-detail">{{$output[0]["first_name"]}}  {{$output[0]["last_name"]}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 card-block-header">Contact Number </div>
                                    <div class="col-md-8 card-block-detail"> {{$output[0]["mobile"]}}  {{$output[0]["offical_mobile"]}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 card-block-header">Contact Email </div>
                                    <div class="col-md-8 card-block-detail"> {{$output[0]["email"]}}  {{$output[0]["offical_email"]}}</div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 card-block-header">Monthly Target </div>
                                    <div class="col-md-8 card-block-detail"> {{ isset($output[0]["monthly_target"] ) ? $output[0]["monthly_target"]  : 0 }}</div>
                                </div>

                                <div class="full_col">
                                    <div class="col-md-12 card-block-header">Update your Target </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Session</label>
                                    <div class="col-sm-8">
                                        <div class="day-month-yaer-class">
                                            <select class="form-control" id="session" name="session">
                                                @for ($i = 0; $i < count($session); $i++)
                                                    <option value={{ $session[$i]["id"]}}>{{ $session[$i]["session"]}}</option>
                                                @endfor
                                            </select>
                                        </div> 
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Date</label>
                                    <div class="col-sm-8">
                                        <div class="day-month-yaer-class">
                                            <select class="form-control date-class" id="monthlyTargetDay" name="monthlyTargetDay">
                                                @for ($i = 1; $i <= 31; $i++)
                                                    <option  value={{ $i}}>{{ $i}}</option>
                                                @endfor
                                            </select>
                                            <select class="form-control date-class" id="monthlyTargetMonth" name="monthlyTargetMonth">
                                                <option value="01">Jan</option><option value="02">Feb</option><option value="03">Mar</option><option value="04">Apr</option><option value="05">May</option><option value="06">Jun</option><option value="07">Jul</option><option value="08">Aug</option><option value="09">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option>
                                            </select>
                                            <select class="form-control date-class" id="monthlyTargetYear" name="monthlyTargetYear">
                                                @for ($i = 2019; $i <= 2022; $i++)
                                                    <option  value={{ $i}}>{{ $i}}</option>
                                                @endfor
                                            </select>
                                        </div> 
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Amount</label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" id="amount" name="amount" placeholder="amount" required="required" value="{{ old('amount') }}" min='100'>
                                    </div>
                                </div>

                                 <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Remark</label>
                                    <div class="col-sm-8">
                                       <textarea class="form-control" id="remark" name="remark"></textarea>
                                    </div>
                                </div>

                                <div class="form-group row" style="margin-top: 5%"> 
                                    <div class="col-sm-4"></div>
                                    <div class="col-sm-8">
                                        <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Add Target</button>
                                    </div>
                                </div> 

                                <ul class="list-group" style="margin-top: 10%;">
                                  <li class="list-group-item active">Previous Completed Target</li>
                                    @if(count($getUserWiseMonthlyDetails) > 0)
                                        @for ($i = 0; $i < count($getUserWiseMonthlyDetails); $i++)
                                            <li class="list-group-item"><b>{{$getUserWiseMonthlyDetails[$i]['session']}} -</b> <i><b style="color: #427f81">{{$getUserWiseMonthlyDetails[$i]['target_date']}} (&#8377; {{$getUserWiseMonthlyDetails[$i]['target_amt']}}) -</b></i> {{$getUserWiseMonthlyDetails[$i]['remarks']}} </li>
                                        @endfor
                                    @else
                                        <li class="list-group-item"><b style="color: #e1670a">Oopss!!! ... No Target Previous</b></li>
                                    @endif    

                                  
                                  <!-- <li class="list-group-item">Morbi leo risus</li>
                                  <li class="list-group-item">Porta ac consectetur ac</li>
                                  <li class="list-group-item">Vestibulum at eros</li> -->
                                </ul>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
