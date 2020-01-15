{{-- @extends('layouts.guest', ['class' => 'bg-default']) --}}

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>NewMobOffice</title>
        <!-- Favicon -->
        {{-- <link href="{{ asset('argon') }}/img/brand/favicon.png" rel="icon" type="image/png"> --}}
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <!-- Icons -->
        <link href="/asset/logo-small.png" rel="stylesheet">
        {{-- <link href="{{ asset('argon') }}/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet"> --}}
        <link rel="stylesheet" href="{{asset('css/app.css')}}">

        <!-- Argon CSS -->
        {{-- <link type="text/css" href="{{ asset('argon') }}/css/argon.css?v=1.0.0" rel="stylesheet"> --}}
    </head>
    <body class="{{ $class ?? '' }}" style="background-image:url('/images/office-background.jpg');background-size: cover;background-position: center;">
        <style>
            textarea:focus,
            input[type="text"]:focus,
            input[type="password"]:focus,
            input[type="datetime"]:focus,
            input[type="datetime-local"]:focus,
            input[type="date"]:focus,
            input[type="month"]:focus,
            input[type="time"]:focus,
            input[type="week"]:focus,
            input[type="number"]:focus,
            input[type="email"]:focus,
            input[type="url"]:focus,
            input[type="search"]:focus,
            input[type="tel"]:focus,
            input[type="color"]:focus,
            button[type="button"]:focus,
            .uneditable-input:focus {   
                border-color: #eee;
                box-shadow:none;
                outline: none;
            }
            a{
                color: white;
            }
            a:hover{
                color: white;
            }
        </style>

        @include('layouts.navbars.navs.guest',["transparent"=> true])

        <div class="main-content" id="app">
            <div class="container mt--8 pb-5">
                <!-- Table -->
                <div class="row justify-content-end">
                    <div class="col-lg-6 col-md-8 ">
                        <div class="card bg-light shadow border-0">
                            {{-- <div class="card-header bg-transparent pb-5">
                                <div class="text-muted text-center mt-2 mb-4"><small>{{ __('Sign up with') }}</small></div>
                                <div class="text-center">
                                    <a href="#" class="btn btn-neutral btn-icon mr-4 shadow rounded text-light" style="background: #3C5A99;">
                                        <span class="btn-inner--icon">
                                            <i class="fa fab fa-facebook-square fa-2x"></i>
                                        </span>
                                        <span class="btn-inner--text font-weight-bold">{{ __('Facebook') }}</span>
                                    </a>
                                    <a href="#" class="btn btn-neutral btn-icon shadow">
                                        <span class="btn-inner--icon">
                                            <img src="{{ asset('argon') }}/img/icons/common/google.svg"></span>
                                        <span class="btn-inner--text">{{ __('Google') }}</span>
                                    </a>
                                </div>
                            </div> --}}
                            <div class="card-body px-lg-5 py-lg-5">
                                <div class="text-center text-primary mb-4">
                                    <h2 class="h4">Créez Votre Compte NewMobOffice</h2>
                                    {{-- <small>{{ __('Or sign up with credentials') }}</small> --}}
                                </div>
                                <form role="form" method="POST" action="{{ route('register') }}">
                                    @csrf
        
                                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                                        <div class="input-group input-group-alternative mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa fa-graduation-cap"></i></span>
                                            </div>
                                            <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" placeholder="{{ __('Name') }}" type="text" name="name" value="{{ old('name') }}" required autofocus>
                                        </div>
                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>


                                    <div class="form-group{{ $errors->has('phone') ? ' has-danger' : '' }}">
                                        <div class="input-group input-group-alternative mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="fas fa fa-phone"></i>
                                                </span>
                                            </div>
                                            <input class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" placeholder="{{ __('phone') }}" type="text" name="phone" value="{{ old('phone') }}" required autofocus>
                                        </div>
                                        @if ($errors->has('phone'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('phone') }}</strong>
                                            </span>
                                        @endif
                                    </div>


                                    <div class="form-group{{ $errors->has('address') ? ' has-danger' : '' }}">
                                        <div class="input-group input-group-alternative mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa fa-address-card"></i></span>
                                            </div>
                                            <input class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" placeholder="{{ __('address') }}" type="te    xt" name="address" value="{{ old('address') }}" required autofocus>
                                        </div>
                                        @if ($errors->has('address'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('address') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group{{ $errors->has('email') ? ' has-danger' : '' }}">
                                        <div class="input-group input-group-alternative mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa fa-envelope"></i></span>
                                            </div>
                                            <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="{{ __('Email') }}" type="email" name="email" value="{{ old('email') }}" required>
                                        </div>
                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group{{ $errors->has('password') ? ' has-danger' : '' }}">
                                        <div class="input-group input-group-alternative">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-lock-open"></i></span>
                                            </div>
                                            <input class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="{{ __('Password') }}" type="password" name="password" required>
                                        </div>
                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group input-group-alternative">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
							<i class="fas fa-lock-open"></i>
						</span>
                                            </div>
                                            <input class="form-control" placeholder="{{ __('Confirm Password') }}" type="password" name="password_confirmation" required>
                                        </div>
                                    </div>
                                    {{-- <div class="text-muted font-italic">
                                        <small>{{ __('password strength') }}: <span class="text-success font-weight-700">{{ __('strong') }}strong</span></small>
                                    </div> --}}
                                    <div class="row my-4">
                                        <div class="col-12">
                                            <div class="custom-control custom-control-alternative custom-checkbox">
                                                <input class="custom-control-input" name="terms" id="customCheckRegister" type="checkbox">
                                                <label class="custom-control-label" for="customCheckRegister">
                                                    <span class="text-muted">{{ __('J\'accepte les  ') }} <a href="#!" class="text-primary">{{ __('termes et conditions') }}</a></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary mt-4">{{ __('Create account') }}</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- @guest()
            @include('layouts.footers.guest')
        @endguest --}}

        <script src="{{ asset('argon') }}/vendor/jquery/dist/jquery.min.js"></script>
        <script src="{{ asset('argon') }}/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        
        @stack('js')
        <script src="{{asset('js/app.js')}}"></script>
        
        {{-- <script>AOS.init();</script>     --}}
        <!-- Argon JS -->
        <script src="{{ asset('argon') }}/js/argon.js?v=1.0.0"></script>
    </body>
</html>

    
