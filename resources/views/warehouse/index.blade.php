@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/warehouse/warehouse.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Warehouse /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='11')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addNewWarehouse" style="float: right" class="btn btn-default">Add New Warehouse</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Warehouse Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">City</th>
                        <th scope="col">Active</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['name']}}</td>
                                <td>{{$output[$i]['address']}}</td>
                                <td>{{$output[$i]['city']}}</td>
                                <td>{{$output[$i]['is_active']}}</td>
                                <td><a href="/warehouse/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="6" class="no-data-found">No Warehouse found</td>
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

<script src="{{ asset('js/warehouse/warehouse.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
