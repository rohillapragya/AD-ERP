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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Stock /  Latest Stock Entry</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='11' || $user_role_id=='7')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addNewStockEntry" style="float: right" class="btn btn-default">Add New Stock Entry</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: baseline;">#</th>
                        <th scope="col" style="vertical-align: baseline;width: 113px;">Product Code</th>
                        <th scope="col" style="vertical-align: baseline;">Product Name</th>
                        <th scope="col" style="vertical-align: baseline;width: 65px;">Qty</th>
                        <th scope="col" style="vertical-align: baseline;">Purpose</th>
                        <th scope="col" style="vertical-align: baseline;">Type</th>
                        <th scope="col" style="vertical-align: baseline;">Details</th>
                        <th scope="col" style="vertical-align: baseline;">Description</th>
                        <th scope="col" style="vertical-align: baseline;">Warehouse</th>
                        <th scope="col" style="vertical-align: baseline;width: 90px;">Entry Date</th>
                        <th scope="col" style="vertical-align: baseline;">Edit</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['item_code']}}</td>
                                <td>{{$output[$i]['product_name']}}</td>
                                <td>{{$output[$i]['item_qty']}} Kg</td>
                                <td>{{$output[$i]['stock_entry_for']}}</td>
                                <td>{{$output[$i]['store_type']}}</td>
                                <td>{{$output[$i]['store_type_details']}}</td>
                                <td>{{$output[$i]['entry_description']}}</td>
                                <td>{{$output[$i]['warehouse_name']}}</td>
                                <td>{{$output[$i]['created_at']}}</td>
                                <td><a href="/store/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="6" class="no-data-found">No Stock Entry found</td>
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
