@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/prn/init.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Goods Rececipt Note (GRN) /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/grnInit')=='YES')

            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/addNewGRN')=='YES')
                <div class="form-group row">
                    <div class="col-sm-12">
                        <a href="/dashboard/addNewGRN" style="float: right" class="btn btn-default">Add New GRN</a>
                    </div>
                </div>
            @endif

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Goods Rececipt Note</th>
                        <th scope="col">Request Date(YYYY-MM_DD)</th>
                        <th scope="col">Delivered Date(YYYY-MM_DD)</th>
                        <th scope="col">Bill No</th>
                        <th scope="col">LR No</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                        <tr>
                            <td>{{($i+1)}}</td>
                            <td>{{$output[$i]['grn_no']}}</td>
                            <td>{{$output[$i]['request_date']}}</td>
                            <td>{{$output[$i]['delivery_date']}}</td>
                            <td>{{$output[$i]['bill_no']}}</td>
                            <td>{{$output[$i]['LR_no']}}</td>
                            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('grn/edit/{grnId}')=='YES')
                                <td><a href="/grn/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                            @else
                                <td>--</td> 
                            @endif        
                        </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="7" class="no-data-found">No GRN found</td>
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

<script src="{{ asset('js/prn/init.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
