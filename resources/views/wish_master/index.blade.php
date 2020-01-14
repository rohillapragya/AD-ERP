@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/bom/init.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  User Wish /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7' || $user_role_id=='11')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/wish/add" style="float: right" class="btn btn-default">Add New Wish List</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="productMethodTable">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: sub;">#</th>
                        <th scope="col" style="vertical-align: sub;">Wish Id</th>
                        <th scope="col" style="vertical-align: sub;">Requester Name</th>
                        <th scope="col" style="vertical-align: sub;">Wish Name</th>
                        <th scope="col" style="vertical-align: sub;">Description</th>
                        <th scope="col" style="vertical-align: sub;">Application</th>
                        <th scope="col" style="vertical-align: sub;">Wish Date (YYYY-MM-DD)</th>
                        <th scope="col" style="vertical-align: sub;">Edit</th>
                        @if($user_role_id=='3')
                        <th scope="col" style="vertical-align: sub;">Action</th>
                        @endif
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['wish_id']}}</td>
                                <td>{{$output[$i]['first_name']}} {{$output[$i]['last_name']}}</td>
                                <td>{{$output[$i]['name']}}</td>
                                <td>{{$output[$i]['description']}}</td>
                                <td>{{$output[$i]['application']}}</td>
                                <td>{{$output[$i]['created_at']}}</td>
                                <td>
                                    <a href="/wish/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a>
                                </td>
                                @if($user_role_id=='3')
                                <td scope="col"><a href="/wish/action/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-tag"></span></a></td>
                                @endif
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Wish found</td>
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

<script src="{{ asset('js/product/wish_master.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
