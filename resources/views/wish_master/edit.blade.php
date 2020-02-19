@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')

<!-- <link rel="stylesheet" href="{{ asset('css//mrn/init.css') }}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css"> -->


@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');
    $is_admin_access_for_active_location = Session::get('is_admin_access_for_active_location');
@endphp

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  User Wish /  Edit</li>
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
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/wish/edit')=='YES') 
        <form method="post" action="/wish/edit" enctype="multipart/form-data"> 
            {{ csrf_field() }}

            <input type="hidden" name="wishID" value="{{ $output[0]['id'] }}">

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Name</label>
                <div class="col-sm-8">
                    <input type="input" class="form-control" id="wish_name" name="wish_name" placeholder="wish name" required="required" value="{{ isset($output[0]['name']) ? $output[0]['name'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Description</label>
                <div class="col-sm-8">
                    <textarea class="form-control" id="wish_description" name="wish_description" required="required" placeholder="wish description">{{ isset($output[0]['description']) ? $output[0]['description'] : ''}}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Method</label>
                <div class="col-sm-8">
                    <select class="form-control" id="wish_method" name="wish_method">
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
                <label class="col-sm-4 col-form-label">Application</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="wish_application" name="wish_application" placeholder="wish application" required="required" value="{{ isset($output[0]['application']) ? $output[0]['application'] : '' }}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Qunatity</label>
                <div class="col-sm-8" style="display: flex;">
                    <input type="number" class="form-control" id="wish_qty" name="wish_qty" placeholder="wish qty" required="required" value="{{ isset($output[0]['qunatity']) ? $output[0]['qunatity'] : '' }}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Other Info</label>
                <div class="col-sm-8">
                     <textarea class="form-control" id="wish_other_info" name="wish_other_info" placeholder="wish other info">{{ isset($output[0]['other_info']) ? $output[0]['other_info'] : ''}}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Image (.jpg,.jpeg,.png,.pdf with max 2 MB size)</label>
                <div class="col-sm-8">
                    <div class="custom-file" style="display: flex;">
                        <input type="file" class="form-control-file" id="wish_image" name="wish_image">

                        @if($output[0]['image'])
                            <div style="width: 200px;border: 2px solid black;height: 130px;">
                                <img src="{{ asset('wish_image/'.$output[0]['image']) }}" style="object-fit: fill;width: 100%;height: 100%;">
                                <div> {{$output[0]['image']}}</div>
                                <span class="glyphicon glyphicon-remove-circle" style="margin: -100% 0% 0% -22%;font-size: 25px;cursor: pointer;" onclick="onclickRemoveWishImage('{{$output[0]['id']}}','{{ $output[0]['image'] }}')"></span>
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
<script src="{{ asset('js/product/wish_master.js') }}"></script>



<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->