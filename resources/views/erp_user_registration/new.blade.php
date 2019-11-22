@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/userRegistration/erpUser.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
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
         @if($user_role_id=='3')
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
                <label class="col-sm-4 col-form-label">Offical Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="offical_mobile" name="offical_mobile" placeholder="offical mobile" required="required">
                </div>
            </div>

             <div class="form-group row">
                <label class="col-sm-4 col-form-label">Personal Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="personal_email" name="personal_email" placeholder="personal email">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">personal Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="personal_mobile" name="personal_mobile" placeholder="personal mobile">
                </div>
            </div>


            <div class="form-group row">
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
            </div>

             <div class="form-group row">
                <label class="col-sm-4 col-form-label">Password ( for first time login for user. Later it will be update by user)</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="password_erp_user" name="password_erp_user" placeholder="password (first time login for user. Later it will be update by user)" required="required">
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
<script src="{{ asset('js/userRegistration/erpUser.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->