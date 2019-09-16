@extends('layout.home_layout')

@stack('Home-CSS')

@section('home')
    @parent
@stop

@section('content')

    <div class="container box-shadow">
        <form method="post" action="/changePassword">
        {{ csrf_field() }}
            <div class="form-group">
                <label>Your email address</label>
                <input type="email" class="form-control" name="auth_key" placeholder="Enter email" required="required">
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" class="form-control" name="new_auth_key" placeholder="Password" required="required">
            </div>
            <button type="submit" class="btn btn-success btn-lg">Change Password</button>

        </form>
    </div>
    
   
@stop

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @section('footer')
    @parent
@stop -->