@extends('layout.dashboard_header_layout')

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div cart_id - {{ Session::get('cart_id')}}</div> -->

@php
    $user_role_id = Session::get('role_id');

    $user_id = Session::get('UID');

    $route = Request::path();
@endphp


    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <span class="glyphicon glyphicon-map-marker"></span>
            <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Development /  Region & Location Map</li>
        </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1')

            @if(count($getRegion) > 0)
            <div class="form-group row">
                <div class="col-sm-12">

                    <div class="accordion" id="accordionExample">

                        @for($ix=0;$ix< count($getRegion);$ix++)
                            <div class="card">
                                <div class="card-header" id="region_{{$getRegion[$ix]['id']}}" style="background-color: #38f851">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse_region_{{$getRegion[$ix]['id']}}" aria-expanded="true" aria-controls="collapse_region_{{$getRegion[$ix]['id']}}" style="text-transform: capitalize;"> {{$getRegion[$ix]['region']}}
                                        </button>
                                    </h2>
                                </div>

                                <div id="collapse_region_{{$getRegion[$ix]['id']}}" class="collapse show" aria-labelledby="region_{{$getRegion[$ix]['id']}}" data-parent="#accordionExample">
                                    <div class="card-body" id="add_route_card_{{$getRegion[$ix]['id']}}">
                                        
                                        @for($i=0;$i< count($regionLocationMapList);$i++)
                                                
                                            @if($getRegion[$ix]['id']==$regionLocationMapList[$i]['region_id'])
                                                <div style="display: flex;border-bottom: 1px solid #DDD;padding: 2%;text-transform: capitalize;">
                                                    <div>{{$regionLocationMapList[$i]['location']}}</div>
                                                    <button type="button" class="btn btn-info" id="{{$regionLocationMapList[$i]['region_id']}}_{{$regionLocationMapList[$i]['location_id']}}" style="position: absolute;right: 3%; margin-bottom: 1.5;" onclick="onClickRemoveRegionLocationMapping(id)"> Remove</button>
                                                 </div>
                                            @endif

                                        @endfor

                                        <button type="button" class="btn btn-info" style="color: #373636;font-size: 14px; background-color: #ffffff;" id="addRouteBtn_{{$getRegion[$ix]['id']}}" name="{{$getRegion[$ix]['region']}}" onclick="onclickAddRegion_Location(id,name)">Add Location</button>
                                    
                                    </div>
                                </div>
                            </div>
                        @endfor

                    </div>

                </div>
            </div>

            @else
                <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. No Mapping found </div>
            @endif

        @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>


    <dialog id="showRegion" style="width: 50%;border: 1px solid #DDD;">

        <button type="button" class="btn btn-warning"  onclick="onClickDialogClose()" style="float: right;margin-bottom: 1;background-color: #ff4900;border-color: #ff4900;"> Close</button> 
        
        <div style="margin-top: 5%">
        
            <div id="locationList" style="font-size: 18px;text-transform: capitalize;font-weight: 600;"></div>
            <div type="text" id="regionList" style="display: none"></div>

            @for($ix=0;$ix< count($getLocation);$ix++)

                <div style="display: flex;border-bottom: 1px solid #DDD;padding: 2%;">
                    <div>{{$getLocation[$ix]['location']}}</div>
                    <button type="button" class="btn btn-info" id="{{$getLocation[$ix]['id']}}" style="position: absolute;right: 3%; margin-bottom: 1.5;" onclick="onClickAddRegion_Location(id)"> Add Location</button> 
                </div>
            @endfor
        </div>
       
      
    </dialog>
    
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
<script src="{{ asset('js/development/region_location_map.js') }}"></script>