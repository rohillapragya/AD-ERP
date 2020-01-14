@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/warehouse/warehouse.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Warehouse /  Add </li>
    </ol>
    </nav>

    <div class="container box-shadow">
         @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='11')
        <form method="post" action="/warehouse/save">
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Warehouse Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="warehouse_name" name="warehouse_name" placeholder="Full Name" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Address</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3" id="warehouse_address" name="warehouse_address" onblur="validateAddress()" required="required"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">City</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">

                        <select class="form-control date-class" id="warehouseCountry" name="warehouseCountry">
                            <option  value='101'>India</option>
                        </select>

                        <select class="form-control date-class" id="warehouseState" name="warehouseState" onchange="onChangeState(this)">
                          @for ($i=0;$i < count($state);$i++)
                                <option  value={{ $state[$i]["id"]}}> {{$state[$i]["name"]}}</option>
                          @endfor
                        </select>

                        <select class="form-control date-class" id="warehouseCity" name="warehouseCity">
                          
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row" style="margin-top: 4%"> <label class="col-sm-12 col-form-label">Primary Contacts Details</label> </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">First Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="primary_contact_first_name" name="primary_contact_first_name" placeholder="first name">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Last Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="primary_contact_last_name" name="primary_contact_last_name" placeholder="last name">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Mobile</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="primary_contact_mobile" name="primary_contact_mobile" placeholder="mobile">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Phone</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="primary_contact_phone" name="primary_contact_phone" placeholder="phone">
                </div>
            </div>

             <div class="form-group row">
                <label class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" id="primary_contact_email" name="primary_contact_email" placeholder="email">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/warehouse/warehouse.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->