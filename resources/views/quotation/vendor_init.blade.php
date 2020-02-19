@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/prn/init.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Verify Purchase Requization Note (PRN) /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashoard/vendorQuotationInit')=='YES')
        <div class="form-group row">
            <table class="table table-bordered">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: initial;">#</th>
                        <th scope="col" style="vertical-align: initial;width: 220px;">Quotation No</th>
                        <th scope="col" style="vertical-align: initial;width: 160px;">Added By</th>
                        <th scope="col" style="vertical-align: initial;">Remark</th>
                        <th scope="col" style="vertical-align: initial;">Required Date(YYYY-MM_DD)</th>
                        <th scope="col" style="vertical-align: initial;">Request Date(YYYY-MM_DD)</th>
                        <th scope="col" style="vertical-align: initial;">Vendor Quotation</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['quotation_no']}}</td>
                                <td>{{$output[$i]['first_name']}}  {{$output[$i]['last_name']}}</td>
                                <td>{{$output[$i]['other_info']}}</td>
                                <td>{{$output[$i]['delivery_date']}}</td>
                                <td>{{$output[$i]['request_date']}}</td>
                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/quotation/{qID}')=='YES')

                                    @if($output[$i]['status']=='PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED')
                                         <td><a href="/quotation/{{$output[$i]['id']}}" class="btn btn-primary btn-sm">Add Vendor Quotation</a></td>
                                    @else
                                        <td>
                                            --
                                           <!--  <a href="/quotation/view/{{$output[$i]['id']}}" class="btn btn-primary btn-sm" style="width: 140px;">View Quotation</a> -->
                                        </td>
                                    @endif
                                   
                                @else
                                    <td>--</td>
                                @endif 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="7" class="no-data-found">No Vendor Quotation found</td>
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

<script src="{{ asset('js/prn/init.js') }}"></script>