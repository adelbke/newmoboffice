

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
                    
                    @foreach ($types as $name => $category)
                        <li>
                            <a href="" class="dropdown-item dropdown-toggle">{{$name}} </a>
                            <ul class="dropdown-menu">
                                @foreach ($category as $item)
                                    <li><a href="{{route('types.show',$item)}} " class="dropdown-item">{{$item->Name}} </a></li>
                                @endforeach
                            </ul>
                        </li>
                    @endforeach

                    {{-- Categories --}}


                    {{-- <li>
                        <a class="dropdown-item dropdown-toggle" href="#">Meuble de Bureau</a>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="dropdown-item">Armoires</a></li>
                            <li><a href="#" class="dropdown-item">Bureau de direction</a></li>
                            <li><a href="#" class="dropdown-item">Bureau Opérateur</a></li>
                            <li><a href="#" class="dropdown-item">Workstation</a></li>
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
                    </li> --}}

                </ul>
            </li>
            {{-- <li class="nav-item my-3 font-weight-bold">
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="#">Collections</a>
            </li> --}}
            <li class="nav-item my-3 font-weight-bold">
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="">Contact</a>
            </li>
            <li class="nav-item my-3 font-weight-bold">
                <a class="nav-link @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="{{route('about')}} ">À propos</a>
            </li>
        </ul>
        <div class="d-inline my-2 my-lg-0 mx-lg-2">
            <a class="rounded-circle @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset hvr-fade p-1 text-center" href="/login" style="cursor: pointer;">
                <i class="fa fas fa-user fa-2x align-middle mx-1" title="Accéder à mon Compte" aria-hidden="true"></i>
            </a>

            {{-- Component --}}
            <cart-component></cart-component>

            @auth
                <ordersbutton-component></ordersbutton-component>
            @endauth
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
            <form action="{{route('search')}}" method="get">
                <div class="input-group">
                    <div class="input-group-append">
                        <button class="btn" type="button" type="submit" name="submit" style="border-radius: 1rem 0rem 0rem 1rem;background-color: #eee">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                    <input type="text" class="form-control border-0" style="border-radius: 0rem 1rem 1rem 0rem;background-color: #eee;outline-width: 0;" name="search" placeholder="Recherche">
                    
                </div>
            </form>
            
        </div>    
    @endif
@endisset


@push('js')
    <script>
        // window.onscroll = () => {
        //     const nav = document.querySelector('#navbar');
        //     if(this.scrollY <= 10) nav.className = ''; else nav.className = 'scroll';};

        $(document).ready(function(){$(".dropdown-menu a.dropdown-toggle").on("click",function(o){var s=$(this);s.toggleClass("active-dropdown");var n=$(this).offsetParent(".dropdown-menu");$(this).next().hasClass("show")||$(this).parents(".dropdown-menu").first().find(".show").removeClass("show");var e=$(this).next(".dropdown-menu");return e.toggleClass("show"),$(this).parent("li").toggleClass("show"),$(this).parents("li.nav-item.dropdown.show").on("hidden.bs.dropdown",function(o){$(".dropdown-menu .show").removeClass("show"),s.removeClass("active-dropdown")}),n.parent().hasClass("navbar-nav")||s.next().css({top:s[0].offsetTop,left:n.outerWidth()-4}),!1})});
    </script>
@endpush
