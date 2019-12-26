@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/stock/stock.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $entry_date = $getStockInfoByStockId[0]['entry_date'];
    $entry_date_arr = explode("-",$entry_date);
    $entry_year =  $entry_date_arr[0];
    $entry_month =  $entry_date_arr[1];
    $entry_day =  $entry_date_arr[2];
@endphp

   

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Stock /  Edit </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='3' || $user_role_id=='11' || $user_role_id=='7')
        <form method="post" action="/stock/update">
            {{ csrf_field() }}

            <input type="hidden" id="stock_entry_id" name="stock_entry_id" value="{{ $getStockInfoByStockId[0]['stock_entry_id']}}">
            
             <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry For</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryFor" name="stockEntryFor">
                            @for ($i = 0; $i < count($getStockEntryFor); $i++)
                                @if($getStockInfoByStockId[0]['stock_entry_for']== $getStockEntryFor[$i]["id"])
                                    <option selected value={{ $getStockEntryFor[$i]["id"]}}>{{ $getStockEntryFor[$i]["stock_entry_for"]}}</option> 
                                @else
                                    <option value={{ $getStockEntryFor[$i]["id"]}}>{{ $getStockEntryFor[$i]["stock_entry_for"]}}</option> 
                                @endif
                               <!--  <option value={{ $getStockEntryFor[$i]["id"]}}>{{ $getStockEntryFor[$i]["stock_entry_for"]}}</option>  -->
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Date</label>
                <div class="col-md-8 card-block-detail">
                     <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="stockEntrydateDay" name="stockEntrydateDay">
                            @for ($i = 1; $i <= 31; $i++)  
                                @if($i==$entry_day)
                                    <option selected value={{ $i}}>{{ $i}}</option>
                                @else  
                                    <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="stockEntryDateMonth" name="stockEntryDateMonth">
                            @if($entry_month=="01") <option selected value="01">Jan</option> @else <option value="01">Jan</option>@endif 
                            @if($entry_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($entry_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($entry_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($entry_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($entry_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($entry_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($entry_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($entry_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($entry_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($entry_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($entry_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="stockEntryDateyear" name="stockEntryDateyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                                @if($i==$entry_year)
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
                <label class="col-sm-4 col-form-label">Entry Behalf Of</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryBehalfOf" name="stockEntryBehalfOf">
                            @for ($i = 0; $i < count($getStockEntryBehalfOf); $i++)  
                                
                                @if($getStockInfoByStockId[0]['object_type']== $getStockEntryBehalfOf[$i]["id"])
                                   <option selected value={{ $getStockEntryBehalfOf[$i]["id"]}}>{{ $getStockEntryBehalfOf[$i]["name"]}}</option>
                                @else
                                    <option value={{ $getStockEntryBehalfOf[$i]["id"]}}>{{ $getStockEntryBehalfOf[$i]["name"]}}</option>
                                @endif
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry Behalf Of ID</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <input type="text" class="form-control" id="entryBehalfOfID" name="entryBehalfOfID" placeholder="entry behalf of ID" required="required" onblur="validateObjectID(this)" value="{{$getStockInfoByStockId[0]['object_id']}}">
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry Type</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryType" name="stockEntryType" onchange="onChangeEntryTypeDetails(this)">
                            @for ($i = 0; $i < count($getStockEntryTypeMaster); $i++)  
                                @if($getStockInfoByStockId[0]['entry_type_id']== $getStockEntryTypeMaster[$i]["id"])
                                    <option selected value={{ $getStockEntryTypeMaster[$i]["id"]}}>{{ $getStockEntryTypeMaster[$i]["name"]}}</option> 
                                @else
                                    <option value={{ $getStockEntryTypeMaster[$i]["id"]}}>{{ $getStockEntryTypeMaster[$i]["name"]}}</option> 
                                @endif
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <input type="hidden" id="stockEntryTypeDetailsHidden" value={{$getStockInfoByStockId[0]['entry_type_details_id']}}>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Entry Type Details</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryTypeDetails" name="stockEntryTypeDetails">
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Description</label>
                <div class="col-sm-8">
                    <textarea class="form-control" id="stock_entry_description" name="stock_entry_description" placeholder="description" required="required">{{$getStockInfoByStockId[0]['entry_description']}}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Warehouse</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control" id="stockEntryWarehouseId" name="stockEntryWarehouseId">
                            @for ($i = 0; $i < count($getWarehouseList); $i++)  
                                 @if($getStockInfoByStockId[0]['warehouse_id']== $getWarehouseList[$i]["id"])
                                    <option selected value={{ $getWarehouseList[$i]["id"]}}>{{ $getWarehouseList[$i]["name"]}}</option> 
                                @else
                                   <option value={{ $getWarehouseList[$i]["id"]}}>{{ $getWarehouseList[$i]["name"]}}</option> 
                                @endif
                                
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Vendor Code</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="vendor_code" name="vendor_code" placeholder="vendor code" required="required" value="{{$getStockInfoByStockId[0]['vendor_code']}}">
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
                                <th scope="col" style="vertical-align: middle;">Control Sample</th>
                                <th scope="col" style="vertical-align: middle;">Control Sample Qty</th>
                                <th scope="col" style="vertical-align: middle;">Control Sample UOM</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            @for ($i = 0; $i < count($getStockInfoByStockId); $i++) 
                            <tr>
                                <th style="vertical-align:middle">{{$i+1}}</th>
                               
                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 300px;">
                                        @for ($ix = 0; $ix < count($product); $ix++) 
                                            @if($getStockInfoByStockId[$i]['item_code']==$product[$ix]['id'])
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
                                            @if($getStockInfoByStockId[$i]['method']==$method[$ix]['id'])
                                                 <option  selected value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>
                                </th>

                                <th> 
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" min="0" value="{{$getStockInfoByStockId[$i]['item_qty']}}" style="width: 80px;">
                                </th>

                                <th>
                                    <select id="uom" class="form-control" name="product_uom[][uom]">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($getStockInfoByStockId[$i]['item_uom']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </th>

                                <th>
                                    <select id="product_is_sample_uom" class="form-control" name="product_is_sample_uom[][product_is_sample_uom]">
                                        <option value="Y">YES</option>
                                        <option value="N">NO</option>
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="product_sample_qty" type="number" name="product_sample_qty[][product_sample_qty]" placeholder="sample qty" min="0" value="{{ $getStockInfoByStockId[$i]['control_qty']}}" style="width: 80px;">
                                </th>

                                <th>
                                    <select id="product_sample_uom" class="form-control" name="product_sample_uom[][product_sample_uom]">
                                        @for ($ix = 0; $ix < count($uom); $ix++) 
                                            @if($getStockInfoByStockId[$i]['control_uom']==$uom[$ix]['id'])
                                                <option selected value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @else
                                                <option value="{{ $uom[$ix]['id']}}">{{ $uom[$ix]['name']}}</option>
                                            @endif
                                        @endfor
                                    </select>
                                </th>

                            </tr>
                            @endfor
                            
                        </tbody>
                    </table>

                   <!--  <div class="container">
                        <button type="button" class="btn btn-default" onclick="addSampleNewRow()">Add New Row</button>
                    </div> -->
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
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/stock/stock-edit.js') }}"></script>
<script src="{{ asset('js/stock/function.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->