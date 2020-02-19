@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
$user_role_id = Session::get('role_id');
$is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Stock Quality Control(QC) Details </li>
        </ol>
    </nav>

    
    <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/qcDetails/qcStockInfoSave')=='YES')
        <form method="post" action="/qcDetails/qcStockInfoSave">
            {{ csrf_field() }}

            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/customerSample')=='YES')
            <div class="form-group row">
                <div class="col-sm-12">
                    <a href="/dashboard/addNewSample" style="float: right" class="btn btn-default">Add New Sample Request</a>
                </div>
            </div>
            @endif

            <div class="form-group row">
                <div class="card card-class">
                <div class="card-header card_header"> Stock Details </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-4 card-block-header">Stock Entry Used For</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["stock_entry_for"]}}</div>
                        </div>
                       
                        <div class="row">
                            <div class="col-md-4 card-block-header">Stock Entry Type </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["stock_entry_type"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Stock Entry Details Type </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["entry_type_details_id"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Inboard Date (YYYY-MM-DD)</div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["entry_date"]}}</div>
                        </div>
                        

                        <div class="row">
                            <div class="col-md-4 card-block-header">Warehouse Name </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["warehouse_name"]}}</div>
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
                                        <th scope="col">Scientific Name</th>
                                        <th scope="col">Method</th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 14px">
                                    @for ($i = 0; $i < count($output); $i++)
                                    <tr>
                                        <td>{{$i+1}}</td>
                                        <td>{{$output[$i]['item_code']}}</td>
                                        <td>{{$output[$i]['product_name']}}</td>
                                        <td>{{$output[$i]['scrientific_name']}}</td>
                                        <td>{{$output[$i]['method_name']}}</td>
                                    </tr>
                                    @endfor    
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>

            <input type="hidden" id="stock_entry_id" name="stock_entry_id" value="{{$output[0]['stock_entry_id']}}">

            <div class="form-group row"><label class="col-sm-12 col-form-label full_col">QC Information</label></div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">QC Test Result</label>
                <div class="col-sm-8">
                    <select class="form-control" id="qcTestResult" name="qcTestResult">
                        <option value="PASS">PASS</option><option value="FAIL">FAIL</option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">QC Remarks</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3" id="qc_remarks" name="qc_remarks"  required="required" onblur="validateAddress()"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Vendor Code</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="vendor_code" name="vendor_code" placeholder="vendor code" required="required" value="{{$output[0]['vendor_code']}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Vendor Batch Number</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="vendor_betch_number" name="vendor_betch_number" placeholder="vendor batch number" required="required" value="{{$output[0]['vendor_batch_number']}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">RAW Material Batch Number</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="raw_material_betch_number" name="raw_material_betch_number" placeholder="raw material betch number" required="required" value="{{$output[0]['raw_material_batch_number']}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">R & D Batch Number</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="r_d_betch_number" name="r_d_betch_number" placeholder="R&D betch number" required="required" value="{{$output[0]['r_d_batch_number']}}">
                </div>
            </div>
            
            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit QC Details</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                <div>
            </div>    
            
        </form>    
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>
    
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/custom/qc.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
