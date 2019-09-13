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
        @stack('css')
    </head>
    <body class="{{ $class ?? '' }}">
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

        @auth()
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        @endauth
        <div class="main-content" id="app">
            {{-- Header --}}
            <header class="container-fluid bg-light">
                <div class="row justify-content-end">
                    {{-- <a href="" class="btn-link text-dark mx-2 text-center">test</a> --}}
                    @guest
                        <a href=" {{route('retailers.index')}} " class="btn-link text-dark mx-2 text-center">Espace Partenaires</a>
                        <a href="/login" class="btn-link text-dark mx-2 text-center">Connexion</a>                
                    @endguest
                    @auth
                        @if (auth()->user()->admin != null)
                            <a href="/home" class="btn-link text-dark mx-2 text-center font-weight-bold"> <u>Dashboard</u></a>
                            <a href="/profile" class="btn-link text-dark mx-2 text-center font-weight-bold"> <u>Mon Compte</u> </a>
                        @else
                            <a href="#" class="btn-link text-dark mx-2 text-center font-weight-bold"><u>Mon Compte</u></a>
                            <a href="{{ route('logout') }}" class="btn-link text-dark mx-2 text-center font-weight-bold" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                            Déconnexion
                            </a>
                        @endif
                    @endauth
                </div>

            </header>

            <!-- navbar -->

                @include('layouts.navbars.navs.guest',["transparent" => false])        
            
                {{-- @include('layouts.navbars.navbar') --}}
            @yield('content')
        </div>
        <!-- Footer -->
        <footer class="container-fluid bg-primary text-center px-5 pt-5 text-light">
            <div class="row">
                <div class="col-md-4 col-12">
                    <h5>
                        <i class="fa fa-file fa-rotate-90"></i>
                        Services
                    </h5>
                    <ul style="list-style:none">
                        <li>Service de livraison</li>
                        <li>Montage</li>
                        <li>Garanties</li>
                        <li>Conditions de retour</li>
                        <li>Financement</li>

                    </ul>
                </div>
                <div class="col-md-4 col-12">
                    <h5>
                        <i class="fa fa-comments"></i>
                        Besoin d'aide
                    </h5>
                    <ul style="list-style:none">
                        <li>Questions/Réponses</li>
                        <li>Contact</li>
                        <li>Suivi de commande</li>    
                    </ul>
                </div>
                <div class="col-md-4 col-12">
                    <h5>
                        <i class="fa fa-credit-card"></i>
                        New Meuble Family
                    </h5>
                    <ul style="list-style:none">
                        <li>Devenir Membre</li>
                        <li>Avantages</li>
                        <li>Connexion</li>
                        <li>Offres</li>    
                    </ul>
                </div>
            </div>

            <div class="row mx-5 mb-5 mt-3 text-center">
                <div class="col-md-12 col-12">
                    <ul class="text-center list-inline" style="list-style: none;font-size: 1.25em">
                        <li class="list-inline-item mx-3">
                            <a href="" >
                                <i class="fa fa-facebook"></i>
                                Facebook
                            </a>
                        </li>
                        <li class="list-inline-item mx-3">
                            <a href="">
                                <i class="fa fa-instagram"></i>
                                Instagram
                            </a>
                        </li>
                        <li class="list-inline-item mx-3">
                            <a href="">
                                <i class="fa fa-twitter"></i>
                                twitter        
                            </a>
                        </li>
                        <li class="list-inline-item mx-3">
                            <a href="">
                                <i class="fa fa-youtube"></i>
                                Youtube        
                            </a>
                        </li>
                    </ul>
                </div>
                
            </div>
            <div class="row text-center mb-0">
                <div class="col-md-12 col-12">
                    <p>© New Meuble Office</p>
                </div>
            </div>
            
        </footer>

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