@extends('layout.home_layout')

@stack('Home-CSS')

@section('home')
    @parent
@stop

@section('content')

    <div class="container box-shadow">
        <div class="alert alert-success" role="alert">
            {{ $message}}
        </div>

        <a href="/" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Login Again</a>
        <a href="/forgotPassword" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">Forget Password</a>
    </div>
    
@stop

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @section('footer')
    @parent
@stop -->