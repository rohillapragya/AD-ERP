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

    $request_date = $output[0]['request_date'];
    $req_date_arr = explode("-",$request_date);
    $req_year =  $req_date_arr[0];
    $req_month =  $req_date_arr[1];
    $req_day =  $req_date_arr[2];

    $delivered_date = $output[0]['delivered_date'];
    $deli_date_arr = explode("-",$delivered_date);
    $deli_year =  $deli_date_arr[0];
    $deli_month =  $deli_date_arr[1];
    $deli_day =  $deli_date_arr[2];

@endphp


    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Customer Sample Edit</li>
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
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/dashboard/editSampleRequest')=='YES')
        <form method="post" action="/dashboard/editSampleRequest" enctype="multipart/form-data">
                {{ csrf_field() }}
                <input type="hidden" value="{{$output[0]['sample_id']}}" name="sampleId">
            <!-- @if(count($output) > 0) -->
                <!-- @for ($i = 0; $i < count($output); $i++) -->
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Sample Request Date</label>
                    <div class="col-sm-8">
                        <div class="day-month-yaer-class">
                            <select class="form-control date-class" id="samplerequestDay" name="samplerequestDay">
                                @for ($i = 1; $i <= 31; $i++)
                                    @if($i==$req_day)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                    @endif 

                                    <!-- <option value={{ $i}}>{{ $i}}</option> -->
                                @endfor
                            </select>
                            <select class="form-control date-class" id="samplerequestMonth" name="samplerequestMonth">
                                @if($req_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                                @if($req_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                                @if($req_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                                @if($req_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                                @if($req_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                                @if($req_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                                @if($req_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                                @if($req_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                                @if($req_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                                @if($req_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                                @if($req_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                                @if($req_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                            </select>
                            <select class="form-control date-class" id="samplerequestyear" name="samplerequestyear">
                                @for ($i = 2019; $i <= 2022; $i++)
                                    @if($i==$req_year)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                    @endif 
                                @endfor
                            </select>
                        </div> 
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Sample Delivery Date</label>
                    <div class="col-sm-8">
                        <div class="day-month-yaer-class">
                            <select class="form-control date-class" id="sampledeliveryDay" name="sampledeliveryDay">
                                @for ($i = 1; $i <= 31; $i++)
                                    @if($i==$deli_day)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                    @endif 

                                    <!-- <option value={{ $i}}>{{ $i}}</option> -->
                                @endfor
                            </select>
                            <select class="form-control date-class" id="sampledeliveryMonth" name="sampledeliveryMonth">
                                @if($deli_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                                @if($deli_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                                @if($deli_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                                @if($deli_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                                @if($deli_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                                @if($deli_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                                @if($deli_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                                @if($deli_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                                @if($deli_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                                @if($deli_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                                @if($deli_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                                @if($deli_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                            </select>
                            <select class="form-control date-class" id="sampledeliveryyear" name="sampledeliveryyear">
                                @for ($i = 2019; $i <= 2022; $i++)
                                    @if($i==$deli_day)
                                        <option selected value={{ $i}}>{{ $i}}</option>
                                    @else  
                                        <option value={{ $i}}>{{ $i}}</option>
                                    @endif
                                @endfor
                                <!-- <option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option> -->
                            </select>
                        </div> 
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Any Behalf Of (If Any ...)</label>
                    <div class="col-sm-8">
                        <input type="input" class="form-control" id="behalf_of" name="behalf_of" value={{$output[0]["any_behalf_of"]}}>
                    </div>
                </div>

                <div class="form-group row" style="margin-top: 4%"> <label class="col-sm-12 col-form-label">Customer Details</label> </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Full Name</label>
                    <div class="col-sm-8">
                        <input type="input" class="form-control" id="full_name" name="full_name" value={{$output[0]["ref_name"]}} required="required">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Mobile</label>
                    <div class="col-sm-8">
                        <input type="input" class="form-control" id="mobile" name="mobile" value={{$output[0]["ref_mobile"]}} required="required">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Email</label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control" id="email" name="email" value={{$output[0]["ref_email"]}} required="required">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Address</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" rows="3" id="address" name="address" onblur="validateAddress()" required="required">{{$output[0]["ref_address"]}}</textarea>
                    </div>
                </div>
                

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Attachment (.pdf,.jpg,.jpeg,.png with max 2 MB size)</label>
                    <div class="col-sm-8">
            
                        <div class="custom-file" style="display: flex;">
                            <input type="file" class="form-control-file" id="sample_attacment" name="sample_attacment">

                            @if($output[0]['attachment_1'])
                                <div style="width: 200px;border: 2px solid black;height: 130px;">
                                    <img src="{{ asset('sample_img/'.$output[0]['attachment_1']) }}" style="object-fit: fill;width: 100%;height: 100%;">
                                    <div> {{$output[0]['attachment_1']}}</div>
                                    <span class="glyphicon glyphicon-remove-circle" style="margin: -100% 0% 0% -22%;font-size: 25px;cursor: pointer;" onclick="onclickRemoveSampleAttachment('{{$output[0]['sample_id']}}','{{ $output[0]['attachment_1'] }}')"></span>
                                </div>
                            @endif
                            <!-- <img src="{{ asset('product_image/'.$output[0]['image']) }}" > -->
                        </div>

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
                                @if(count($output) > 0)
                                    @for ($i = 0; $i < count($output); $i++)
                                        <tr>
                                            <th style="vertical-align:middle">{{($i+1)}}</th>

                                            <th>
                                                <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 360px">
                                                  <@for ($ix = 0; $ix < count($product); $ix++) 
                                                        @if($output[$i]['code']==$product[$ix]['id'])
                                                             <option  selected value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                                        @else
                                                             <option value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                                        @endif
                                                       
                                                    @endfor
                                                </select>

                                            </th>

                                            <th>
                                                <select name="product_method[][method]" class="form-control" id='method' style="width:140px">
                                                    @for ($ix = 0; $ix < count($method); $ix++) 
                                                        @if($output[$i]['method']==$method[$ix]['id'])
                                                             <option  selected value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                                        @else
                                                             <option value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                                        @endif
                                                    @endfor
                                                </select>
                                            </th>

                                            <th>
                                                <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" style="width:140px" required="required" min="1" value="{{$output[$i]['qunatity']}}">
                                            </th>
                                            <th>
                                                <select id="uom" class="form-control" name="product_uom[][uom]">
                                                   @for ($ix = 0; $ix < count($uom); $ix++) 
                                                        @if($output[$i]['uom']==$uom[$ix]['id'])
                                                            <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                                        @else
                                                            <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                                        @endif
                                                    @endfor
                                                </select>
                                            </th>
                                            <th><span class="glyphicon glyphicon-remove" id={{($i)}} onclick=ondeleteProductFromTable(this)></span></th>
                                        </tr>
                                        @endfor 
                                @else  
                                    <tr>
                                        <td colspan="6" class="no-data-found">No Sample found</td>
                                    </tr>
                                @endif       
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
                <!-- @endfor -->
                            
            <!-- @else  
               <div class="no-data-found">Not found</div>
            @endif       -->
        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/custom/customer_sample_request_edit.js') }}"></script>
<!-- <script src="{{ asset('js/custom/custom.js') }}"></script> -->


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->