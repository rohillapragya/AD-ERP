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

    <!-- <input type="hidden" id="roleId" name="roleId" value={{$user_role_id}}> -->

    <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <span class="glyphicon glyphicon-map-marker"></span>
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Method /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/methodIndex')=='YES')

            @if($user_role_id=='1' || $user_role_id=='2' || $is_admin_access_for_active_location=='Y' || Dashboard::isRouteExistForUser('/product/addMethod')=='YES')
                <div class="form-group row">
                    <div class="col-sm-12">
                        <a href="/product/addMethod" style="float: right" class="btn btn-default">Add New Product Method</a>
                    </div>
                </div>
            @endif    

        <div class="form-group row">
            <table class="table table-bordered" id="productMethodTable">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col" style="width: 700px;">Method Name</th>
                        <th scope="col">Active</td>
                        <th scope="col">Edit</th>
                        <th scope="col">Change Status</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td style="text-transform: uppercase;">{{$output[$i]['name']}}</td>
                                <td>{{$output[$i]['is_active']}}</td>
                                <td>
                                    @if($output[$i]['is_active']=='Y')
                                       <a href="/product/method/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                                    @endif 
                                <td>
                                    @if($output[$i]['is_active']=='Y')
                                      <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'N')" class="btn btn-primary btn-sm">Inactive</button>
                                    @else
                                       <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'Y')" style="width: 64px" class="btn btn-primary btn-sm">Active</button>
                                    @endif
                                </td>
                            </tr>
                        @endfor
                    @else  
                        <tr>
                            <td colspan="9" class="no-data-found">No Product Method found(s)</td>
                        </tr>
                    @endif    
                </tbody>
            </table>
        </div>
         @else
            <div class="form-group row" style="font-size: 20px;color: #ff2a03;font-weight: 600;">Ooopss !!! .. You have no access for page </div>
        @endif
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/product/method.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
