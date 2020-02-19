@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');

@endphp

@if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/sample/customer/show/{sampleId}')=='YES')
    <div style="display: none" id="sampleEdit">Y</div>
@else
    <div style="display: none" id="sampleEdit">N</div>
@endif

 @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/sample/customer/readyForDispatch/{sampleId}')=='YES')
    <div style="display: none" id="sampleReadyForDispatch">Y</div>
@else
    <div style="display: none" id="sampleReadyForDispatch">N</div>
@endif



    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Customer Sample Request</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/customerSample')=='YES')

            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/addNewSample')=='YES')
                <div class="form-group row">
                    <div class="col-sm-12">
                        <a href="/dashboard/addNewSample" style="float: right" class="btn btn-default">Add New Sample Request</a>
                    </div>
                </div>
            @endif

        <br>

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Sample Number</th>
                        <th scope="col">Sample Date</th>
                        <th scope="col">Delivery Date</th>
                        <th scope="col">Customer Info</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" id="customerSampleBody">
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{$i+1}}</td>
                                <td>{{$output[$i]['sample_number']}}</td>
                                <td>{{$output[$i]['request_date']}}</td>
                                <td>{{$output[$i]['delivered_date']}}</td>
                                <td>{{$output[$i]['ref_name']}}</td>
                                <td>{{$output[$i]['customer_status']}}</td>
                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/customerSample')=='YES')
                                    <td><a href="/sample/customer/show/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                @else
                                    <td><span class="glyphicon glyphicon-pencil"></span></td>
                                @endif

                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/sample/customer/readyForDispatch/{sampleId}')=='YES')
                                    <td><a href="/sample/customer/readyForDispatch/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-tag"></span></a></td>
                                @else
                                    <td><span class="glyphicon glyphicon-tag"></span><</td>
                                @endif
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="8" class="no-data-found">No Sample found</td>
                        </tr>
                    @endif  
                      
                </tbody>
            </table>
        </div>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="{{ asset('js/online/jquery-1.7.1.min.js') }}"></script>
<script src="{{ asset('js/online/jquery.min.js') }}"></script> -->
<script src="{{ asset('js/sample/location.js') }}"></script>