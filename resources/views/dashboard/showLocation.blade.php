@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

@php
    $user_role_id = Session::get('role_id');

    $user_id = Session::get('UID');
    $full_name = Session::get('full_name');

    $route = Request::path();
@endphp

    <div class="container box-shadow">

        <div class="row">
            <div class="col-sm-12">
                <form method="get" action="/selectedLocation"> 
                {{ csrf_field() }}
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <h4><b style="text-transform: capitalize;">Dear {{$full_name}},</b> <br><br>Please select location from below location list. Selected location will work as your working location. Will able to work in selected location only.</h4><br>
                        </div>
                        <label class="col-sm-4 col-form-label">Location</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="userLocationID" name="userLocationID">
                                @for ($i = 0; $i < count($userLocation); $i++)
                                   <option value="{{$userLocation[$i]['location_id']}}-{{$userLocation[$i]['location_name']}}">{{$userLocation[$i]['location_name']}}</option>
                                @endfor
                            </select>
                        </div>
                    </div>

                    <div class="form-group row" style="margin-top: 5%"> 
                        <div class="col-sm-4"></div>
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-success btn-lg" style="width: 40%;margin-right: 10%;">Proceed</button>
                            <button type="button" class="btn btn-secondary btn-lg" style="width: 40%;">Cancel</button>
                        </div>   
                    </div>    
                </form>
            </div>
        </div>
    </div>
    
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->