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
            /* a{
                color: white;
            }
            a:hover{
                color: white;
            } */
        </style>

        @auth()
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        @endauth
        <div class="main-contents" id="app">
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
                <div class="container">
                    @yield('content')
                </div>
        </div>



        {{-- Footer --}}
        <footer class="container-fluid pt-3 bg-secondary text-center text-light">
            <div class="row">
                <div class="col-md-4 col-12">
                    <div class="mx-auto d-inline-flex flex-column">
                        <p class="h4 text-left">
                            <i class="fa fas fa-address-book"></i>
                            Contact
                        </p>
                    
                        <ul style="list-style:none;" class="text-left px-0">
                            <li>
                                Email: <br>
                                <a class="ml-4 text-light" href="mailto:Contact@newmoboffice.com">Contact@newmoboffice.com</a>
                            </li>
                            <li>
                                Tèl:
                                <ul style="list-style:none;" class="px-0">
                                    {{-- <li><a href="tel:0560735560">0560 73 55 60</a></li> --}}
                                    <li><span class="font-weight-bold">Service Commerciale:</span> <br>
                                        <a class="text-light" href="tel:+213560125275">0560 12 52 75</a><br>
                                        <a class="text-light" href="tel:+213555619000">0555 61 90 00</a>
                                    </li>
                                    <li>
                                        <span class="font-weight-bold">Service Mobillier: </span>
                                        <br>
                                        <a class="text-light" href="tel:+213560536039">0560 53 60 39</a> 
                                    </li>
                                </ul>         
                            </li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="mx-auto d-inline-flex flex-column">
                        <p class="h4 text-left">
                            <i class="fas fa fa-comments"></i>
                            Besoin d'aide
                        </p>
                    
                        <ul style="list-style:none;" class="text-left px-0">
                            <li>
                                <a class="text-light h6" href="/contact">Contact</a>
                            </li>
                            <li>
                                <a class="text-light h6" href="{{route('about')}}">À propos</a>
                            </li>
                            <li>
                                <a class="text-light h6" href="{{route('register')}}">Créer un compte</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-12">
                    <div class="mx-auto d-inline-flex flex-column">
                        <p class="h4 text-left">
                            <i class="fa fa-credit-card"></i>
                            NewMob Family
                        </p>
                        <ul style="list-style:none" class="text-left px-0">
                            <li>
                                <a class="text-light h6" href="{{route('retailers.index')}}">Devenir Partenaire</a>
                            </li>
                            <li>
                                <a class="text-light h6" href="{{route('login')}} ">Connexion</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row align-middle my-3 justify-content-center">
                <span class="d-flex mx-3 px-2">
                    <a class="text-light" href="https://www.facebook.com/Newmoboffice-114119043302408/">
                        <i class="fab fa-facebook "></i>
                        Facebook
                    </a>
                </span>
                <span class="d-flex mx-3" >
                    <a class="text-light" href="https://www.instagram.com/newmob_office/">
                        <i class="fab fa-instagram"></i>
                        Instagram
                </a>
                </span>
                <span class="d-flex mx-3" >
                    <a class="text-light" href="https://twitter.com/NewmobOffice">
                        <i class="fab fa-twitter"></i>
                        twitter
                    </a>
                </span>
                <span class="d-flex mx-3" >
                    <a class="text-light" href="https://www.youtube.com/channel/UCFcFx27rEgL5JHmIFBsIYsQ?view_as=subscriber">
                        <i class="fab fa-youtube    "></i>
                        Youtube      
                    </a>
                </span>
    
            </div>
            <div class="row py-2 justify-content-center" style="background: #520e01">
                <span class="d-flex">
                    <i class="far fa fa-copyright fa-sm mr-2"></i>
                    {{-- <i class="far fa-copyright"></i> --}}
                    NewMobOffice
                </span>
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
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async 
src="https://www.googletagmanager.com/gtag/js?id=UA-139836523-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-139836523-2');
</script>

    </body>
</html>
