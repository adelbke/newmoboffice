{{-- <nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
    <div class="container px-4">
        <a class="navbar-brand" href="{{ route('home') }}">
            <img src="{{ asset('argon') }}/img/brand/white.png" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-collapse-main">
            <!-- Collapse header -->
            <div class="navbar-collapse-header d-md-none">
                <div class="row">
                    <div class="col-6 collapse-brand">
                        <a href="{{ route('home') }}">
                            <img src="{{ asset('argon') }}/img/brand/blue.png">
                        </a>
                    </div>
                    <div class="col-6 collapse-close">
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                </div>
            </div>
            <!-- Navbar items -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="{{ route('home') }}">
                        <i class="ni ni-planet"></i>
                        <span class="nav-link-inner--text">{{ __('Dashboard') }}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="{{ route('register') }}">
                        <i class="ni ni-circle-08"></i>
                        <span class="nav-link-inner--text">{{ __('Register') }}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="{{ route('login') }}">
                        <i class="ni ni-key-25"></i>
                        <span class="nav-link-inner--text">{{ __('Login') }}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="{{ route('profile.edit') }}">
                        <i class="ni ni-single-02"></i>
                        <span class="nav-link-inner--text">{{ __('Profile') }}</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav> --}}

<style>
nav.scroll {
  background-color: #A1572F;
  color: #eef;
}
</style>

<nav class="navbar sticky-top navbar-expand-lg navbar-light @isset($transparent) @if($transparent == true) bg-transparent @else bg-white @endif  @endisset">
    <a class="navbar-brand" href="/">
        <img src="/asset/logo-small.png" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse py-2" id="navbarColor03">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown font-weight-bold my-3 text-dark">
                <a class="nav-link dropdown-toggle @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;">
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
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="#">Collections</a>
            </li>
            <li class="nav-item my-3 font-weight-bold">
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="#">Contact</a>
            </li>
            <li class="nav-item my-3 font-weight-bold">
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="#">À propos</a>
            </li>
        </ul>
        <div class="d-inline my-2 my-lg-0 mx-lg-2">
            <a class="rounded-circle @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset hvr-fade text-center align-self-center" href="/login" style="width:2.7em;height:2.7em;cursor: pointer;">
                <i class="fa fas fa-user align-middle pt-1" title="Accéder à mon Compte" style="font-size:1.8em" aria-hidden="true"></i>
            </a>
            
            <a class="rounded-circle hvr-fade @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset text-center align-self-center" style="width:2.7em;height:2.7em;cursor: pointer;">
                {{-- <i class="fa fa-cart-plus align-middle pt-1" title="Consulter Panier" style="font-size:1.8em" aria-hidden="true"></i> --}}
                <i class="fa fa-shopping-bag align-middle pt-1 " title="Consulter Panier" style="font-size:1.8em" aria-hidden="true"></i>
            </a>
            
        </div>
        {{-- <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </form> --}}
    </div>
</nav>

@isset($transparent)
    @if($transparent == false)
        <!-- search-bar -->
        <div class="container-fluid mb-4 mt-2">
            <div class="input-group">
                <div class="input-group-append">
                    <button class="btn" type="button" style="border-radius: 1rem 0rem 0rem 1rem;background-color: #eee">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
                <input type="text" class="form-control border-0" style="border-radius: 0rem 1rem 1rem 0rem;background-color: #eee;outline-width: 0;" placeholder="Recherche">
                
            </div>
        </div>    
    @endif
@endisset


@push('js')
    <script>
        window.onscroll = () => {
            const nav = document.querySelector('#navbar');
            if(this.scrollY <= 10) nav.className = ''; else nav.className = 'scroll';};
    </script>
@endpush
