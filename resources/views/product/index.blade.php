@extends('layout.dashboard_header_layout')



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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  Product /  List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='14')
        <div class="form-group row">
            <div class="col-sm-12">
                <a href="/product/addProduct" style="float: right" class="btn btn-default">Add New Product</a>
            </div>
        </div>

        <div class="form-group row">
            <table class="table table-bordered" id="productTable">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col" style="width: 110px;">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">Botanical Name</th>
                        <th scope="col">Specification</th>
                        <th scope="col">Application</th>
                        <th scope="col">Active</td>
                        <th scope="col">Edit</th>
                        <th scope="col" style="width: 120px;">Change Status</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td style="text-transform: uppercase;">{{$output[$i]['code']}}</td>
                                <td style="text-transform: capitalize;">{{$output[$i]['name']}}</td>
                                <td style="    text-transform: capitalize;font-style: italic;font-weight: 600;">{{$output[$i]['scrientific_name']}}</td>
                                <td>{{$output[$i]['specification']}}</td>
                                <td>{{$output[$i]['application']}}</td>
                                <td>{{$output[$i]['active']}}</td>
                                <td>
                                    @if($output[$i]['active']=='Y')
                                       <a href="/product/edit/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-pencil"></a></td> 
                                    @endif 
                                <td>
                                    @if($output[$i]['active']=='Y')
                                      <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'N')" class="btn btn-primary btn-sm">Inactive</button>
                                    @else
                                       <button type="button" onclick="onClickChangeStatus({{$output[$i]['id']}},'Y')" style="width: 64px" class="btn btn-primary btn-sm">Active</button>
                                    @endif
                                </td>
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

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="{{ asset('js/product/product.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
