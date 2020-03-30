@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/bom/init.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Goods Rececipt Note (GRN) /  List</li>   
    </ol>
    </nav>

    <div class="container box-shadow">
    @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/BOM')=='YES')
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/addBom')=='YES')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addBom" style="float: right" class="btn btn-default">Add New BOM</a>
            </div>
        </div>
        @endif

        <div class="form-group row">
            <table class="table table-bordered" id="bomItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">BOM No</th>
                        <th scope="col">BOM Key Person</th>
                        <th scope="col">Request Date</th>
                        <th scope="col">Remarks</th>
                        <th scope="col">Create Production</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['BOM_no']}}</td>
                                <td>{{$output[$i]['BOM_key_person']}}</td>
                                <td>{{$output[$i]['created_at']}}</td>
                                <td>{{$output[$i]['remarks']}}</td>
                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/bom/{bomId}/production')=='YES')
                                    <td><a href="/bom/{{$output[$i]['id']}}/production" class="btn btn-default">Create Production</a></td>
                                @else
                                    <td>Create Production</td>
                                @endif

                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/bom/edit/{bomID}')=='YES')
                                    <td><a href="/bom/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></span></a></td> 
                                @else
                                    <td><span class="glyphicon glyphicon-pencil"></span>/td> 
                                @endif
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No BOM found(s)</td>
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

<script src="{{ asset('js/bom/init.js') }}"></script>