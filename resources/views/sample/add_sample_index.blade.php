@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');

@endphp


    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Customer Sample Request</li>
    </ol>
    </nav>

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

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/saveSampleRequest')=='YES')
        <form method="post" action="/dashboard/saveSampleRequest" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Sample Request Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="samplerequestDay" name="samplerequestDay">
                            <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option> <option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                        </select>
                        <select class="form-control date-class" id="samplerequestMonth" name="samplerequestMonth">
                            <option value="01">Jan</option><option value="02">Feb</option><option value="03">Mar</option><option value="04">Apr</option><option value="05">May</option><option value="06">Jun</option><option value="07">Jul</option><option value="08">Aug</option><option value="09">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option>
                        </select>
                        <select class="form-control date-class" id="samplerequestyear" name="samplerequestyear">
                            <option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option>
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Sample Delivery Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="sampledeliveryDay" name="sampledeliveryDay">
                            <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option> <option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                        </select>
                        <select class="form-control date-class" id="sampledeliveryMonth" name="sampledeliveryMonth">
                            <option value="01">Jan</option><option value="02">Feb</option><option value="03">Mar</option><option value="04">Apr</option><option value="05">May</option><option value="06">Jun</option><option value="07">Jul</option><option value="08">Aug</option><option value="09">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option>
                        </select>
                        <select class="form-control date-class" id="sampledeliveryyear" name="sampledeliveryyear">
                            <option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option>
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Any Behalf Of (If Any ...)</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="behalf_of" name="behalf_of" placeholder="behalf of (if any..)" value="{{ old('behalf_of') }}">
                </div>
            </div>

            <div class="form-group row" style="margin-top: 4%"> <label class="col-sm-12 col-form-label">Customer Details</label> </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Full Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="full_name" name="full_name" placeholder="Full Name" required="required" value="{{ old('full_name') }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Mobile</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="mobile" name="mobile" placeholder="mobile" required="required" value="{{ old('mobile') }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required="required" value="{{ old('email') }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Address</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3" id="address" name="address" onblur="validateAddress()" required="required">{{ old('address') }}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Attachment (.pdf,.jpg,.jpeg,.png with max 2 MB size)</label>
                <div class="col-sm-8">
                    <div class="custom-file">
                        <input type="file" class="form-control-file" id="sample_attacment" name="sample_attacment">
                    </div>
                    <!-- <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button">Button</button>
                    </div> -->
                </div>
            </div>

            <div class="form-group row" style="margin-top: 4%"> <label class="col-sm-12 col-form-label">Items Details</label> </div>

            <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="sampleItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Method</th>
                                <th scope="col">Qty</th>
                                <th scope="col">UOM</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            <tr>
                                <th style="vertical-align:middle">1</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 360px">
                                        <option value="0">NA</option>
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width:140px">
                                        <option value="0">Select Method</option>
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" style="width:140px" required="required" min="1">
                                </th>
                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
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
                <div>
            </div>    
            
        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/custom/custom.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
