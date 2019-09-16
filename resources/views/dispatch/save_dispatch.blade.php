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
@endphp

   	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<span class="glyphicon glyphicon-map-marker"></span>
			<li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Dispatch Pending List</li>
		</ol>
	</nav>

	<div class="container box-shadow">
	 	
         <form method="post" action="#">
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
                                     <input class="form-control" id="dispatch_amount" type="number" name="dispatch_amount" placeholder="dispatch amount" required="required" min="1">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">Dispatch Date</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control date-class" id="dispatchdateDay" name="dispatchdateDay">
                                            @for ($i = 1; $i <= 31; $i++)
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="dispatchDateMonth" name="dispatchDateMonth">
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
                                        <select class="form-control date-class" id="dispatchDateyear" name="dispatchDateyear">
                                            @for ($i = 2019; $i <= 2022; $i++)
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endfor
                                        </select>
                                    </div> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 card-block-header">elivery Date (- / + 2 days is possible)</div>
                                <div class="col-md-8 card-block-detail">
                                     <div class="day-month-yaer-class">
                                        <select class="form-control date-class" id="deliverydateDay" name="deliverydateDay">
                                            @for ($i = 1; $i <= 31; $i++)
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endfor
                                        </select>
                                        <select class="form-control date-class" id="deliveryDateMonth" name="deliveryDateMonth">
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
                                        <select class="form-control date-class" id="deliveryDateyear" name="deliveryDateyear">
                                            @for ($i = 2019; $i <= 2022; $i++)
                                                <option value={{ $i}}>{{ $i}}</option>
                                            @endfor
                                        </select>
                                    </div> 
                                </div>
                            </div>

                             <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Dispatch Docx Number</label>
                                <div class="col-sm-8">
                                    <input type="input" class="form-control" id="behalf_of" name="behalf_of" value={{$output[0]["any_behalf_of"]}}>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- <div class="form-group row">
                <div class="card card-class">
                    <div class="card-header card_header"> Sample Details </div>
                    <div class="card-body"></div>
                </div>

            </div> -->

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Proceed for Dispatch</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                </div>
            </div>    
            
        </form> 

	</div>
    
@stop

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->