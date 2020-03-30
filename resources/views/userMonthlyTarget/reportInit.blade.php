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
	        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Monthly target / Report </li>
	    </ol>
    </nav>
    

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $isUserLocationHavingAdministratorAccess=='Y')
           
                <div class="col-sm-12"><h3 style="margin: -2% 0% 3% -2%;font-weight: 600;">Search</h3></div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label"> Sales Executive</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="salesExecutive">
                            <option  value='%'>All Sales Executive</option>
                            @for ($i=0;$i < count($getActiveSalesExecutiveList);$i++)
                                <option  value={{ $getActiveSalesExecutiveList[$i]["Id"]}}> {{$getActiveSalesExecutiveList[$i]["first_name"]}} {{$getActiveSalesExecutiveList[$i]["last_name"]}}</option>
                            @endfor
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label"> Session</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="sessionList">
                            <option  value='%'>All Session</option>
                            @for ($i=0;$i < count($getSessionList);$i++)
                                <option  value={{ $getSessionList[$i]["id"]}}> {{$getSessionList[$i]["session"]}}</option>
                            @endfor
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">From Date</label>
                    <div class="col-sm-8">
                        <div class="day-month-yaer-class">
                            <select class="form-control date-class" id="fromDay">
                                <option  value='%'>ALL</option>
                                @for ($i = 1; $i <= 31; $i++)
                                    <option  value={{ $i}}>{{ $i}}</option>
                                @endfor
                            </select>
                            <select class="form-control date-class" id="fromMonth">
                                <option value='%'>ALL</option>
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
                            <select class="form-control date-class" id="fromYear">
                                <option  value='%'>ALL</option>
                                @for ($i = 2019; $i <= 2022; $i++)
                                    <option  value={{ $i}}>{{ $i}}</option>
                                @endfor
                            </select>
                        </div> 
                    </div>
                </div>
         
                 <div class="form-group row">
                    <label class="col-sm-4 col-form-label">To Date</label>
                    <div class="col-sm-8">
                        <div class="day-month-yaer-class">
                            <select class="form-control date-class" id="toDay">
                                <option  value='%'>ALL</option>
                                @for ($i = 1; $i <= 31; $i++)
                                    <option  value={{ $i}}>{{ $i}}</option>
                                @endfor
                            </select>
                            <select class="form-control date-class" id="toMonth">
                                <option value='%'>ALL</option>
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
                            <select class="form-control date-class" id="toYear">
                                <option value='%'>ALL</option>
                                @for ($i = 2019; $i <= 2023; $i++)
                                    <option  value={{ $i}}>{{ $i}}</option>
                                @endfor
                            </select>
                        </div> 
                    </div>
                </div>

                <div class="col-sm-12">
                    <button type="button" class="btn btn-primary btn-lg" onclick="onClickSeachMonthlyTarget()">Search</button>
                </div>

                <div class="form-group row" id="monthlytargeTable" style="display:none">
                    <table class="table table-bordered" style="margin-top: 10%;">
                        <thead style="background-color: #eef1ed;font-size: 14px;">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Monthly Target</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">Session</th>
                                <th scope="col">Meet Target Date</th>
                                <th scope="col">Meet Target Amt</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;" id="monthlytargeTbody">
                              
                        </tbody>

                    </table>
                </div>

        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif 

    </div>

@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="{{ asset('js/monthlytarget/init.js') }}"></script>