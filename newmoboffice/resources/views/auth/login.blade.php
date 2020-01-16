{{-- Content --}}
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
    <link href="asset/logo-small.png" rel="stylesheet">
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
    <style>
        :root {
            --input-padding-x: 1.5rem;
            --input-padding-y: 0.75rem;
        }
        
        .login,
        .image {
            min-height: 100vh;
        }
        
        .bg-image {
            /* background-image: url('https://source.unsplash.com/WEQbe2jBg40/600x1200'); */
            background-image: url('/images/furniture-slide1.png');
            background-size: cover;
            background-position: center;
        }
        
        .login-heading {
            font-weight: 300;
        }
        
        .btn-login {
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
            border-radius: 2rem;
        }
        
        .form-label-group {
            position: relative;
            margin-bottom: 1rem;
        }
    </style>
    
    @include('layouts.navbars.navs.guest',["transparent"=> true])
    
    
    <div class="main-content" id="app">
        <div class="container-fluid mb-5">
            <div class="row no-gutter">
                <div class="d-none d-md-flex col-md-4 col-lg-6">
                </div>
                <div class="col-md-8 col-lg-6">
                    <div class="login d-flex align-items-center py-5">
                        <div class="container-fluid bg-light pt-5 pb-2 rounded">
                            <div class="row">
                                <div class="col-md-9 col-lg-8 mx-auto">
                                    <h3 class="login-heading text-primary mb-4">Bienvenue, Connectez vous à votre Compte !</h3>
                                    <form role="form" method="POST" action="{{ route('login') }}">
                                        @csrf
                                        @if(session('sendBackTo'))
                                            {{-- {{Form::hidden('sendBackTo','cartIndex')}} --}}
                                            <input type="hidden" name="sendBackTo" value="cartIndex">
                                        @endif
                                        <div class="form-group{{ $errors->has('email') ? ' has-danger' : '' }} mb-3">
                                            <div class="input-group input-group-alternative">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-email-83 text-primary"></i></span>
                                                </div>
                                                <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="{{ __('Email') }}" type="email" name="email" value="{{ old('email') }}" value="admin@argon.com" required autofocus>
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
                                                    <span class="input-group-text"><i class="ni ni-lock-circle-open text-primary"></i></span>
                                                </div>
                                                <input class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="{{ __('Password') }}" type="password" value="secret" required>
                                            </div>
                                            @if ($errors->has('password'))
                                            <span class="invalid-feedback" style="display: block;" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                        <div class="custom-control custom-control-alternative custom-checkbox">
                                            <input class="custom-control-input" name="remember" id="customCheckLogin" type="checkbox" {{ old('remember') ? 'checked' : '' }}>
                                            <label class="custom-control-label" for="customCheckLogin">
                                                <span class="text-muted">{{ __('Rester Connecté') }}</span>
                                            </label>
                                        </div>
                                        <div class="custom-control custom-control-alternative mb-2 custom-checkbox">
                                            {{ __('Vous n\'avez pas de compte? ')}}
                                            <a href="/register" class="btn-link btn-light">Inscrivez Vous !</a>
                                        </div>
                                        
                                        <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" 
type="submit">Se Connecter</button>
                                        @if (Route::has('password.request'))
                                        <a href="{{ route('password.request') }}" class="text-light">
                                            <small>{{ __('Forgot password?') }}</small>
                                        </a>
                                        @endif
                                    </form>
                                </div>
                            </div>
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
    
    {{-- @push('custom-styles') --}}
    
    {{-- @endpush --}}
    
    
    
    
    {{-- @endsection --}}
