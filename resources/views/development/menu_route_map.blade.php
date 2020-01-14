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
@endphp


    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Development /  Route & Menu Map</li>
        </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1')
            <div class="form-group row">
                <div class="col-sm-12">

                    <div class="accordion" id="accordionExample">

                        @for($ix=0;$ix< count($activeMenuList);$ix++)
                            <div class="card">
                                <div class="card-header" id="menu_{{$activeMenuList[$ix]['id']}}">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse_menu_{{$activeMenuList[$ix]['id']}}" aria-expanded="true" aria-controls="collapse_menu_{{$activeMenuList[$ix]['id']}}" style="text-transform: capitalize;"> {{$activeMenuList[$ix]['name']}}
                                        </button>
                                    </h2>
                                </div>

                                <div id="collapse_menu_{{$activeMenuList[$ix]['id']}}" class="collapse show" aria-labelledby="menu_{{$activeMenuList[$ix]['id']}}" data-parent="#accordionExample">
                                    <div class="card-body" id="add_route_card_{{$activeMenuList[$ix]['id']}}">

                                        <button type="button" class="btn btn-info" style="color: #373636;font-size: 14px" id="add_route_btn_{{$activeMenuList[$ix]['id']}}" onclick="onclickAddRoute(id)">Add Route (URL)</button>
                                    
                                    </div>
                                </div>
                            </div>
                        @endfor


                    </div>

                </div>
            </div>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>
    
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="{{ asset('js/development/menu_route_map.js') }}"></script>