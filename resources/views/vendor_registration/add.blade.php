@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/userRegistration/vendor.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->
@php
$user_role_id = Session::get('role_id');
@endphp

 	<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Vendor /  Add</li>
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
    	@if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='7' || $user_role_id=='13' || $user_role_id=='14')
    	<form method="post" action="/dashboard/saveVendor">
           	{{ csrf_field() }}

	    <!-- name / address of the business section start -->
	    	<div class="form-group row">
	            <div class="col-sm-12">
	                <div class="card card-class">
	                	<div class="card-header card_header"> Name / Address of the Business </div>
	                    <div class="card-body">

	                        <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Name of Business</label>
				                <div class="col-sm-8">
				                    <input type="input" class="form-control" id="name_of_business" name="name_of_business" placeholder="comapny name" required="required"  value="{{ old('name_of_business') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Vendor Code</label>
				                <div class="col-sm-8">
				                    <input type="input" class="form-control" id="name_address_vendor_code" name="name_address_vendor_code" placeholder="vendor coode" required="required" value="{{ old('name_address_vendor_code') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Address</label>
				                <div class="col-sm-8">
				                    <!-- <input type="input" class="form-control" id="name_address_address" name="name_address_address" placeholder="address" required="required"> -->
				                    <textarea class="form-control" id="name_address_address" name="name_address_address" placeholder="address" required="required">{{ old('name_address_address') }}</textarea>
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Country</label>
					            
					            <div class="col-sm-8">
				                    <div class="day-month-yaer-class">
				                        <select class="form-control date-class" id="name_address_business_country_name" name="name_address_business_country_name">
				                           @for ($i = 0; $i < count($country); $i++)
				                                <option value={{ $country[$i]["id"]}}>{{ $country[$i]["name"]}}</option>
				                            @endfor
				                        </select>
				                        <select class="form-control date-class" id="name_address_business_state_name" name="name_address_business_state_name" onchange="onChangeState(this)">
				                            @for ($i=0; $i < count($state); $i++)
				                            	<option value={{ $state[$i]["id"]}}>{{ $state[$i]["name"]}}</option>
				                            @endfor
				                        </select>
				                        <select class="form-control date-class" id="name_address_business_city_name" name="name_address_business_city_name">
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
				                    <input type="number" class="form-control" id="name_address_pin" name="name_address_pin" placeholder="pin" required="required" value="{{ old('name_address_pin') }}" minlength="6" maxlength="6">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Phone / Mobile</label>
				                <div class="col-sm-8">
				                   	<div class="day-month-yaer-class">
				                   		<input type="number" class="form-control" id="name_address_mobile" name="name_address_mobile" placeholder="mobile" required="required" style="margin-right: 5%" value="{{ old('name_address_mobile') }}" minlength="10" maxlength="10">

				                      	<input type="email" class="form-control" id="name_address_email" name="name_address_email" placeholder="email" value="{{ old('name_address_email') }}">
				                    </div>
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">PAN No</label>
				                <div class="col-sm-8">
				                    <input type="input" class="form-control" id="name_address_pan_no" name="name_address_pan_no" placeholder="pan no" required="required" value="{{ old('name_address_pan_no') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">CIN No</label>
				                <div class="col-sm-8">
				                    <input type="input" class="form-control" id="name_address_cin_no" name="name_address_cin_no" placeholder="cin no" value="{{ old('name_address_cin_no') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">GSTN No</label>
				                <div class="col-sm-8">
				                    <input type="input" class="form-control" id="name_address_gstn_no" name="name_address_gstn_no" placeholder="gstn no" required="required" value="{{ old('name_address_gstn_no') }}">
				                </div>
				            </div>

	                    </div>  
	                </div>
	            </div>
	        </div>
	    <!-- name / address of the business section end -->          


	    <!-- Company Information section start -->
	        <div class="form-group row">
	            <div class="col-sm-12">
	                <div class="card card-class">
	                	<div class="card-header card_header"> Company Information</div>
	                    <div class="card-body">
	                       
                           	<div class="form-group row">
				                <label class="col-sm-4 col-form-label">Type of Business</label>
				                <div class="col-sm-8">
				                   	<select class="form-control" id="company_information_type_business" name="company_information_type_business[]" multiple>
			                            @for ($i = 0; $i < count($type_of_business); $i++)
			                                <option value={{ $type_of_business[$i]["Id"]}}>{{ $type_of_business[$i]["Type"]}}</option>
			                            @endfor
				                    </select>
				                </div>
				            </div>
	                        
	                        <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Primary Products</label>
				                <div class="col-sm-8">
				                   	<select class="form-control" id="company_information_primary_product" name="company_information_primary_product[]" multiple>
			                            @for ($i = 0; $i < count($product_category); $i++)
			                                <option value={{ $product_category[$i]["id"]}}>{{ $product_category[$i]["name"]}}</option>
			                            @endfor
				                    </select>
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Parent Company (If Any..)</label>
				                <div class="col-sm-8">
				                    <input type="text" class="form-control" id="company_information_parent_company" name="company_information_parent_company" placeholder="parent company (If Any..)" value="{{ old('company_information_parent_company') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">In Business Since</label>
				                <div class="col-sm-8">
				                    <input type="number" class="form-control" id="in_business_since" name="in_business_since" placeholder="business since" required="required" value="{{ old('in_business_since') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Primary Contacts</label>
				                <div class="col-sm-8">
				                   	<div class="day-month-yaer-class">
				                   		<input type="number" class="form-control" id="primary_conatct_mobile" name="primary_conatct_mobile" placeholder="primary mobile" required="required" style="margin-right: 5%" value="{{ old('primary_conatct_mobile') }}" minlength="10" maxlength="10">

				                      	<input type="email" class="form-control" id="primary_conatct_email" name="primary_conatct_email" placeholder="primary email" required="required" value="{{ old('primary_conatct_email') }}">
				                    </div>
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Business Activity</label>
				                <div class="col-sm-8">
				                   	<select class="form-control" id="company_information_business_activity" name="company_information_business_activity[]" multiple>
			                            @for ($i = 0; $i < count($busniess_activity); $i++)
			                                <option value={{ $busniess_activity[$i]["Id"]}}>{{ $busniess_activity[$i]["activity"]}}</option>
			                            @endfor
				                    </select>
				                </div>
				            </div>

	                    </div>  
	                </div>
	            </div>
	        </div> 
	    <!-- Company Information section end -->    


	    <!-- Contacts Information section start -->
	        <div class="form-group row">
	            <div class="col-sm-12">
	                <div class="card card-class">
	                	<div class="card-header card_header"> Contacts Information</div>
	                    <div class="card-body">

			                    <table class="table table-bordered" id="contactsInformationDetails">
			                        <thead style="background-color: #c4f6bb;font-size: 14px;">
			                            <tr>
			                                <th scope="col" style="vertical-align: middle;">#</th>
			                                <th scope="col" style="vertical-align: middle;">Contact Type</th>
			                                <th scope="col" style="vertical-align: middle;">First Name</th>
			                                <th scope="col" style="vertical-align: middle;">Last Name</th>
			                                <th scope="col" style="vertical-align: middle;">Email</th>
			                                <th scope="col" style="vertical-align: middle;">Phone / Mobile</th>
			                                <th scope="col" style="vertical-align: middle;">Action</th>
			                            </tr>
			                        </thead>
			                        <tbody style="font-size: 14px;">
			                            <tr>
			                                <th style="vertical-align:middle">1</th>

			                                <th>
			                                    <select name='contact_information_type[][contact_type]' class="form-control" id='contact_information_type' style="width: 250px">
				                                    @for ($i = 0; $i < count($userContactInformationMaster); $i++)
						                                <option value={{ $userContactInformationMaster[$i]["Id"]}}>{{ $userContactInformationMaster[$i]["type"]}}</option>
						                            @endfor
			                                    </select>

			                                </th>

			                                <th>
			                                    <input class="form-control" id="contact_information_first_name" type="text" name="contact_information_first_name[][contact_information_first_name]" placeholder="first_name" required="required">
			                                </th>

			                                <th>
			                                   <input class="form-control" id="contact_information_last_name" type="text" name="contact_information_last_name[][contact_information_last_name]" placeholder="last_name" required="required">
			                                </th>

			                                <th>
			                                    <input class="form-control" id="contact_information_email" type="email" name="contact_information_email[][contact_information_email]" placeholder="email" required="required">
			                                </th>

			                                 <th>
			                                   <input class="form-control" id="contact_information_mobile" type="number" name="contact_information_mobile[][contact_information_mobile]" placeholder="mobile" required="required" minlength="10" maxlength="10">
			                                </th>

			                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
			                            </tr>
			                        </tbody>
			                    </table>

			                    <div class="container">
			                        <button type="button" class="btn btn-default" onclick="addNewContactsInformation()">Add New Row</button>
			                    </div>
			                </div> 
			             
	                </div>
	            </div>
	        </div> 
	    <!-- Contacts Information section end -->    


	    <!-- Bank Refernces section start -->
			<div class="form-group row">
	            <div class="col-sm-12">
	                <div class="card card-class">
	                	<div class="card-header card_header"> Bank References</div>
	                    <div class="card-body">

	                        <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Bank Name</label>
				                <div class="col-sm-8">
				                    <input type="text" class="form-control" id="bank_reference_bank_name" name="bank_reference_bank_name" placeholder="bank name" value="{{ old('bank_reference_bank_name') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">IFSC Code</label>
				                <div class="col-sm-8">
				                    <input type="text" class="form-control" id="bank_reference_ifsc_Code" name="bank_reference_ifsc_Code" placeholder="IFSC Code" value="{{ old('bank_reference_ifsc_Code') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Branch</label>
				                <div class="col-sm-8">
				                    <input type="text" class="form-control" id="bank_reference_branch" name="bank_reference_branch" placeholder="branch" value="{{ old('bank_reference_branch') }}">
				                </div>
				            </div>

				            <div class="form-group row">
				                <label class="col-sm-4 col-form-label">Account Details</label>
				                <div class="col-sm-8">
				                    <input type="number" class="form-control" id="bank_reference_account_detail" name="bank_reference_account_detail" placeholder="account details" value="{{ old('bank_reference_account_detail') }}">
				                </div>
				            </div>

	                    </div>  
	                </div>
	            </div>
	        </div>
	    <!-- Bank Refernces section end -->    

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="{{ asset('js/userRegistration/vendor.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->