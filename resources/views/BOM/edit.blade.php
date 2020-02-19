@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/bom/init.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Bill of Material (BOM)  /  Edit </li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/bom/update')=='YES')
        
        <form method="post" action="/bom/update">
            {{ csrf_field() }}

            <input type="hidden" id="bomId" name="bomId" value="{{$output[0]['BOM_id']}}">
            
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">BOM Key Person </label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bom_key_person" name="bom_key_person" placeholder="bom key person" required="required" value="{{$output[0]['BOM_key_person']}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">BOM Name </label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="bom_name" name="bom_name" placeholder="bom name" required="required" value="{{$output[0]['bom_name']}}">
                </div>
            </div>



            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Remark</label>
                <div class="col-sm-8">
                   <textarea class="form-control" id="bom_remark" name="bom_remark" placeholder="remark" required="required" onkeyup="onkeyupRemarks()" onblur="validateAddress()" maxlength="200">{{$output[0]['remarks']}}</textarea>
                   <span id="bom_remark_span">Only 200 characters are allowed</span>
                </div>
            </div>

            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                    <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                </div>
            </div>  


            <div class="form-group row" style="margin-top: 4%"> 
                <div class="col-sm-12 col-form-label">

                    <table class="table table-bordered" id="bomItemsDetails">
                        <thead style="background-color: #5fff43;font-size: 14px;">
                            <tr>
                                <th scope="col" style="vertical-align: middle;">#</th>
                                <th scope="col" style="vertical-align: middle;">Name</th>
                                <th scope="col" style="vertical-align: middle;">Method</th>
                                <th scope="col" style="vertical-align: middle;">Qty</th>
                                <th scope="col" style="vertical-align: middle;">UOM</th>
                                <th scope="col" style="vertical-align: middle;">Action</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px;">
                            @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <th style="vertical-align:middle">{{$i+1}}</th>

                                <th>
                                    <select name='product_name[][product_code]' class="form-control" id='product_name' style="width: 250px">
                                        <@for ($ix = 0; $ix < count($product); $ix++) 
                                            @if($output[$i]['item_code']==$product[$ix]['id'])
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
                                            @if($output[$i]['method']==$method[$ix]['id'])
                                                 <option  selected value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @else
                                                 <option value="{{ $method[$ix]['id']}}">{{ $method[$ix]['name']}}</option>
                                            @endif
                                           
                                        @endfor
                                    </select>
                                </th>

                                <th>
                                    <input class="form-control qty" id="qty" type="number" name="product_qty[][qty]" placeholder="qty" required="required" min="0" value="{{$output[$i]['qty']}}">
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

                                <th><span class="glyphicon glyphicon-remove" style="display:none"></span></th>
                            </tr>
                            @endfor
                        </tbody>
                    </table>

                    <div class="container">
                        <button type="button" class="btn btn-default" onclick="addSampleNewRow()">Add New Row</button>
                    </div>

                    
                    <div class="form-group row" style="margin-top: 5%"> 
                        <div class="col-sm-4"></div>
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                            <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                        <div>
                    </div> 
                </div> 
            </div>  
        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/bom/init-edit.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->