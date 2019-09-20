<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Argon Dashboard') }}</title>
        <!-- Favicon -->
        {{-- <link href="{{ asset('argon') }}/img/brand/favicon.png" rel="icon" type="image/png"> --}}
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <!-- Icons -->
        <link href="{{ asset('argon') }}/vendor/nucleo/css/nucleo.css" rel="stylesheet">
        {{-- <link href="{{ asset('argon') }}/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet"> --}}
        <link rel="stylesheet" href="{{asset('css/app.css')}}">

        <!-- Argon CSS -->
        {{-- <link type="text/css" href="{{ asset('argon') }}/css/argon.css?v=1.0.0" rel="stylesheet"> --}}
    </head>
    <body class="{{ $class ?? '' }}" style="background: url('/images/business-background.jpg') no-repeat center center fixed;">
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

        {{-- Navbar --}}
        @include('layouts.navbars.navs.guest',["transparent"=> true])


        <div class="main-content" id="app">
            <div class="container-fluid mb-5 text-center">
                <h1 class="display-4 text-white">Devenez Partenaire !</h1>
                <h2 class="h2 text-white">Rejoignez une communauté productive avec une des meilleurs industries du Pays.</h2>
            </div>
            <div class="container-fluid">
                <div class="col-md-4 offset-md-4 col-12 bg-white p-4 rounded offset-0">
                    
                    @if (session('status'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('status') }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>                        
                    @endif

                    {{-- Content --}}
                    <form action="/retailers" method="post">
                        @csrf
                        {{-- Name input --}}
                        <div class="form-group @error('name') has-danger @enderror ">
                            <label class="form-control-label font-weight-bold" for="input-name">Nom</label>
                            <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" id="" aria-describedby="helpId" placeholder="Nom" required >
                            @if ($errors->has('name'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('name') }}</strong>
                                </span>
                            @endif
                        </div>
        
                        {{-- Email input --}}
                        <div class="form-group @error('email') has-danger @enderror ">
                            <label class="form-control-label font-weight-bold" for="input-email">Email</label>
                            <input type="email" class="form-control @error('email') is-invalid @enderror " name="email" id="input-email" aria-describedby="emailHelpId" placeholder="Email" required >
        
                            @if ($errors->has('email'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('email') }}</strong>
                                </span>
                            @endif
                        </div>
        
                        {{-- Password input --}}
                        <div class="form-group @error('password') has-danger @enderror ">
                            <label class="form-control-label font-weight-bold" for="input-password">Mot de passe</label>
                            <input type="password" class="form-control @error('password') is-invalid @enderror " name="password" id="input-password" placeholder="Mot de passe" required >
        
                            @if ($errors->has('password'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
        
                        </div>
        
                        {{-- Password Confirmation --}}
                        <div class="form-group @error('password_confirmation') has-danger @enderror ">
                            <label class="form-control-label font-weight-bold" for="input-password_confirmation">Confirmation de Mot de passe</label>
                            <input type="password" class="form-control @error('password_confirmation') is-invalid @enderror" name="password_confirmation" id="input-password-confirmation" placeholder="Confirmer le mot de passe" required >
                            
                            @if ($errors->has('password_confirmation'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('password_confirmation') }}</strong>
                                </span>
                            @endif
                            
                        </div>

                        {{-- Phone --}}
                        <div class="form-group @error('phone') has-danger @enderror">
                            <label class="form-control-label font-weight-bold" for="input-phone">Téléphone</label>
                            <input type="text" class="form-control @error('phone') is-invalid @enderror" name="phone" id="input-phone" aria-describedby="" placeholder="Tél" required>
                                @if ($errors->has('phone'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                @endif
                        </div>

                        {{-- numéro Registre Commerce --}}
                        <div class="form-group">
                            <label class="form-control-label font-weight-bold" for="input-registreCommerce">Numéro de Registre Commerce</label>
                            <input type="text"
                            class="form-control" name="registreCommerce" id="input-registreCommerce" aria-describedby="helpId" placeholder="Numéro de registre de commerce" required >
                            @if ($errors->has('input-registreCommerce'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('input-registreCommerce') }}</strong>
                                </span>
                            @endif
                        </div>

                        <div class="form-group">
                            <label class="form-control-label font-weight-bold" for="input-Address">Addresse</label>
                            <input type="text" class="form-control" name="Address" id="input-Address" aria-describedby="helpId" placeholder="Addresse">
                            @if ($errors->has('input-Address'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('input-Address') }}</strong>
                                </span>
                            @endif

                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Envoyer demande partenariat</button>
                        </div>
                    </form>

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