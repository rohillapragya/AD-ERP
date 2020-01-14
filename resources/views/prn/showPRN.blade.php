@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    @if($errors->all())
        <div class="alert alert-danger" role="alert">
            <div class="row">
                <ul>
                    @foreach($errors->all() as $error)
                        <li>{{$error}}</li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif



    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Purchase Requization Note (PRN) /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='13')
        <form method="post" action="/prn/verifyPRN">
            {{ csrf_field() }}
            <div class="form-group row">
                <div class="col-sm-12">
                    <a href="/dashboard/addNewPRN" style="float: right" class="btn btn-default">Add New PRN</a>
                </div>
            </div>

            <div class="form-group row">
               <div class="card card-class">
                    <div class="card-header card_header"> Purchase Requization Note (PRN) Details </div>
                    <div class="card-body">
                        <input type="hidden" id="prnID" name="prnID" value="{{$output[0]['purchase_entry_id']}}">
                        <div class="row">
                            <div class="col-md-4 card-block-header">PRN Number</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["purchase_request_no"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Required Date(YYYY-MM-DD)</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["required_date"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Remarks</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["remarks"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 card-block-full">Items Details</div>
                        </div>

                        <div class="row">
                            <table class="table table-bordered" style="margin: 0% 2%">
                                <thead style="background-color: #eef1ed;font-size: 14px;">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Code</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Method</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">UOM</th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 14px">
                                    @for ($i = 0; $i < count($output); $i++)
                                    <tr>
                                        <td>{{$i+1}}</td>
                                        <td>{{$output[$i]['item_code']}}</td>
                                        <td>{{$output[$i]['product_name']}} ( {{$output[$i]['product_scrientific_name']}} )</td>
                                        <td>{{$output[$i]['method_name']}}</td>
                                        <td>{{$output[$i]['item_qty']}}</td>
                                        <td>{{$output[$i]['item_uom']}}</td>
                                    </tr>
                                    @endfor    
                                </tbody>
                            </table>
                        </div> 

                        <div class="row">
                            <div class="col-md-12 card-block-detail">
                              <input type="checkbox" value="1" required="required" name="verifyPRN">
                                <span style="margin-left: 1%;text-transform: initial;">I am verifing this Purchase Requization Note (PRN).</span>
                            </div>  
                        </div>

                        <div class="form-group row" style="margin-top: 5%"> 
                            <div class="col-sm-4"></div>
                            <div class="col-sm-8">
                                <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Verify</button>
                                <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                            <div>
                        </div>  
                    </div>
               </div>
            </div>
        </form> 
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