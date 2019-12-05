@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/inquiry/init.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $cart_id = Session::get('cart_id');
@endphp

    <!-- <input type="hidden" id="cartid" name="cartid" value={{$cart_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> / Cart Product List</li>
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
        @if($user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7')
        <form method="post" action="/inquiry/save">
            {{ csrf_field() }}
        
        <div class="form-group row">
            <table class="table table-bordered" id="cartProductList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col" style="width: 11%">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">Biological Name</th>
                        <th scope="col">Specification</th>
                        <th scope="col" style="width: 8%">Quantity</th>
                        <th scope="col" style="width: 12%">UOM</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>
                                    <input type="text" class="form-control" readonly name="inquiry_code[][code]" value="{{$output[$i]['code']}}">
                                    <input type="hidden" class="form-control" readonly name="inquiry_product_id[][product_id]" value="{{$output[$i]['id']}}">
                                </td>
                                <td><input type="text" class="form-control" readonly name="inquiry_name[][name]" value="{{$output[$i]['name']}}"></td>
                                <td><input type="text" class="form-control" readonly name="inquiry_sci_name[][sci_name]" value="{{$output[$i]['scrientific_name']}}"></td>
                                <td><input type="text" class="form-control" readonly name="inquiry_specification[][specification]" value="{{$output[$i]['specification']}}"></td>
                                <td>
                                    <input class="form-control qty" id="qty" type="number" name="inquiry_qty[][qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['quantity']}}">
                                </td>
                                <td>
                                    <select id="uom" class="form-control" name="inquiry_uom[][uom]">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($output[$i]['quantity_unit']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </td> 
                                <td><a href="/inquiry/{{$output[$i]['product_id']}}/inactiveProductInCart"><span class="glyphicon glyphicon-remove"></span></a></td>
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Product found</td>
                        </tr>
                    @endif    
                </tbody>
            </table>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Customer Name</label>
            <div class="col-sm-8">
                <select id="uom" class="form-control" name="customerName" style="text-transform: uppercase">
                    @for ($ix = 0; $ix < count($customerList); $ix++) 
                        <option value="{{ $customerList[$ix]['id']}}">{{ $customerList[$ix]['company_name']}}</option>
                    @endfor
                </select>
                <a href="/dashboard/addCustomer" style="float: right;margin-top: 2%" class="btn btn-default">Add Customer</a>
            </div>
        </div>

        <div class="form-group row">
             <label class="col-sm-12 col-form-label">Billing Address</label>
        </div>

         <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country</label>
            
            <div class="col-sm-8">
                <div class="day-month-yaer-class">
                    <select class="form-control date-class" id="billing_address_country_name" name="billing_address_country_name" onchange="onChangeCountry(this)">
                       @for ($i = 0; $i < count($country); $i++)
                            <option value={{ $country[$i]["id"]}}>{{ $country[$i]["name"]}}</option>
                        @endfor
                    </select>
                    <select class="form-control date-class" id="billing_address_state_name" name="billing_address_state_name" onchange="onChangeState(this)">
                        @for ($i=0; $i < count($state); $i++)
                            <option value={{ $state[$i]["id"]}}>{{ $state[$i]["name"]}}</option>
                        @endfor
                    </select>
                    <select class="form-control date-class" id="billing_address_city_name" name="billing_address_city_name">
                        @for ($i = 0; $i < count($city); $i++)
                            <option value={{ $city[$i]["id"]}}>{{ $city[$i]["name"]}}</option>
                        @endfor
                    </select>
                </div> 
            </div>
        </div>

        
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">PIN</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" id="billing_pin" name="billing_pin" placeholder="pin" required="required" value="{{ old('billing_pin') }}" minlength="6" maxlength="6">
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address</label>
            <div class="col-sm-8">
               <textarea class="form-control" id="billing_address" name="billing_address" placeholder="address" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="100"></textarea>
               <span id="billing_address_span">Only 100 characters are allowed</span>
            </div>
        </div>



        <div class="form-group row">
             <label class="col-sm-12 col-form-label">Shipping Address</label>
        </div>

        <div class="form-group row">
            <div class="col-sm-12" style="color: #3f9d23;font-size: 15px;font-weight: 600;">
                Is Billing Address Same as Shipping Address : 
                    <input type="checkbox" id="myCheck" onclick="sameAsBillingAddress()" style="width: 30px;height: 20px;">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country</label>
            
            <div class="col-sm-8">
                <div class="day-month-yaer-class">
                    <select class="form-control date-class" id="shipping_address_country_name" name="shipping_address_country_name" onchange="onChangeShippingCountry(this)">
                       @for ($i = 0; $i < count($country); $i++)
                            <option value={{ $country[$i]["id"]}}>{{ $country[$i]["name"]}}</option>
                        @endfor
                    </select>
                    <select class="form-control date-class" id="shipping_address_state_name" name="shipping_address_state_name" onchange="onChangeShippingState(this)">
                        @for ($i=0; $i < count($state); $i++)
                            <option value={{ $state[$i]["id"]}}>{{ $state[$i]["name"]}}</option>
                        @endfor
                    </select>
                    <select class="form-control date-class" id="shipping_address_city_name" name="shipping_address_city_name">
                        @for ($i = 0; $i < count($city); $i++)
                            <option value={{ $city[$i]["id"]}}>{{ $city[$i]["name"]}}</option>
                        @endfor
                    </select>
                </div> 
            </div>
        </div>

        
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">PIN</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" id="shipping_pin" name="shipping_pin" placeholder="pin" required="required" value="{{ old('shipping_pin') }}" minlength="6" maxlength="6">
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address</label>
            <div class="col-sm-8">
               <textarea class="form-control" id="shipping_address" name="shipping_address" placeholder="address" required="required" onkeyup="onkeyupShippingRemarks()" onblur="validateShippingAddress()" maxlength="100"></textarea>
               <span id="shipping_address_span">Only 100 characters are allowed</span>
            </div>
        </div>

        @if(count($output) > 0)
        <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Add AS Inquiry</button>
                </div>
        </div> 
        @endif

        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/inquiry/proceedCart.js') }}"></script>
