@php
    use \App\Http\Controllers\Dashboard;
@endphp


@extends('layout.dashboard_header_layout')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Product /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
       @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/priceRange')=='YES')

        <div class="form-group row">
            <table class="table table-bordered" id="productTable">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col" style="vertical-align: sub;">#</th>
                        <th scope="col" style="width: 110px;vertical-align: sub;">Code</th>
                        <th scope="col" style="vertical-align: sub;">Name</th>
                        <th scope="col" style="vertical-align: sub;">Botanical Name</th>
                        <th scope="col" style="vertical-align: sub;">Specification</th>
                        <th scope="col" style="vertical-align: sub;">Application</th> 
                        <th scope="col" style="width: 120px;vertical-align: sub;">Price Range</th>
                        <th scope="col" style="vertical-align: sub;">Price Valid Till</th>
                        <th scope="col" style="vertical-align: sub;">Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td style="text-transform: uppercase;">{{$output[$i]['code']}}</td>
                                <td style="text-transform: capitalize;">{{$output[$i]['name']}}</td>
                                <td style="text-transform: capitalize;font-style: italic;font-weight: 600;">{{$output[$i]['scrientific_name']}}</td>
                                <td>{{$output[$i]['specification']}}</td>
                                <td>{{$output[$i]['application']}}</td>
                                <td style="text-align: center;"><i class="fa fa-rupee" style="font-size:12px"></i> {{$output[$i]['min_price']}} - {{$output[$i]['max_price']}}</td>
                                <td>{{$output[$i]['valid_till']}}</td>
                                @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/{productId}/priceRange')=='YES')
                                <td>
                                    <a href="/product/{{$output[$i]['id']}}/priceRange"><span class="glyphicon glyphicon-tag"></span></a>
                                </td>
                                @else
                                    <td>-</td>
                                @endif    
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Product found(s)</td>
                        </tr>
                    @endif    
                </tbody>
            </table>
        </div>
         @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>


    <!-- <div class="container">
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content" id="productModal">
                  
                    <div class="modal-header">
                        <h4 class="modal-title">Modal Heading</h4>
                        <button type="button" class="close btn btn-danger" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body"> </div>
                   
                    <div class="modal-footer"><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></div>

                </div>
            </div>
        </div>
    </div> -->


@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
