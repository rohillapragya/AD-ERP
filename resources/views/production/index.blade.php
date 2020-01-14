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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Production /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='8')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addProduction" style="float: right" class="btn btn-default">Add New Production</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="bomItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Production Number</th>
                        <th scope="col">Manufacturer Item</th>
                        <th scope="col">Qty</th>
                        <th scope="col">BOM</th>
                        <th scope="col">Source Warehouse</th>
                        <th scope="col">Target Warehouse</td>
                        <th scope="col">Start Date</td>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['production_number']}}</td>
                                <td>{{$output[$i]['items_to_manufacturer']}}</td>
                                <td>{{$output[$i]['qty']}}</td>
                                <td>{{$output[$i]['BOM_no']}}</td>
                                <td>{{$output[$i]['source_warehouse']}}</td>
                                <td>{{$output[$i]['target_warehouse']}}</td>
                                <td>{{$output[$i]['production_start_date']}}</td>
                                <td><a href="/production/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Production Records found(s)</td>
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

<script src="{{ asset('js/bom/init.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
