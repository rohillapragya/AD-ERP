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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  User Wish /  ADD</li>
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
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7' || $user_role_id=='11')
        <form method="post" action="/wish/save" enctype="multipart/form-data"> 
                {{ csrf_field() }}
         
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Name</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="wish_name" name="wish_name" placeholder="wish name" required="required" value="{{ old('wish_name')}}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Description</label>
                <div class="col-sm-8">
                     <textarea class="form-control" id="wish_description" name="wish_description" required="required" placeholder="wish description">{{ old('wish_description')}}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Method</label>
                <div class="col-sm-8">
                    <select class="form-control" id="wish_method" name="wish_method">
                        @for ($i=0;$i < count($activeMethodList);$i++)
                            <option  value={{ $activeMethodList[$i]["id"]}}> {{$activeMethodList[$i]["name"]}}</option>
                        @endfor
                    </select>        
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Application</label>
                <div class="col-sm-8">
                     <input type="input" class="form-control" id="wish_application" name="wish_application" placeholder="wish application" required="required" value="{{ old('wish_application')}}">
                </div>
            </div>


            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Qunatity</label>
                <div class="col-sm-8" style="display: flex;">
                    <input type="number" class="form-control" id="wish_qty" name="wish_qty" placeholder="wish qty" required="required" value="{{ old('wish_qty')}}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Other Info</label>
                <div class="col-sm-8">
                     <textarea class="form-control" id="wish_other_info" name="wish_other_info" placeholder="wish other info">{{ old('wish_other_info')}}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Image (.jpg,.jpeg,.png,.pdf with max 2 MB size)</label>
                <div class="col-sm-8">
                    <div class="custom-file">
                        <input type="file" class="form-control-file" id="wish_image" name="wish_image">
                    </div>
                </div>
            </div>


            <div class="form-group row" style="margin-top: 5%"> 
                <div class="col-sm-4"></div>
                <div class="col-sm-8">
                    <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Submit</button>
                 
                <div>
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
