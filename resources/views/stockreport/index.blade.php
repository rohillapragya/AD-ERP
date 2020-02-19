@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/stockReport/index.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Stock / Report</li>
    </ol>
    </nav>


     <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/StockReport')=='YES')
        <div class="form-group row">
            <div class="col-sm-1 searchClass">Search</div>
            <div class="col-sm-4">
                <select class="form-control" id="warehouseid">
                    <option  value='ALL'>All Warehouse</option>
                    @for ($i=0;$i < count($warehouse);$i++)
                        <option  value={{ $warehouse[$i]["id"]}}> {{$warehouse[$i]["name"]}}</option>
                    @endfor
                </select>
            </div>
            
            <div class="col-sm-6">
                <select class="form-control" id="productCode">
                    <option  value='ALL'>All Products</option>
                    @for ($i=0;$i < count($product);$i++)
                        <option  value={{ $product[$i]["id"]}}> {{$product[$i]["name"]}}</option>
                    @endfor
                </select>
            </div>


            <div class="col-sm-1">
                <button class="btn btn-default" onclick="onClickStockByWarehouseId()">Search</button>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="stockList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: initial">#</th>
                        <th scope="col" style="vertical-align: initial;width: 110px;">Code</th>
                        <th scope="col" style="vertical-align: initial">Name</th>
                        <th scope="col" style="vertical-align: initial">Botanical Name</th>
                        <th scope="col" style="vertical-align: initial">Warehouse</th>
                        <th scope="col" style="vertical-align: initial">Inward Qty</th>
                        <th scope="col" style="vertical-align: initial">Inward Control Qty</th>
                        <th scope="col" style="vertical-align: initial">Outward Qty</th>
                        <th scope="col" style="vertical-align: initial">Outward Control Qty</th>
                        <th scope="col" style="vertical-align: initial">Qty Diff</th>
                        <th scope="col" style="vertical-align: initial">Qty UOM</th>
                        <!-- <th scope="col" style="vertical-align: initial">Control Qty Diff</th> -->
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" id="stockListTbody">
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['item_code']}}</td>
                                <td>{{$output[$i]['product_name']}}</td>
                                <td>{{$output[$i]['botanical_name']}}</td>
                                <td>{{$output[$i]['warehouse_name']}}</td>
                                <td style="text-align: right;"><span class="item_qty_inward_class">{{$output[$i]['Inward_item_qty']}}</span></td>
                                <td style="text-align: right;"><span class="item_qty_outward_class">{{$output[$i]['Inward_control_qty']}}</span></td>
                                <td style="text-align: right;"><span class="item_qty_inward_control_class">{{$output[$i]['Outward_item_qty']}}</span></td>
                                <td style="text-align: right;"><span class="item_qty_outward_control_class">{{$output[$i]['Outward_control_qty']}}</span></td>
                                <td style="text-align: right;"><span class="item_qty_inward_class_diff"></span></td>
                                <td style="text-align: right;">{{$output[$i]['item_uom']}}</td>
                                <!-- <td><span class="item_qty_outward_class_diff"></span></td> -->
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="12" class="no-data-found">No record(s) found</td>
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

<script src="{{ asset('js/stockReport/index.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->