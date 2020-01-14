@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/purchaseIndent/init.css') }}">
<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


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
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /   Purchase Indent /  Action </li>
        </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='7')
        <form method="post" action="/pi/action/save">
            {{ csrf_field() }}

            <input type="hidden" id="purchase_indent_id" name="purchase_indent_id" value="{{$output[0]['purchase_indent_detail_id']}}">

            <input type="hidden" id="inquiry_number" name="inquiry_number" value="{{$output[0]['inquiry_no']}}">

             <div class="form-group row">
               <div class="card card-class">
                    <div class="card-header card_header"> Purchase Indent Items Details </div>
                    <div class="card-body">
                      
                        <div class="row">
                            <div class="col-md-4 card-block-header">Purchase Indent number</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["purchase_indent_id"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Inquiry Number</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["inquiry_no"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 card-block-header" style="margin: 3% 0% 3% 0%;">Items Details</div>
                        </div>

                        <div class="row">
                            <table class="table table-bordered" style="margin: 0% 2%">
                                <thead style="background-color: #eef1ed;font-size: 14px;">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Code</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Scientific Name</th>
                                        <th scope="col">Method</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">UOM</th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 14px">
                                    @for ($i = 0; $i < count($output); $i++)
                                    <tr>
                                        <td>{{$i+1}}</td>
                                        <td>{{$output[$i]['product_code']}}</td>
                                        <td>{{$output[$i]['product_name']}}</td>
                                        <td>{{$output[$i]['scrientific_name']}}</td>
                                        <td>{{$output[$i]['method_name']}}</td>
                                        <td>{{$output[$i]['qty']}}</td>
                                        <td>{{$output[$i]['uom']}}</td>
                                    </tr>
                                    @endfor    
                                </tbody>
                            </table>
                        </div>

                        <div class="form-group row" style="margin-top: 2%;">
                            <div class="col-md-4 card-block-header">Is arrangement possible ?</div>
                            <div class="col-md-8 card-block-detail">
                                <select class="form-control date-class" id="piArranagemnetPossible" name="piArranagemnetPossible" onchange="arrangementPossible(this)">
                                   <option value='N'>No</option>
                                   <option value='Y'>Yes</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row" id="isSampleRequest" style="display: none">
                            <div class="col-md-4 card-block-header">Is Customer Request for Sample ?</div>
                            <div class="col-md-8 card-block-detail">
                                <select class="form-control date-class" id="CustomerRequestForSample" name="CustomerRequestForSample" onchange="CustomerRequestSample(this)">
                                   <option value='N'>No</option>
                                   <option value='Y'>Yes</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Remark</label>
                            <div class="col-sm-8">
                               <textarea class="form-control" id="pi_remark" name="pi_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="2000"></textarea>
                               <span id="pi_remark_span">Only 2000 characters are allowed</span>
                            </div>
                        </div>

                        <div class="row" id="pi_proceed_for_dispatch" style="display: none">
                            <div class="col-md-12 card-block-detail">
                              <input type="checkbox" value="Y" name="proceedforDispatch">
                                <span style="margin-left: 1%;text-transform: initial;">Are you want to proceed for Dispatch ?</span>
                            </div>  
                        </div>


                        <div class="form-group row" style="margin-top: 5%"> 
                            <div class="col-sm-4"></div>
                            <div class="col-sm-8">
                                <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                                <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                            </div>
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

<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/purchaseIndent/init.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->