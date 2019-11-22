@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/purchaseIndent/init.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Pending Inquiry List /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='3' || $user_role_id=='7')
       <!--  <div class="form-group row">
            <div class="col-sm-12">
                <a href="#" style="float: right" class="btn btn-default">Add New Inquiry</a>
            </div>
        </div> -->

        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: initial">#</th>
                        <th scope="col" style="vertical-align: initial">Inquiry Id</th>
                        <th scope="col" style="vertical-align: initial">Purchase Indent Number</th>
                        <th scope="col" style="vertical-align: initial">Request Date(DD-MM-YYYY)</th>
                        <th scope="col" style="vertical-align: initial">Requester Name</th>
                        <th scope="col" style="vertical-align: initial">Status</th>
                        <th scope="col" style="vertical-align: initial">Add Sample</th>
                        <th scope="col" style="vertical-align: initial">Create New PI</th>
                        <th scope="col" style="vertical-align: initial">Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td style="text-align: center;">{{($i+1)}}</td>
                                <td style="text-align: center;">{{$output[$i]['inquiry_no']}}</td>
                                <td style="text-align: center;">{{$output[$i]['purchase_indent_number']}}</td>
                                <td style="text-align: center;">{{$output[$i]['date']}}</td>
                                <td style="text-align: center;">{{$output[$i]['first_name']}}  {{$output[$i]['last_name']}}</td>
                                <td style="text-align: center;">{{$output[$i]['status']}}</td>
                                <td style="text-align: center;">
                                    @if($output[$i]['is_sample_request']=='Y')
                                       <a href="/pi/{{$output[$i]['purchase_indent_id']}}/SampleRequest"><span class="glyphicon glyphicon glyphicon-plus-sign"></span></a>
                                     @else
                                       <span class="glyphicon glyphicon glyphicon-plus-sign" style="color: grey;"></span>
                                     @endif
                                
                                </td>
                                <td style="text-align: center;">
                                    @if($output[$i]['purchase_indent_number']=='')
                                       <a href="/pi/inquiry/{{$output[$i]['inquiry_no']}}"><span class="glyphicon glyphicon glyphicon-plus-sign"></a>
                                     @else
                                       <span class="glyphicon glyphicon glyphicon-plus-sign" style="color: grey;"></span>
                                     @endif
                                    <!-- <a href="/pi/inquiry/{{$output[$i]['inquiry_no']}}"><span class="glyphicon glyphicon glyphicon-plus-sign"></a> -->
                                </td> 
                                <td style="text-align: center;">
                                    @if($output[$i]['purchase_indent_number']!='')
                                       <a href="/pi/{{$output[$i]['purchase_indent_id']}}/action"><span class="glyphicon glyphicon glyphicon-triangle-right"></a>
                                     @else
                                       <span class="glyphicon glyphicon-triangle-right" style="color: grey;"></span>
                                     @endif
                                   <!--  <a href="/pi/inquiry/{{$output[$i]['inquiry_no']}}"><span class="glyphicon glyphicon-triangle-right"></a> -->
                                </td> 
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Inquiry found</td>
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

<script src="{{ asset('js/purchaseIndent/init.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
