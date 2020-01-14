@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


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
	        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Customer /  List</li>
	    </ol>
    </nav>
    

    <div class="container box-shadow">
    	 @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='5')
	        <div class="form-group row">
	            <div class="col-sm-12">
	                <a href="/dashboard/addCustomer" style="float: right" class="btn btn-default">Add Customer</a>
	            </div>
	        </div>    

            <div class="form-group row">
	            <table class="table table-bordered" id="sampleItemsList">
	                <thead style="background-color: #eef1ed;font-size: 14px;">
	                    <tr>
	                        <th scope="col">#</th>
	                        <th scope="col">Company Name</th>
	                        <th scope="col">Mobile</th>
	                        <th scope="col">Email</th>
	                        <th scope="col">City</th>
	                        <th scope="col">Address</th>
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
	                                <td>{{$output[$i]['city_name']}}</td>
	                                <td>{{$output[$i]['address']}}</td>
	                                <td><a href="/customer/edit/{{$output[$i]['Id']}}"><span class="glyphicon glyphicon-pencil"></a></td>
	                              
	                               	<!-- @if($user_role_id=='3' || $user_role_id=='7') -->
		                            
		                           <!--  @else
		                                <td><span class="glyphicon glyphicon-pencil"></td>
		                            @endif -->
	                            </tr>
	                        @endfor
	                    @else  
	                        <tr>
	                            <td colspan="7" class="no-data-found">No Customer found</td>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->