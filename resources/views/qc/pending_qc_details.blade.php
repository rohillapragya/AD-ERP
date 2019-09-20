@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


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
        <li class="breadcrumb-item active" aria-current="page"> <a href="/dashboard"> Dashboard </a> /  QC /  Pending QC Details List</li>
    </ol>
    </nav>

    <div class="container box-shadow">
        <div class="form-group row">
            <table class="table table-bordered" id="sampleItemsList">
                <thead style="background-color: #eef1ed;font-size: 14px;">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Inquiry Number</th>
                        <th scope="col">Inquiry Date</th>
                        <th scope="col">Delivery Date</th>
                        <th scope="col">Customer Info</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 14px;" >
                    @if(count($output) > 0)
                        @for ($i = 0; $i < count($output); $i++)
                            <tr>
                                <td>{{($i+1)}}</td>
                                <td>{{$output[$i]['sample_number']}}</td>
                                <td>{{$output[$i]['request_date']}}</td>
                                <td>{{$output[$i]['delivered_date']}}</td>
                                <td>{{$output[$i]['ref_name']}}</td>
                                <td>{{$output[$i]['customer_status']}}</td>
                                @if($user_role_id=='3' || $user_role_id=='7')
                                  <!--   <td><a href="/sample/customer/readyForDispatch/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-tag"></a></td> -->
                                     <td><a href="/sample/qc/QCDetails/{{$output[$i]['id']}}"><span class="glyphicon glyphicon-tag"></a></td>
                                @else
                                    <td><span class="glyphicon glyphicon-tag"></td>
                                @endif

                               
                            </tr>
                        @endfor
                        <!-- @php
                            print_r($output[0]['customer_status']);
                        @endphp -->
                    @else  
                        <tr>
                            <td colspan="10" class="no-data-found">No Inquiry found</td>
                        </tr>
                    @endif    
                </tbody>
            </table>
        </div>
    </div>

@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="{{ asset('js/online/jquery-1.7.1.min.js') }}"></script>
<script src="{{ asset('js/online/jquery.min.js') }}"></script> -->
<script src="{{ asset('js/custom/customer_sample_list.js') }}"></script>


<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->
