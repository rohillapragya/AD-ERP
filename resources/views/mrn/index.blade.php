@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/mrn/mrn.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Material Requization Note (MRN) /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">

        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/dashboard/addNewMRN" style="float: right" class="btn btn-default">Add New MRN</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Material Request No</th>
                        <th scope="col">Required Date</th>
                        <th scope="col">Request Date</th>
                        <th scope="col">Type</th>
                        <th scope="col">Type Id</th>
                        <th scope="col">Stock Entry</th>
                        <th scope="col">Create PRN</th>
                        <!-- <th scope="col">Edit</th> -->
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['material_request_no']}}</td>
                                <td>{{$output[$i]['required_date']}}</td>
                                <td>{{$output[$i]['request_date']}}</td>
                                <td>{{$output[$i]['object_type']}}</td>
                                <td>{{$output[$i]['object_id']}}</td>
                                <td><a href="/mrn/{{$output[$i]['id']}}/stockEntry" class="btn btn-default">Stock_Entry</a></td>
                                <td><a href="#" class="btn btn-default">Create_PRN</a></td>
                                <!-- <td><a href="/mrn/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td>  -->
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No MRN found</td>
                        </tr>
                    @endif    
                </tbody>
            </table>
        </div>
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/mrn/mrn.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
