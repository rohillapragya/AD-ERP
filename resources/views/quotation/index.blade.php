@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/prn/init.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Verify Purchase Requization Note (PRN) /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='13')
        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Purchase Requization No</th>
                        <th scope="col">Required Date(YYYY-MM_DD)</th>
                        <th scope="col">Request Date(YYYY-MM_DD)</th>
                        <th scope="col">Create Purchase Request</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['purchase_request_no']}}</td>
                                <td>{{$output[$i]['required_date']}}</td>
                                <td>{{$output[$i]['created_at']}}</td>
                                <td><a href="/prn/{{$output[$i]['id']}}/quotation/create" class="btn btn-primary btn-sm">Create Purchase Request</a></td> 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="5" class="no-data-found">No Purchase Request found</td>
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


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
