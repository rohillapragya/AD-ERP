@extends('layout.dashboard_header_layout')

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /   Product /  List </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7')
        <!-- <div class="form-group row" style="box-shadow: 7px 4px 10px #f1f1f1;">
            <div class="col-sm-10">  <input type="input" class="form-control" id="product_name"  placeholder="product name"></div>
            
            <div class="col-sm-2"><button type="button" class="btn btn-primary btn-sm" style="width: 60%">  
                <span class="glyphicon glyphicon-search" style="margin-right: 20%"></span>Search</button>
            </div>
        </div> -->

          <div class="form-group row" style="margin: 5% 0% 0% 0%;">
            <div class="list-group" id="myList" role="tablist">
                @for ($i=0;$i < count($getCategoryList);$i++) 
                    @if($i==0)
                        <a class="list-group-item list-group-item-action active" id={{$getCategoryList[$i]['id']}} data-toggle="list" href="#" role="tab" onclick="onClickCategory(id)">{{$getCategoryList[$i]['name']}}</a>
                    @else
                        <a class="list-group-item list-group-item-action" id={{$getCategoryList[$i]['id']}} data-toggle="list" href="#" role="tab" onclick="onClickCategory(id)">{{$getCategoryList[$i]['name']}}</a>
                    @endif
                @endfor
            </div>

            <div class="tab-content">
                <div class="tab-pane active" id="home" role="tabpanel" style="margin: -2% 0% 0% 6%;padding: 2%;">Home</div>
            </div>
        </div>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop

<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/product/list.js') }}"></script>