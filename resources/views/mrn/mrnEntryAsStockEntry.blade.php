@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/stock/stock.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Stock /  Add </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='3' || $user_role_id=='7'|| $user_role_id=='8' || $user_role_id=='10')
        <form method="post" action="/stock/save">
            {{ csrf_field() }}
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Date</label>
                <div class="col-md-8 card-block-detail">
                     <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="stockEntrydateDay" name="stockEntrydateDay">
                            @for ($i = 1; $i <= 31; $i++)  <option value={{ $i}}>{{ $i}}</option> @endfor
                        </select>
                        <select class="form-control date-class" id="stockEntryDateMonth" name="stockEntryDateMonth">
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
                        <select class="form-control date-class" id="stockEntryDateyear" name="stockEntryDateyear">
                            @for ($i = 2019; $i <= 2022; $i++) <option value={{ $i}}>{{ $i}}</option> @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <input type="hidden" id="stockEntryMRNID" value={{$mrnDetails[0]['id']}}>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry Type</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryType" name="stockEntryType" onchange="onChangeEntryTypeDetails(this)">
                            @for ($i = 0; $i < count($getStockEntryTypeMaster); $i++)  <option value={{ $getStockEntryTypeMaster[$i]["id"]}}>{{ $getStockEntryTypeMaster[$i]["name"]}}</option> @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry Type Details</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryTypeDetails" name="stockEntryTypeDetails">
                            @for ($i = 0; $i < count($getStockEntryTypeMasterDetails); $i++)  <option value={{ $getStockEntryTypeMasterDetails[$i]['id']}}>{{ $getStockEntryTypeMasterDetails[$i]["name"]}}</option> @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Description</label>
                <div class="col-sm-8">
                    <textarea class="form-control" id="stock_entry_description" name="stock_entry_description" placeholder="description" required="required" onblur="validateAddress()"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Warehouse</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryWarehouseId" name="stockEntryWarehouseId">
                            @for ($i = 0; $i < count($getWarehouseList); $i++)  <option value={{ $getWarehouseList[$i]["id"]}}>{{ $getWarehouseList[$i]["name"]}}</option> @endfor
                        </select>
                    </div> 
                </div>
            </div>
            

            <div class="form-group row" style="margin-top: 4%"> <label class="col-sm-12 col-form-label">Items Details</label> </div>

           
            <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="stockItemsDetails">
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
                            @for ($i = 0; $i < count($mrnDetails); $i++)

                            <tr>
                                <th style="vertical-align:middle">{{$i+1}}</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 250px">
                                        <@for ($ix = 0; $ix < count($product); $ix++) 
                                            @if($mrnDetails[$i]['item_code']==$product[$ix]['id'])
                                                 <option  selected value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $product[$ix]['id']}}">{{ $product[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>

                                </th>

                                <th>
                                    <select name="product_method[][method]" class="form-control" id='method' style="width: 150px">
                                       @for ($ix = 0; $ix < count($method); $ix++) 
                                            @if($mrnDetails[$i]['method']==$method[$ix]['id'])
                                                 <option  selected value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0" value="{{$mrnDetails[$i]['item_qty']}}">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
                                       @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($mrnDetails[$i]['item_uom']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </th>

                                 <th>
                                    <input class="form-control qty" id="product_sample_qty" type="number" name="product_sample_qty[][product_sample_qty]" placeholder="sample qty" required="required" min="0" value="{{ $mrnDetails[$i]['control_qty']}}">
                                </th>

                                <th>
                                    <select id="product_sample_uom" class="form-control" name="product_sample_uom[][product_sample_uom]">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($mrnDetails[$i]['control_uom']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </th>

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
                             @endfor
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/stock/stock.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->