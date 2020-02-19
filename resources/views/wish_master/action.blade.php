@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" href="{{ asset('css/bom/init.css') }}"> -->


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  User Wish /  ADD</li>
    </ol>
    </nav>

    <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/wish/action/{wishId}')=='YES')
            <input type="hidden" name="wishID" value="{{ $output[0]['id'] }}">

            <div class="form-group row">
                <div class="col-sm-12">
                    <div class="card card-class">
                        <div class="card-header card_header"> Wish Details </div>
                        <div class="card-body">

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Wish ID</label>
                                <div class="col-sm-8">{{ $output[0]['wish_id'] }}</div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Wish Name</label>
                                <div class="col-sm-8">{{ $output[0]['name'] }}</div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Wish Requester Name</label>
                                <div class="col-sm-8">{{ $output[0]['first_name'] }} {{ $output[0]['last_name'] }}</div>
                            </div>

                            @if($output[0]['description'])
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Description</label>
                                <div class="col-sm-8">{{ $output[0]['description'] }}</div>
                            </div>
                            @endif

                            @if($output[0]['method_name'])
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Method</label>
                                <div class="col-sm-8">{{ $output[0]['method_name'] }}</div>
                            </div>
                            @endif

                            @if($output[0]['application'])
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Application</label>
                                <div class="col-sm-8">{{ $output[0]['application'] }}</div>
                            </div>
                            @endif

                            @if($output[0]['qunatity'])
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Qunatity</label>
                                <div class="col-sm-8">{{ $output[0]['qunatity'] }}</div>
                            </div>
                            @endif

                            @if($output[0]['other_info'])
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Other Info</label>
                                <div class="col-sm-8">{{ $output[0]['other_info'] }}</div>
                            </div>
                            @endif
                        </div>

                        <div class="form-group row" style="margin: 0% 0% 2% 33%">
                            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/wish/{wishId}/proceedAsProduct')=='YES')
                            <a href="/wish/{{ $output[0]['id'] }}/proceedAsProduct" class="btn btn-success btn-lg" style="margin-right: 10%;"> Proceed For Product</a>
                            @endif

                            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/wish/{wishId}/discardProduct')=='YES')
                            <a href="/wish/{{ $output[0]['id'] }}/discardProduct" class="btn btn-secondary btn-lg"> Discard Wish</a>
                            @endif
                            
                        </div>

                    </div>
                </div>
            </div>   
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif                 
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/product/wish_master.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
