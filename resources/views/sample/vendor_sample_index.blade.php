@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
    $user_role_id = Session::get('role_id');
    
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Vendor Sample Request</li>
    </ol>
    </nav>

     <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/vendorSample')=='YES')

            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/addNewVendorSample')=='YES')
                <div class="form-group row">
                    <div class="col-sm-12">
                        <a href="/dashboard/addNewVendorSample" style="float: right" class="btn btn-default">Add New Vendor Sample</a>
                    </div>
                </div>
            @endif    


        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Sample Number</th>
                        <th scope="col">Sample Date</th>
                        <th scope="col">Received Date</th>
                        <th scope="col">Customer Info</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['sample_number']}}</td>
                                <td>{{$output[$i]['request_date']}}</td>
                                <td>{{$output[$i]['received_date']}}</td>
                                <td>{{$output[$i]['ref_name']}}</td>
                                <td>{{$output[$i]['customer_status']}}</td>

                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/sample/vendor/show/{sampleId}')=='YES')
                                    <td><a href="/sample/vendor/show/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                @endif 


                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/sample/vendor/saveVendorSample/{sampleId}')=='YES')
                                    <td><a href="/sample/vendor/saveVendorSample/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-tag"></a></td>
                                @else
                                    <td><span class="glyphicon glyphicon-tag"></td>
                                @endif

                               
                            </tr>
                        @endfor
                        <!-- @php
                            print_r($output[0]['customer_status']);
                        @endphp -->
                    @else  
                        <tr>
                            <td colspan="10" class="no-data-found">No Vendor Sample request found</td>
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

<script src="{{ asset('js/custom/vendor.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
