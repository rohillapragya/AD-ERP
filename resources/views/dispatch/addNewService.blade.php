@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/dispatch/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
$user_role_id = Session::get('role_id');
@endphp

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<span class="glyphicon glyphicon-map-marker"></span>
			<li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Add New Dispatch Service</li>
		</ol>
	</nav>

	 <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='7' || $user_role_id=='12')
        <form method="post" action="/dispatch/saveService">
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="dispatch_full_name" name="dispatch_full_name" placeholder="dispatch service name" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Mobile</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="dispatch_mobile" name="dispatch_mobile" placeholder="dispatch service mobile number (if any)">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="dispatch_email" name="dispatch_email" placeholder="dispatch service email number (if any)">
                </div>
            </div>

             <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
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
<script src="{{ asset('js/dispatch/dispatchService.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->