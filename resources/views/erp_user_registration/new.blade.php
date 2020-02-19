@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/userRegistration/erpUser.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


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
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  ERP User /  Add </li>
        </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || Dashboard::isRouteExistForUser('/erpuser/save')=='YES')
        <form method="post" action="/erpuser/save">
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">First Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="first_name" name="first_name" placeholder="full Name" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Last Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" rows="3" id="last_name" name="last_name" placeholder="last Name" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Offical Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="offical_email" name="offical_email" placeholder="offical email" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Personal Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="personal_email" name="personal_email" placeholder="personal email">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Offical Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="offical_mobile" name="offical_mobile" placeholder="offical mobile" required="required">
                </div>
            </div>

            

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Personal Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="personal_mobile" name="personal_mobile" placeholder="personal mobile">
                </div>
            </div>


            <!-- <div class="form-group row">
                <label class="col-sm-4 col-form-label">Role</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="erpuser_role" name="erpuser_role">
                            @for ($i = 0; $i < count($output); $i++)
                                <option value={{ $output[$i]['id']}}>{{ $output[$i]['name']}}</option> 
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
                                <th scope="col" style="vertical-align: middle;width: 360px;">Dept (Role)</th>
                                <th scope="col" style="vertical-align: middle;width: 230px;">Location</th>
                                <th scope="col" style="vertical-align: middle;">Menu</th>
                                <th scope="col" style="vertical-align: middle;width: 100px;">Access</th>
                                <th scope="col" style="vertical-align: middle;width: 60px;">Action</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            <tr>
                                <th style="vertical-align:middle">1</th>

                                <th>
                                    <select name='user_dept[][dept]' class="form-control" id='user_dept' onchange="onChangeRole()">
                                        <option value="0">Select Dept</option>
                                    </select>

                                </th>

                                <th>
                                    <select name="user_location[][location]" class="form-control" id='user_location'>
                                        <option value="0">Select Location</option>
                                    </select>
                                </th>

                                <th>
                                    <select name="user_menu[][menu]" class="form-control" id='user_menu'>
                                        <option value="0">ALL</option>
                                    </select>
                                </th>

                                <th>
                                    <select name="user_access[][access]" class="form-control" id='user_access'>
                                        <option value="O">ALL</option>
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
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
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/userRegistration/erpUser.js') }}"></script>
<script src="{{ asset('js/userRegistration/erpUserRole.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->