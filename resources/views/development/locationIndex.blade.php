@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div cart_id - {{ Session::get('cart_id')}}</div> -->

@php
    $user_role_id = Session::get('role_id');

    $user_id = Session::get('UID');

    $route = Request::path();

    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp


    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Development /  Location List</li>
        </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='2' || $isUserLocationHavingAdministratorAccess=='Y' ||  Dashboard::isRouteExistForUser('/development/location')=='YES')
            <div class="form-group row">
                <div class="col-sm-12">
                    <!-- <a href="/development/addNewURL" style="float: right" class="btn btn-default">Add New Location</a> -->
                    <button type="button" class="btn btn-primary btn-lg" style="float: right;" onclick="addNewLocation()">Add New Location</button>
                </div>
            </div>

            <div class="form-group row">
                <table class="table table-bordered">
                    <thead style="background-color: #eef1ed;font-size: 14px;">
                        <tr>
                            <th scope="col" style="width: 70px;">#</th>
                            <th scope="col">Location</th>
                            <th scope="col" style="width: 70px;">Edit</th>
                            <th scope="col" style="width: 70px;">Delete</th>
                        </tr>
                    </thead>
                    <tbody style="font-size: 14px;" id="locationList">
                        @if(count($output) > 0)
                            @for ($i = 0; $i < count($output); $i++)
                                <tr>
                                    <td>{{($i+1)}}</td>
                                    <td>{{$output[$i]['location']}}</td>
                                    <td><span class="glyphicon glyphicon-pencil" style="color: #2f8dc9;cursor: pointer;" onclick="onClickLocationEdit({{$output[$i]['id']}})"></span></td> 
                                    <td>
                                        <span class="glyphicon glyphicon-remove" style="color: #2f8dc9;cursor: pointer;" onclick="onClickLocationDelete({{$output[$i]['id']}})"></span>
                                   </td>
                                </tr>
                            @endfor
                        @else  
                            <tr>
                                <td colspan="4" class="no-data-found">No Location found</td>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="{{ asset('js/development/location.js') }}"></script>