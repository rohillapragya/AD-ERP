@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/mrn/mrn.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->
@php
$user_role_id = Session::get('role_id');
@endphp

 	<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Vendor /  List</li>
    </ol>
    </nav>

	
    <div class="container box-shadow">
    	@if($user_role_id=='3' || $user_role_id=='7')
	        <div class="form-group row">
	            <div class="col-sm-12">
	                <a href="/dashboard/addVendor" style="float: right" class="btn btn-default">Add Vendor</a>
	            </div>
	        </div>    

            <div class="form-group row">
	            <table class="table table-bordered" id="sampleItemsList">
	                <thead style="background-color: #eef1ed;font-size: 14px;">
	                    <tr>
	                        <th scope="col">#</th>
	                        <th scope="col">company_name</th>
	                        <th scope="col">mobile</th>
	                        <th scope="col">email</th>
	                        <th scope="col">city_code</th>
	                        <th scope="col">address</th>
	                        <th scope="col">Edit</th>
	                    </tr>
	                </thead>
	                <tbody style="font-size: 14px;" >
	                    @if(count($output) > 0)
	                        @for ($i = 0; $i < count($output); $i++)
	                            <tr>
	                                <td>{{($i+1)}}</td>
	                                <td>{{$output[$i]['company_name']}}</td>
	                                <td>{{$output[$i]['mobile']}}</td>
	                                <td>{{$output[$i]['email']}}</td>
	                                <td>{{$output[$i]['city_code']}}</td>
	                                <td>{{$output[$i]['address']}}</td>
	                                <td><a href="#"><span class="glyphicon glyphicon-pencil"></a></td>
	                                <!-- <td><a href="/mrn/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> --> 
	                            </tr>
	                        @endfor
	                    @else  
	                        <tr>
	                            <td colspan="7" class="no-data-found">No Vendor found</td>
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

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
