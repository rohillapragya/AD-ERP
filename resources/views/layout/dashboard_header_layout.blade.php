<html>
    <head>
        <title> Natura Biotechnol Pvt Ltd</title>
        <meta charset="utf-8">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="{{ asset('css/online/bootstrap.min.css')}}"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="{{ asset('css/online/bootstrap_1.min.css')}}"> -->
        <link rel="shortcut icon" href="{{ asset('logo/favIcon_32X32.png') }}">
        <link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- <link rel="stylesheet" href="{{ asset('css/online/icon.css')}}"> -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.css">
        
        

        <style>
        .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        border-top: 2px solid #DDD;
        /* background-color: red;
        color: white; */
        text-align: center;
        }
</style>
    </head>
    @php
        $user_role_id = Session::get('role_id');
    @endphp

    <body>
        @section('dashboard-home')
            <div class="header">
                <a href="/" class="logo">
                    <img src="{{ asset('logo/120X120.jpg') }}" alt="Natura Biotechnol Pvt Ltd">
                </a>

                <div class="header-right"> 
                    <span style="display: grid;margin-right: 15px;">
                        <span class="font-bold" style="text-transform: capitalize;">{{ Session::get('full_name')}}</span>
                        <span class="font-bold" id="session_location_id" style="color: white">{{ Session::get('location_id')}} </span>
                    </span>
                    <span class="glyphicon glyphicon-user font-30" style="margin-right: 50px;"></span>
                    <!-- <span class="glyphicon glyphicon-bell font-30" style="margin-right: 50px;"></span> -->

                    @if($user_role_id=='1' || $user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7')
                        <a href="/inquiry/proceedCart">
                            <span class="glyphicon glyphicon-shopping-cart font-30" style="margin-right: 50px;margin-top: -13px;"><div id="userCartCount" class="userCartCount">0</div></span>
                        </a>
                    @endif
                    
                    <a href="/signoff" style="padding: 0px;"> <span class="glyphicon glyphicon-log-out font-30"></span></a>
                   
                </div>
               
                <div class="border"></div>

                <div style="float: right;margin-top: -2%;">
                    <img src="{{ asset('logo/leaf.png')}}">
                </div>


                <div class="container">
                    <div class="row" style="padding: 2%">
                        <div class="col-md-4" style="font-size: 18px;font-weight: 600;word-spacing: 1;">Select Current Working Location :- </div>
                        <div class="col-md-8">
                            <select class="form-control" id="userLocationMaster" name="userLocationMaster" style="width: 50%;" onchange="onChangeUserLocation()">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </div> 

                <!-- <div id="sachdgwqind"></div> -->


                 <div class="container">
                    <div class="row" style="padding: 2%">
                        <div class="col-md-12" style="font-size: 18px;font-weight: 600;word-spacing: 1;">
                            <div id="userLocationErrorMessage" style="display: none;color: red;font-weight: 600;"></div>
                        </div>
                    </div>
                </div> 
                   
            </div>
        @show

        <div class="container">
            @yield('content')
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- <script src="{{ asset('js/online/jquery.min.js') }}"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <!-- <script src="{{ asset('js/online/popper.min.js') }}"></script> -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{{ asset('js/Home/dashboard.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/Home/userLocation.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/Home/userLocationURL.js') }}"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/5.3.5/sweetalert2.min.js"></script>
        
    </body>
</html>