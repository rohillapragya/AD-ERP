@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" href="{{ asset('css/userRegistration/erpUser.css') }}"> -->

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $user_id = Session::get('UID');
@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

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


    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  ERP User /  Edit </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || Dashboard::isRouteExistForUser('/erpuser/update')=='YES')
        <form method="post" action="/erpuser/update">
            {{ csrf_field() }}

            <input type="hidden" id="erpuserid" name="erpuserid" value="{{ $erpUserInfo[0]['user_id']}}">

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">First Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="first_name" name="first_name" placeholder="full Name" required="required" value={{$erpUserInfo[0]['first_name']}}>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Last Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" rows="3" id="last_name" name="last_name" placeholder="last Name" value={{$erpUserInfo[0]['last_name']}}>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Offical Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="offical_email" name="offical_email" placeholder="offical email" required="required" value={{$erpUserInfo[0]['auth_key']}} readonly>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Personal Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="personal_email" name="personal_email" placeholder="personal email" value={{$erpUserInfo[0]['email']}}>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Offical Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="offical_mobile" name="offical_mobile" placeholder="offical mobile" required="required" value={{$erpUserInfo[0]['offical_mobile']}}>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">personal Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="personal_mobile" name="personal_mobile" placeholder="personal mobile" value={{$erpUserInfo[0]['mobile']}}>
                </div>
            </div>


            <!-- <div class="form-group row">
                <label class="col-sm-4 col-form-label">Role</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="erpuser_role" name="erpuser_role">
                            @for ($i = 0; $i < count($role); $i++)

                                @if($erpUserInfo[0]['role_id']== $role[$i]["id"])
                                    <option selected value={{ $role[$i]["id"]}}>{{ $role[$i]["name"]}}</option> 
                                @else
                                    <option value={{ $role[$i]["id"]}}>{{ $role[$i]["name"]}}</option> 
                                @endif
                            @endfor
                        </select>
                    </div> 
                </div>
            </div> -->

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Password ( for first time login for user. Later it will be update by user)</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password_erp_user" name="password_erp_user" placeholder="password (first time login for user. Later it will be update by user)" required="required">
                </div>
            </div>

            <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="userDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Dept (Role)</th>
                                <th scope="col" style="vertical-align: middle;">Location</th>
                                <th scope="col" style="vertical-align: middle;">Menu</th>
                                <th scope="col" style="vertical-align: middle;">Access</th>
                                <th scope="col" style="vertical-align: middle;">Action</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            @if(count($userMenuAccessMap) > 0)
                                @for($i=0;$i < count($userMenuAccessMap);$i++)
                                    <tr>
                                        <th style="vertical-align:middle">{{$i+1}}</th>

                                        <th>
                                            <select name='user_dept[][dept]' class="form-control" id='user_dept_' onchange="onChangeRole()">
                                                <@for ($ix = 0; $ix < count($role); $ix++) 
                                                    @if($userMenuAccessMap[$i]['role_id']==$role[$ix]['id'])
                                                        <option  selected value="{{ $role[$ix]['id']}}">{{ $role[$ix]['name']}}</option>
                                                    @else
                                                        <option value="{{ $role[$ix]['id']}}">{{ $role[$ix]['name']}}</option>
                                                    @endif
                                                   
                                                @endfor
                                            </select>

                                        </th>

                                        <th>
                                            <select name="user_location[][location]" class="form-control" id='user_location'>
                                                <@for ($ix = 0; $ix < count($getLocation); $ix++) 
                                                    @if($userMenuAccessMap[$i]['location_id']==$getLocation[$ix]['id'])
                                                        <option  selected value="{{ $getLocation[$ix]['id']}}">{{ $getLocation[$ix]['location']}}</option>
                                                    @else
                                                        <option value="{{ $getLocation[$ix]['id']}}">{{ $getLocation[$ix]['location']}}</option>
                                                    @endif
                                                   
                                                @endfor
                                            </select>
                                        </th>

                                        <th>
                                            <select name="user_menu[][menu]" class="form-control" id='user_menu'>
                                                <@for ($ix = 0; $ix < count($getFullMenuList); $ix++) 
                                                    @if($userMenuAccessMap[$i]['menu_url_map_id']==$getFullMenuList[$ix]['id'])
                                                        <option  selected value="{{ $getFullMenuList[$ix]['id']}}">{{ $getFullMenuList[$ix]['name']}}</option>
                                                    @else
                                                        <option value="{{ $getFullMenuList[$ix]['id']}}">{{ $getFullMenuList[$ix]['name']}}</option>
                                                    @endif
                                                   
                                                @endfor
                                            </select>
                                        </th>

                                        <th>
                                            <select name="user_access[][access]" class="form-control" id='user_access'>
                                                <@for ($ix = 0; $ix < count($getFullAccessList); $ix++) 
                                                    @if($userMenuAccessMap[$i]['access']==$getFullAccessList[$ix]['id'])
                                                        <option  selected value="{{ $getFullAccessList[$ix]['id']}}">{{ $getFullAccessList[$ix]['name']}}</option>
                                                    @else
                                                        <option value="{{ $getFullAccessList[$ix]['id']}}">{{ $getFullAccessList[$ix]['name']}}</option>
                                                    @endif
                                                   
                                                @endfor
                                            </select>
                                        </th>

                                        <th><button class="glyphicon glyphicon-remove" id="{{$userMenuAccessMap[$i]['id']}}" style="background-color: white;border: 1px;float: left;" onclick="onClickRemoveRole(id)"></button></th>
                                    </tr>
                                @endfor   
                            @else
                            
                            @endif     
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="adduserDetailsNewRow()">Add New Row</button>
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
<script src="{{ asset('js/userRegistration/erpUser-edit.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->