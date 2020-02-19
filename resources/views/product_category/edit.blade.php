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

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Category /  Edit</li>
    </ol>
    </nav>

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

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/editCategory')=='YES')

            <form method="post" action="/product/editCategory">
                {{ csrf_field() }}
           
                <input type="hidden" name="categoryId" value="{{ $output[0]['id'] }}">
             
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Category Name</label>
                    <div class="col-sm-8">
                        <input type="input" class="form-control" id="category_name" name="category_name" placeholder="category name" required="required" value="{{ $output[0]['name'] }}">
                    </div>
                </div>

                <div class="form-group row" style="margin-top: 5%"> 
                    <div class="col-sm-4"></div>
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Update</button>
                    <div>
                </div>            
            </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif    
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/bom/init.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
