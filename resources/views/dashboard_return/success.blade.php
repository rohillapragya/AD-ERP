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

        @if($text == 'Dispatch')         
             
            <a href="#" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Send Email</a>

     	@endif

    </div>
    
@stop

<script src="{{ asset('js/custom/success.js') }}"></script>