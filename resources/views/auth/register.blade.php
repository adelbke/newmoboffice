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
        <link href="{{ asset('argon') }}/vendor/nucleo/css/nucleo.css" rel="stylesheet">
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
        {{-- <style>
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
        </style> --}}

        {{-- Navbar --}}
        {{-- <nav class="navbar fixed-top navbar-expand-lg navbar-dark text-light bg-transparent">
            <a class="navbar-brand" href="/">
                <img src="/asset/logo-small.png" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse py-2" id="navbarColor03">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown font-weight-bold my-3 text-light">
                        <a class="nav-link dropdown-toggle text-light" href="https://bootstrapthemes.co" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Produits
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Meuble de Bureau</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Armoires</a></li>
                                    <li><a href="#" class="dropdown-item">Bureau de direction</a></li>
                                    <li><a href="#" class="dropdown-item">Bureau Opérateur</a></li>
                                    <li><a href="#" class="dropdown-item">Workstation</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Fauteuil et Siège</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Chaise Visiteur</a></li>
                                    <li><a href="#" class="dropdown-item">Fauteuil de Direction</a></li>
                                    <li><a href="#" class="dropdown-item">Fauteuil Opérateur</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Mobilier de Réunion</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Siège de Réunion</a></li>
                                    <li><a href="#" class="dropdown-item">Tables Conférence et Réunion</a></li>
                                    <li><a href="#" class="dropdown-item">Tables de Réunion modulaire</a></li>
                                    <li><a href="#" class="dropdown-item">Tables de Réunion et Travail</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Mobilier Accueil</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Banquette de Réception</a></li>
                                    <li><a href="#" class="dropdown-item">Canapés et Fauteuils</a></li>
                                    <li><a href="#" class="dropdown-item">Comptoir de Réception</a></li>
                                    <li><a href="#" class="dropdown-item">Tables Basses</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Mobilier de Conférence</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Chaise Amphithéâtre</a></li>
                                    <li><a href="#" class="dropdown-item">Fauteuil Auditorium</a></li>
                                    <li><a href="#" class="dropdown-item">Pupitre Orateur</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Bibliothèque & mobilier pour écoles et crèches</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Armoire & Rangement Métallique</a></li>
                                    <li><a href="#" class="dropdown-item">Mobilier pour crèches</a></li>
                                    <li><a href="#" class="dropdown-item">Rayonnage Métallique</a></li>
                                    <li><a href="#" class="dropdown-item">Rayonnage Mobile</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Environnement & Accéssoires</a>
                            </li>
                            <li>
                                <a class="dropdown-item dropdown-toggle" href="#">Collectivité Cafeteria</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" class="dropdown-item">Chaises</a></li>
                                    <li><a href="#" class="dropdown-item">Tables</a></li>
                                    <li><a href="#" class="dropdown-item">Fauteuils & Tabourets</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Matériel Informatique</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item my-3 font-weight-bold">
                        <a class="nav-link text-light" href="#">Collections</a>
                    </li>
                    <li class="nav-item my-3 font-weight-bold">
                        <a class="nav-link text-light" href="#">Contact</a>
                    </li>
                    <li class="nav-item my-3 font-weight-bold">
                        <a class="nav-link text-light" href="#">À propos</a>
                    </li>
                </ul>
                <div class="d-inline my-2 my-lg-0 mx-lg-2">
                    <a class="rounded-circle bg-gray hvr-fade text-center align-self-center" href="/login" style="width:2.7em;height:2.7em;cursor: pointer;">
                        <i class="fa fas fa-user align-middle pt-1" title="Accéder à mon Compte" style="font-size:1.8em" aria-hidden="true"></i>
                    </a>
                    
                    <a class="rounded-circle hvr-fade bg-gray text-center align-self-center" style="width:2.7em;height:2.7em;cursor: pointer;">
                        <i class="fa fa-cart-plus align-middle pt-1" title="Consulter Panier" style="font-size:1.8em" aria-hidden="true"></i>
                    </a>
                    
                </div>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav> --}}

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
                                                <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
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
                                                <span class="input-group-text"><i class="ni ni-email-83"></i></span>
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
                                                <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
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
                                                <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
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

    
