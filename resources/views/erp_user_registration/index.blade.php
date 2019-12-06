@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/userRegistration/erpUser.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
$user_role_id = Session::get('role_id');
$user_id = Session::get('UID');
@endphp

 	<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Registration /  ERP User</li>
    </ol>
    </nav>

    <div class="container box-shadow">

        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addNewERPUser" style="float: right" class="btn btn-default">Add New ERP User</a>
            </div>
        </div>
       @if($user_id=='1')
        <div class="form-group row">
            <table class="table table-bordered" id="erpUserTableList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mobile</th>
                        <th scope="col">Role</th>
                        <th scope="col">Active </th>
                        <th scope="col">Edit</th>
                        <th scope="col">Change Active</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" id="erpUserTableTbody">
                      @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['first_name']}} {{$output[$i]['last_name']}}</td>
                                <td>
                                    {{ isset($output[$i]["offical_email"] ) ? $output[$i]["offical_email"]  : $output[$i]["personal_email"] }}
                                </td>
                                <td>
                                    {{ isset($output[$i]["offical_mobile"] ) ? $output[$i]["offical_mobile"]  : $output[$i]["personal_mobile"] }}
                                </td>
                                <td>{{$output[$i]['role_name']}}</td>
                                <td>{{$output[$i]['is_active']}}</td>
                                <td>
                                    @if($output[$i]['is_active']=='Y')
                                        <a href="/erpuser/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></span></a>
                                    @endif    
                                </td>
                                <td>
                                    @if($output[$i]['is_active']=='Y')
                                      <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'N')" class="btn btn-primary btn-sm">Inactive</button>
                                    @else
                                       <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'Y')" style="width: 64px" class="btn btn-primary btn-sm">Active</button>
                                    @endif
                                </td>
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="6" class="no-data-found">No User found</td>
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
<script src="{{ asset('js/userRegistration/erpUser.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
