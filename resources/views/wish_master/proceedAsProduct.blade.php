@php
    use \App\Http\Controllers\Dashboard;
@endphp

@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" href="{{ asset('css/bom/init.css') }}"> -->


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  User Wish /  Proceed As Product</li>
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
        @if(Dashboard::isRouteExistForUser('/wish/proceedAs/product')=='YES')
        <form method="post" action="/wish/proceedAs/product" enctype="multipart/form-data"> 
                {{ csrf_field() }}

            <input type="hidden" name="wishID" value="{{ $output[0]['id'] }}">
            
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Code</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="product_code" name="product_code" placeholder="product code" required="required" value="{{ old('product_code')}}">
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
                     <input type="input" class="form-control" id="product_botanical_name" name="product_botanical_name" placeholder="botanical name" required="required" value="{{ old('product_botanical_name')}}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Specification</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="product_specification" name="product_specification" placeholder="specification" value="{{ isset($output[0]['description']) ? $output[0]['description'] : ''}}">
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
                            <option  value={{ $activeCategoryList[$i]["id"]}}> {{$activeCategoryList[$i]["name"]}}</option>
                        @endfor
                    </select>        
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Ratio Based</label>
                <div class="col-sm-8">
                    <select class="form-control" id="product_ratio_based" name="product_ratio_based">
                        <option  value='Y'>YES</option>
                        <option  value='N'>No</option>
                        
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
                    <input type="number" class="form-control" id="product_min_price" name="product_min_price" placeholder="min price" value="{{ old('product_min_price')}}" style="margin-right: 10%">

                    <input type="number" class="form-control" id="product_max_price" name="product_max_price" placeholder="max price"  value="{{ old('product_max_price')}}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Price Valid Date</label>
                <div class="col-sm-8">
                    <div class="day-month-yaer-class">
                        <select class="form-control date-class" id="priceValidDay" name="priceValidDay">
                            @for ($i = 1; $i <= 31; $i++)
                                <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                        <select class="form-control date-class" id="priceValidMonth" name="priceValidMonth">
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
                        <select class="form-control date-class" id="priceValidyear" name="priceValidyear">
                            @for ($i = 2019; $i <= 2022; $i++)
                               <option  value={{ $i}}>{{ $i}}</option>
                            @endfor
                        </select>
                    </div> 
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">HSN Code</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="hsn_code" name="hsn_code" placeholder="hsn code" required='required' value="{{ old('hsn_code')}}">
                </div>
            </div>
           
 
           <div class="form-group row">
                <label class="col-sm-4 col-form-label">Image (.jpg,.jpeg,.png with max 2 MB size)</label>
                <div class="col-sm-8">
                    <div class="custom-file">
                        <input type="file" class="form-control-file" id="product_image" name="product_image">
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
        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/product/wish_master.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
