@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Sample/dashboard.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
    $user_role_id = Session::get('role_id');
    $behalf_of = $output[0]["any_behalf_of"];
    $dis_year =  2019;
    $dis_month =  01;
    $dis_day =  1;

    $deli_year =  2019;
    $deli_month = 01;
    $deli_day =  1;


@endphp

@if(count($dispatch_details) >0)
    @php
        $dispatch_date = $dispatch_details[0]['dispatch_date'];
        $dis_date_arr = explode("-",$dispatch_date);
        $dis_year =  $dis_date_arr[0];
        $dis_month =  $dis_date_arr[1];
        $dis_day =  $dis_date_arr[2];

        $delivery_date = $dispatch_details[0]['delivery_date'];
        $deli_date_arr = explode("-",$delivery_date);
        $deli_year =  $deli_date_arr[0];
        $deli_month =  $deli_date_arr[1];
        $deli_day =  $deli_date_arr[2];
    @endphp   

@endif


   	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<span class="glyphicon glyphicon-map-marker"></span>
			<li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Dispatch Pending List</li>
		</ol>
	</nav>

	<div class="container box-shadow">
	 	
         <form method="post" action="/dispatch/add" enctype="multipart/form-data">
            {{ csrf_field() }}
            
            <input type="hidden" id="sampleId" name="sampleId" value="{{$output[0]['sample_id']}}">

             <div class="form-group row">
                 <div class="col-sm-12">
                    <div class="card card-class">
                    <div class="card-header card_header"> Dispatch Details </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col-md-4 card-block-header">Request By </div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["user_first_name"]}}  {{$output[0]["user_last_name"]}}</div>
                            </div>
                           
                            <div class="row">
                                <div class="col-md-4 card-block-header">Request Date (YYYY-MM-DD) </div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["request_date"]}}</div>
                            </div>

                          
                            @if($behalf_of)
                            <div class="row">
                                <div class="col-md-4 card-block-header">Behalf of</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["any_behalf_of"]}}</div>
                            </div>
                            @endif

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
                                            <th scope="col">Quantity</th>
                                            <th scope="col">UOM</th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-size: 14px">
                                        @for ($i = 0; $i < count($output); $i++)
                                        <tr>
                                            <td>{{$i+1}}</td>
                                            <td>{{$output[$i]['code']}}</td>
                                            <td>{{$output[$i]['name']}}</td>
                                            <td>{{$output[$i]['scrientific_name']}}</td>
                                            <td>{{$output[$i]['method_name']}}</td>
                                            <td>{{$output[$i]['qunatity']}}</td>
                                            <td>{{$output[$i]['uom_name']}}</td>
                                        </tr>
                                        @endfor    
                                    </tbody>
                                </table>
                            </div>   


                            <div class="row"> <div class="col-md-12 card-block-full">Shipping Details</div> </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Full Name</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["ref_name"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Address</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["ref_address"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Email</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["ref_email"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Mobile</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["ref_mobile"]}}</div>
                            </div>

                            <div class="row"> <div class="col-md-12 card-block-full"></div> </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Sample Number</div>
                                <div class="col-md-8 card-block-detail">{{$output[0]["sample_number"]}}</div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Service</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control" id="dispatchService" name="dispatchService">
                                            @if(count($dispatch_service_list) > 0)
                                            @for ($i = 0; $i < count($dispatch_service_list); $i++)
                                               <option value={{$dispatch_service_list[$i]["id"]}}>{{$dispatch_service_list[$i]["name"]}}</option>
                                            @endfor
                                            @else  
                                                <option></option>
                                            @endif 
                                        </select>
                                    </div> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Amount (Only ₹)</div>
                                <div class="col-md-8 card-block-detail">
                                     <input class="form-control" id="dispatch_amount" type="number" name="dispatch_amount" placeholder="dispatch amount" required="required" min="1" value="{{ isset($dispatch_details[0]['amount'] ) ? $dispatch_details[0]['amount']  : '' }}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Dispatch Date</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control date-class" id="dispatchdateDay" name="dispatchdateDay">
                                            @for ($i = 1; $i <= 31; $i++)
                                               <!--  <option value={{ $i}}>{{ $i}}</option> -->
                                                @if($i==$dis_day)
                                                    <option selected value={{ $i}}>{{ $i}}</option>
                                                @else  
                                                    <option value={{ $i}}>{{ $i}}</option>
                                                @endif 

                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="dispatchDateMonth" name="dispatchDateMonth">
                                            @if($dis_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                                            @if($dis_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                                            @if($dis_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                                            @if($dis_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                                            @if($dis_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                                            @if($dis_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                                            @if($dis_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                                            @if($dis_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                                            @if($dis_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                                            @if($dis_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                                            @if($dis_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                                            @if($dis_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                                        </select>
                                        <select class="form-control date-class" id="dispatchDateyear" name="dispatchDateyear">
                                            @for ($i = 2019; $i <= 2022; $i++)
                                               <!--  <option value={{ $i}}>{{ $i}}</option> -->

                                               @if($i==$dis_year)
                                                    <option selected value={{ $i}}>{{ $i}}</option>
                                                @else  
                                                    <option value={{ $i}}>{{ $i}}</option>
                                                @endif

                                            @endfor
                                        </select>
                                    </div> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Delivery Date (- / + 2 days is possible)</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control date-class" id="deliverydateDay" name="deliverydateDay">
                                            @for ($i = 1; $i <= 31; $i++)
                                               <!--  <option value={{ $i}}>{{ $i}}</option> -->

                                                @if($i==$deli_day)
                                                    <option selected value={{ $i}}>{{ $i}}</option>
                                                @else  
                                                    <option value={{ $i}}>{{ $i}}</option>
                                                @endif 

                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="deliveryDateMonth" name="deliveryDateMonth">
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
                                        <select class="form-control date-class" id="deliveryDateyear" name="deliveryDateyear">
                                            @for ($i = 2019; $i <= 2022; $i++)
                                                <!-- <option value={{ $i}}>{{ $i}}</option> -->
                                                @if($i==$deli_year)
                                                    <option selected value={{ $i}}>{{ $i}}</option>
                                                @else  
                                                    <option value={{ $i}}>{{ $i}}</option>
                                                @endif

                                            @endfor
                                        </select>
                                    </div> 
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-4 card-block-header">Dispatch Docx Number</label>
                                <div class="col-sm-8 card-block-detail">
                                    <input type="input" class="form-control" id="dispatch_docx_number" name="dispatch_docx_number" value="{{ isset($dispatch_details[0]['dispatch_docx_num'] ) ? $dispatch_details[0]['dispatch_docx_num']  : '' }}">
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-4 card-block-header">Docx receipt attachment (.pdf,.jpg,.jpeg,.png with max 2 MB size)</label>
                                <div class="col-sm-8 card-block-detail">
                                    <div class="custom-file">
                                        <input type="file" class="form-control-file" id="docx_receipt_attacment" name="docx_receipt_attacment">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Status</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control" id="dispatchStatus" name="dispatchStatus">
                                                <option value='DISPATCH'>Dispatch</option>
                                                <option value="DELIVERIED">Delivered</option>
                                        </select>
                                    </div> 
                                </div>
                            </div>

                            <div class="row"> <div class="col-md-12 card-block-full">Document inclued into Dispatch</div> </div>

                            <div class="form-group row" style="margin-top: 4%"> 
                                <div class="col-sm-12 col-form-label">

                                    <table class="table table-bordered" id="dispatchDocumentsList">
                                        <thead style="background-color: #f8f8f8;font-size: 14px;">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Document Name</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size: 14px;">
                                            @if(count($dispatch_details) > 0)
                                            
                                                @for ($i = 0; $i < count($dispatch_details); $i++)
                                                <tr>
                                                    <th style="vertical-align:middle">{{($i+1)}}</th>
                                                    <th colspan="2">{{$dispatch_details[$i]["attached_docx_name"]}}</th>
                                                 </tr>      
                                                @endfor 
                                             
                                            @else  
                                                <tr>
                                                    <th style="vertical-align:middle">1</th>
                                                    <th>
                                                        <input class="form-control" type="text" id="document_name" name="document_name[][document_name]" placeholder="document name (exp COA, Purchase Order etc)" required="required">
                                                    </th>
                                                    <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                                                </tr>    
                                            @endif  
                                        </tbody>
                                    </table>

                                    @if(count($dispatch_details)== 0)
                                        <div class="container">
                                            <button type="button" class="btn btn-default" onclick="addSampleNewRow()">Add New Row</button>
                                        </div>
                                    @endif
                                </div> 
                            </div>


                        </div>
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

	</div>
    
@stop

<script src="{{ asset('js/dispatch/dispatchService.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->