@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css//mrn/init.css') }}">
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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /   Material Requization Note (MRN) /  Add </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='3' || $user_role_id=='7'|| $user_role_id=='8' || $user_role_id=='10')
        <form method="post" action="/mrn/save"> 
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Request Type</label>
                <div class="col-sm-8">
                    <select class="form-control" id="mrn_request_type" name="mrn_request_type">
                       <option  value="SAMPLE">Sample</option>
                       <option  value="INQUIRY">Inquiry</option>
                       <option  value="PURCHASE_INDENT">Purchase Indent</option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Request ID</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="mrn_request_id" name="mrn_request_id" placeholder="required id" required="required" onblur="validateObjectID(this)" >
                </div>
            </div>
           
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Required Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="mrnrequiredDay" name="mrnrequiredDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="mrnrequiredMonth" name="mrnrequiredMonth">
                            <option value="01">Jan</option> 
                            <option value="02">Feb</option>
                            <option value="03">Mar</option>
                            <option value="04">Apr</option>
                            <option value="05">May</option>
                            <option value="06">Jun</option>
                            <option value="07">Jul</option>
                            <option value="08">Aug</option>
                            <option value="09">Sep</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select>
                        <select class="form-control date-class" id="mrnrequiredyear" name="mrnrequiredyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Purpose</label>
                <div class="col-sm-8">
                    <select class="form-control" id="mrn_purpose_type" name="mrn_purpose_type">
                        @for ($i=0;$i < count($purposeList);$i++)
                            <option  value={{ $purposeList[$i]["id"]}}> {{$purposeList[$i]["purpose"]}}</option>
                        @endfor
                    </select>

                    <button type="button" class="btn btn-link addNewPurpose" id="addNewPurpose" onclick="onClickAddNewPurpose()" style="float: right;">Add New Purpose</button>
                
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Remark</label>
                <div class="col-sm-8">
                   <textarea class="form-control" id="mrn_remark" name="mrn_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="200"></textarea>
                   <span id="mrn_remark_span">Only 200 characters are allowed</span>
                </div>
            </div>

           
             <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="mrnItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Name</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Qty</th>
                                <th scope="col" style="vertical-align: middle;">UOM</th>
                                <th scope="col" style="vertical-align: middle;">Control Sample Qty</th>
                                <th scope="col" style="vertical-align: middle;">Control Sample UOM</th>
                                <th scope="col" style="vertical-align: middle;">Action</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            <tr>
                                <th style="vertical-align:middle">1</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 250px">
                                        <option value="0">NA</option>
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 150px">
                                        <option value="0">Select Method</option>
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
                                        <option value="1">KG</option>
                                    </select>
                                </th>

                                 <th>
                                    <input class="form-control qty" id="product_sample_qty" type="number" name="product_sample_qty[][product_sample_qty]" placeholder="sample qty" required="required" min="0">
                                </th>

                                <th>
                                    <select id="product_sample_uom" class="form-control" name="product_sample_uom[][product_sample_uom]">
                                        <option value="1">KG</option>
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="addSampleNewRow()">Add New Row</button>
                    </div>
                </div> 
            </div>  

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
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
<script src="{{ asset('js/mrn/init.js') }}"></script>
<script src="{{ asset('js/mrn/function.js') }}"></script>
<script src="{{ asset('js/mrn/addPurpose.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->