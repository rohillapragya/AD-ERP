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

        <a href="/dashboard" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Dashboard</a>
    </div>
    
@stop

<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @section('footer')
    @parent
@stop -->