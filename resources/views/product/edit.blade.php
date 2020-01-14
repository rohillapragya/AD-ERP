@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css//mrn/init.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $valid_till = $output[0]['valid_till'];
    $valid_till_date_arr = explode("/",$valid_till);
    $valid_year =  $valid_till_date_arr[0];
    $valid_month =  $valid_till_date_arr[1];
    $valid_day =  $valid_till_date_arr[2];

@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /   Product /  Edit </li>
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
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='14')
        <form method="post" action="/product/editProduct" enctype="multipart/form-data"> 
            {{ csrf_field() }}

            <input type="hidden" name="productID" value="{{ $output[0]['id'] }}">

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Code</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="product_code" name="product_code" placeholder="product code" required="required" value="{{ isset($output[0]['code']) ? $output[0]['code'] : '' }}" readonly="readonly">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Name</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="product_name" name="product_name" placeholder="product name" required="required" value="{{ isset($output[0]['name']) ? $output[0]['name'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Botanical Name</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="product_botanical_name" name="product_botanical_name" placeholder="botanical name" required="required" value="{{ isset($output[0]['scrientific_name']) ? $output[0]['scrientific_name'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Specification</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="product_specification" name="product_specification" placeholder="specification" value="{{ isset($output[0]['specification']) ? $output[0]['specification'] : '' }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Application</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="product_application" name="product_application" placeholder="application" value="{{ isset($output[0]['application']) ? $output[0]['application'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Category</label>
                <div class="col-sm-8">
                    <select class="form-control" id="product_category" name="product_category">
                        @for ($i=0;$i < count($activeCategoryList);$i++)
                            @if($output[0]['category']==$activeCategoryList[$i]['id'])
                                <option  selected value="{{ $activeCategoryList[$i]['id']}}">{{ $activeCategoryList[$i]['name']}}</option>
                            @else
                                <option value="{{ $activeCategoryList[$i]['id']}}">{{ $activeCategoryList[$i]['name']}}</option>
                            @endif
                        @endfor
                    </select>        
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Ratio Based</label>
                <div class="col-sm-8">
                    <select class="form-control" id="product_ratio_based" name="product_ratio_based">
                        @if($output[0]['ratio_based']=='Y')
                            <option  selected value='Y'>YES</option>
                            <option  value='N'>No</option>
                        @else
                            <option value='Y'>YES</option>
                            <option selected value='N'>No</option>  
                        @endif 
                    </select>        
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Method</label>
                <div class="col-sm-8">
                    <select class="form-control" id="product_method" name="product_method">
                        @for ($i=0;$i < count($activeMethodList);$i++)
                            @if($output[0]['method']==$activeMethodList[$i]['id'])
                                <option  selected value="{{ $activeMethodList[$i]['id']}}">{{ $activeMethodList[$i]['name']}}</option>
                            @else
                                <option value="{{ $activeMethodList[$i]['id']}}">{{ $activeMethodList[$i]['name']}}</option>
                            @endif
                        @endfor
                    </select>        
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Price</label>
                <div class="col-sm-8" style="display: flex">
                    <input type="number" class="form-control" id="product_min_price" name="product_min_price" placeholder="min price" value="{{ isset($output[0]['min_price']) ? $output[0]['min_price'] : '' }}" style="margin-right: 10%" >

                    <input type="number" class="form-control" id="product_max_price" name="product_max_price" placeholder="max price" value="{{ isset($output[0]['max_price']) ? $output[0]['max_price'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Price Valid Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="priceValidDay" name="priceValidDay">
                            @for ($i = 1; $i <= 31; $i++)
                                @if($i==$valid_day)
                                    <option selected value={{ $i}}>{{ $i}}</option>
                                @else  
                                    <option value={{ $i}}>{{ $i}}</option>
                                @endif 
                            @endfor
                        </select>
                        <select class="form-control date-class" id="priceValidMonth" name="priceValidMonth">
                            @if($valid_month=="01") <option selected value="01">Jan</option>@else  <option value="01">Jan</option>@endif 
                            @if($valid_month=="02") <option selected value="02">Feb</option> @else <option value="02">Feb</option>@endif
                            @if($valid_month=="03") <option selected value="03">Mar</option> @else <option value="03">Mar</option>@endif
                            @if($valid_month=="04") <option selected value="04">Apr</option> @else <option value="04">Apr</option>@endif
                            @if($valid_month=="05") <option selected value="05">May</option> @else <option value="05">May</option>@endif
                            @if($valid_month=="06") <option selected value="06">Jun</option> @else <option value="06">Jun</option>@endif
                            @if($valid_month=="07") <option selected value="07">Jul</option> @else <option value="07">Jul</option>@endif
                            @if($valid_month=="08") <option selected value="08">Aug</option> @else <option value="08">Aug</option>@endif
                            @if($valid_month=="09") <option selected value="09">Sep</option> @else <option value="09">Sep</option>@endif
                            @if($valid_month=="10") <option selected value="10">Oct</option> @else <option value="10">Oct</option>@endif
                            @if($valid_month=="11") <option selected value="11">Nov</option> @else <option value="11">Nov</option>@endif
                            @if($valid_month=="12") <option selected value="12">Dec</option> @else <option value="12">Dec</option>@endif
                        </select>
                        <select class="form-control date-class" id="priceValidyear" name="priceValidyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                                @if($i==$valid_year)
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
                <label class="col-sm-4 col-form-label">HSN Code</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="hsn_code" name="hsn_code" placeholder="hsn code" required='required' value="{{ isset($output[0]['hsn_code']) ? $output[0]['hsn_code'] : '' }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Min Quantity</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="min_quantity" name="min_quantity" placeholder="min quantity" value="{{ isset($output[0]['min_qty']) ? $output[0]['min_qty'] : '' }}">
                </div>
            </div>
           
 
           <div class="form-group row">
                <label class="col-sm-4 col-form-label">Image (.jpg,.jpeg,.png with max 2 MB size)</label>
                <div class="col-sm-8">
                    <div class="custom-file" style="display: flex;">
                        <input type="file" class="form-control-file" id="product_image" name="product_image">

                        @if($output[0]['image'])
                            <div style="width: 200px;border: 2px solid black;height: 130px;">
                                <img src="{{ asset('product_image/'.$output[0]['image']) }}" style="object-fit: fill;width: 100%;height: 100%;">
                                <div> {{$output[0]['image']}}</div>
                                <span class="glyphicon glyphicon-remove-circle" style="margin: -100% 0% 0% -22%;font-size: 25px;cursor: pointer;" onclick="onclickRemoveProductImage('{{$output[0]['id']}}','{{ $output[0]['image'] }}')"></span>
                            </div>
                        @endif
                        <!-- <img src="{{ asset('product_image/'.$output[0]['image']) }}" > -->
                    </div>
                </div>
            </div>


            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                    <!-- <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button> -->
                </div>
            </div>    
        </form>
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop

<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/product/product.js') }}"></script>



<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->