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
$behalf_of = $output[0]["any_behalf_of"];
@endphp

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Customer Sample Ready for Dispatch</li>
        </ol>
    </nav>


    <div class="container box-shadow">
         @if($user_role_id=='3' || $user_role_id=='8')
        <form method="post" action="/production/bmr">
            {{ csrf_field() }}
            <div class="form-group row">
                <div class="col-sm-12">
                    <a href="/dashboard/addNewSample" style="float: right" class="btn btn-default">Add New Inquiry</a>
                </div>
            </div>

            <div class="form-group row">
                <div class="card card-class">
                <div class="card-header card_header"> Sample Details </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-4 card-block-header">Request By </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["user_first_name"]}}  {{$output[0]["user_last_name"]}}</div>
                        </div>
                       
                        <div class="row">
                            <div class="col-md-4 card-block-header">Request Date (YYYY-MM-DD) </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["request_date"]}}</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 card-block-header">Delivery Date (YYYY-MM-DD) </div>
                            <div class="col-md-8 card-block-detail">{{$output[0]["delivered_date"]}}</div>
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

                        <div class="row">
                            <div class="col-md-12 card-block-full">Customer Details</div>
                        </div>

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

                    </div>
                </div>

            </div>

            <input type="hidden" id="sampleId" name="sampleId" value="{{$output[0]['sample_id']}}">

            <div class="row">
                <div class="col-md-12 card-block-full">Store Information</div>
            </div>

            <div class="row">
                <div class="col-md-4 card-block-header">BMR Number</div>
                <div class="col-md-8 card-block-detail">
                      <input type="input" class="form-control" id="bmr_number" name="bmr_number" placeholder="BMR Number" required="required">
                </div>
            </div>

             <div class="row">
                <div class="col-md-4 card-block-header">Remarks</div>
                <div class="col-md-8 card-block-detail">
                    <textarea class="form-control" rows="3" id="store_remarks" name="store_remarks" onblur="validateAddress()" required="required"></textarea>
                </div>
            </div>

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit BMR</button>
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
<script src="{{ asset('js/custom/ready_for_dispatch.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
