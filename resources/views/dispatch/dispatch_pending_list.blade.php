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
			<li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Dispatch Pending List</li>
		</ol>
	</nav>

	<div class="container box-shadow">
	 	<table class="table table-bordered">
            <thead style="background-color: #eef1ed;font-size: 14px;">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Type</th>
                    <th scope="col">Dispatch Type</th>
                    <!-- <th scope="col">Id</th> -->
                    <th scope="col">Number</th>
                    <th scope="col">Request Date</th>
                    <th scope="col">Status</th>
                    <th scrope="col">Action</th>
                </tr>
            </thead>
            <tbody style="font-size: 14px;" >
                @if(count($output) > 0)
                    @for ($i = 0; $i < count($output); $i++)
                        <tr>
                            <td>{{($i+1)}}</td>
                            <td>{{$output[$i]['type']}}</td>
                            <td>{{$output[$i]['dispatch_type']}}</td>
                            <!-- <td>{{$output[$i]['sample_id']}}</td> -->
                            <td>{{$output[$i]['sample_number']}}</td>
                            <td>{{$output[$i]['request_date']}}</td>
                            <td>{{$output[$i]['status']}}</td>
                            <td><a href="/dispatch/save/{{$output[$i]['sample_id']}}"><span class="glyphicon glyphicon-triangle-right"></span></a></td>
                        </tr>
                    @endfor
                @else  
                    <tr>
                        <td colspan="7" class="no-data-found">No Dispatch Service found found</td>
                    </tr>
                @endif    
            </tbody>
        </table>
	</div>
    
@stop

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
