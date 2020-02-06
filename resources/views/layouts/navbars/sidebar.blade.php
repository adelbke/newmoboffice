<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Brand -->
        <a class="navbar-brand pt-0" href="/">
            {{-- <img src="{{ asset('argon') }}/img/brand/blue.png" class="navbar-brand-img" alt="..."> --}}
            <h2>{{ ("NewMobOffice")}}</h2>
        </a>
        <!-- User -->
        <ul class="nav align-items-center d-md-none">
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="media align-items-center flex-column">
                        <span class="avatar avatar-sm rounded-circle">
                            <img alt="Image placeholder" src="{{ asset('argon') }}/img/theme/user-image-.png">
                        </span>
                        <span class="mb-0 text-sm  font-weight-bold">{{ auth()->user()->name }}

                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                    <div class=" dropdown-header noti-title">
                        <h6 class="text-overflow m-0">{{ __('Welcome!') }}</h6>
                    </div>
                    <a href="{{ route('profile.edit') }}" class="dropdown-item">
                        <i class="ni ni-single-02"></i>
                        <span>{{ __('Mon Profil') }}</span>
                    </a>
                    @if (auth()->user()->admin->role== "SuperAdmin")
                        <a href="{{ route('user.index') }}" class="dropdown-item">
                            <i class="ni ni-settings-gear-65"></i>
                            <span>{{ __('Gérer Admins') }}</span>
                        </a>                        
                    @endif
                    {{-- <a href="#" class="dropdown-item">
                        <i class="ni ni-calendar-grid-58"></i>
                        <span>{{ __('Activity') }}</span>
                    </a>
                    <a href="#" class="dropdown-item">
                        <i class="ni ni-support-16"></i>
                        <span>{{ __('Support') }}</span>
                    </a> --}}
                    <div class="dropdown-divider"></div>
                    <a href="{{ route('logout') }}" class="dropdown-item" onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();">
                        <i class="ni ni-user-run"></i>
                        <span>{{ __('Logout') }}</span>
                    </a>
                </div>
            </li>
        </ul>
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
            <!-- Collapse header -->
            <div class="navbar-collapse-header d-md-none">
                <div class="row">
                    <div class="col-6 collapse-brand">
                        <a href="{{ route('home') }}">
                            <img src="{{ asset('argon') }}/img/brand/blue.png">
                        </a>
                    </div>
                    <div class="col-6 collapse-close">
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                </div>
            </div>
            <!-- Form -->
            <form class="mt-4 mb-3 d-md-none">
                <div class="input-group input-group-rounded input-group-merge">
                    <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="{{ __('Search') }}" aria-label="Search">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-search"></span>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Navigation -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('home') }}">
                        <i class="ni ni-tv-2 text-primary"></i> {{ __('Dashboard') }}
                    </a>
                </li>
                @if (auth()->user()->admin->role== "SuperAdmin")
                <li class="nav-item">
                        <a class="nav-link active" href="#navbar-examples" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="navbar-examples">
                            {{-- <i class="fab fa-laravel" style="color: #f4645f;"></i> --}}
                            <i class="fa fa-user text-primary" aria-hidden="true"></i>
                            <span class="nav-link-text" style="color: #f4645f;">{{ __('Options Admins') }}</span>
                        </a>
    
                        <div class="collapse show" id="navbar-examples">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('profile.edit') }}">
                                        <i class="fa fa-user-circle" aria-hidden="true"></i>
                                        {{ __('Mon Profil') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('user.index') }}">
                                        <i class="fa fa-object-group" aria-hidden="true"></i>
                                        {{ __('Gérer Admins') }}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('user.create') }}">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        {{ __('Ajouter Admin') }}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('profile.edit') }}">
                            <i class="fa fa-user-circle" aria-hidden="true"></i>
                            {{ __('Profil Utilisateur') }}
                        </a>
                    </li> 
                @endif
            

                
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="#collapse3" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse3">
                        <i class="fas fa-box-open text-primary"></i>
                        <span class="nav-link-text" style="color: #f4645f;">{{ __('Commandes') }}</span>
                    </a>
                    <div class="collapse show" id="collapse2">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('orders.index') }}">
                                        <i class="fas fa fa-list"></i>
                                        {{ __('Liste Commandes') }}

                                    </a>
                                </li>
                            </ul>
                        </div>
    
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#collapse2" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse2">
                        <i class="fas fa-box-open text-primary"></i>
                        <span class="nav-link-text" style="color: #f4645f;">{{ __('Produits') }}</span>
                    </a>

                    <div class="collapse show" id="collapse2">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('products.create') }}">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    {{ __('Ajouter Produit') }}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('products.index') }}">
                                    <i class="fa fa-object-group" aria-hidden="true"></i>
                                    {{ __('Gérer Produits') }}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('types.index')}}" class="nav-link">
                                    <i class="far fa-list-alt"></i>
                                {{ __('Sous Catégories')}}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('colors.index')}}" class="nav-link">
                                    <i class="far fa-list-alt"></i>
                                {{ __('Couleurs')}}
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('images.index') }}">
                        <i class="fas fa fa-image"></i>
                        {{ __('Images') }}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#collapse3" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse3">
                        {{-- <i class="fas fa-box-open text-primary"></i> --}}
                        <i class="fas fa-store    text-primary"></i>
                        <span class="nav-link-text" style="color: #f4645f;">{{ __('Revendeurs') }}</span>
                    </a>

                    <div class="collapse show" id="collapse3">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('retailers.create') }}">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    {{ __('Ajouter Revendeur') }}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('retailers.index') }}">
                                    <i class="fa fa-object-group" aria-hidden="true"></i>
                                    {{ __('Gérer Revendeurs') }}
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#collapse4" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapse3">
                        <i class="fas fa-image text-primary"></i>
                        <span class="nav-link-text" style="color: #f4645f;">{{ __('Slides') }}</span>
                    </a>

                    <div class="collapse show" id="collapse3">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('sliders.create') }}">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    {{ __('Ajouter Slides') }}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('sliders.index') }}">
                                    <i class="fa fa-object-group" aria-hidden="true"></i>
                                    {{ __('Gérer Slides') }}
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            
            
        </div>
    </div>
</nav>