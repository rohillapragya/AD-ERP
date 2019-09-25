@extends('layout.home_layout')

@stack('Home-CSS')

@section('home')
    @parent
@stop

@section('content')

    <div class="container box-shadow">
        <form method="post" action="/doLogin">
            {{ csrf_field() }}
            <div class="form-group">
                <label>Email address</label>
                <input type="email" class="form-control" id="authKey" name="authKey" placeholder="Enter email" required="required">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" id="authValue" name="authValue" placeholder="Password" required="required">
            </div>
            <button type="submit" class="btn btn-success btn-lg">Submit</button>
            
            <div class="forgotPass"><a href="/forgotPassword">Forgot Password ?</a></div>
        </form>

        <!-- <div>session div UID - {{ Session::get('UID')}}</div>
        <div>session div EMAIL - {{ Session::get('EMAIL')}}</div>
        <div>session div full_name - {{ Session::get('full_name')}}</div>
        <div>session div role_name - {{ Session::get('role_name')}}</div> -->
    </div>
    
@stop
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @section('footer')
    @parent
@stop -->