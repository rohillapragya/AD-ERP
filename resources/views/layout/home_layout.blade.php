<html>
    <head>
        <title>Natura Biotechnol Pvt Ltd.</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="shortcut icon" href="{{ asset('logo/favIcon_32X32.png') }}">
        <link rel="stylesheet" href="{{ asset('css/Home/app.css') }}">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
       
    </head>
    <body>
        @section('home')
            <div class="header">
                <a href="/">
                    <img src="{{ asset('logo/120X120.jpg') }}" alt="Natura Biotechnol Pvt Ltd">
                </a>

                <div class="header-right"> 
                    <a href="/">Login</a>
                </div>

                <div class="border"></div>
            </div>
        @show

        <div class="container">
            @yield('content')
        </div>

        <!-- @section('footer')
            <h4>This is footer</h4>
        @show -->
    </body>
</html>