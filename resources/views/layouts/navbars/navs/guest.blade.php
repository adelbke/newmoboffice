

<nav class="navbar container sticky-top navbar-expand-lg navbar-light @isset($transparent) @if($transparent == true) bg-transparent @else bg-white @endif  @endisset">
    <a class="navbar-brand" href="/">
        <img src="/asset/logo-small.png" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    @push('css')
    <style>
        .nav-link-font{
            font-size: 0.95rem;
        }
        .nav-icon{
        }
        .nav-icon:hover{
            color: white !important;
        }
    </style>
    @endpush
    <div class="collapse navbar-collapse py-2" id="navbarColor03">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item my-3 px-2">
                <a class="nav-link nav-link-font font-weight-bold @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="/">Accueil</a>
            </li>
            <li class="nav-item dropdown my-3 text-dark px-2">
                <a class="nav-link nav-link-font font-weight-bold dropdown-toggle @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;">
                    Produits
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    
                    @foreach ($types as $name => $category)
                    <li>
                        <a href="#" class="dropdown-item dropdown-toggle">{{$name}} </a>
                        <ul class="dropdown-menu">
                            @foreach ($category as $item)
                            <li><a href="{{route('types.show',$item)}} " class="dropdown-item">{{$item->Name}} </a></li>
                            @endforeach
                        </ul>
                    </li>
                    @endforeach
                    
                </ul>
            </li>
            <li class="nav-item my-3 px-2">
                <a class="nav-link nav-link-font px-3 font-weight-bold @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="/contact">Contact</a>
            </li>
            <li class="nav-item my-3 px-2">
                <a class="nav-link nav-link-font px-3 font-weight-bold @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset" href="{{route('about')}} ">À propos</a>
            </li>
            <li class="nav-item dropdown my-3 px-2">
                <div class="dropdown open">
                    <button class="btn btn-secondary rounded text-light font-weight-bold dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                                Catalogue
                            </button>
                    <div class="dropdown-menu" aria-labelledby="triggerId">
                        <button class="dropdown-item" onclick="window.location.href = '/catalogue';">Voir Nôtre Catalogue</button>
                        <button class="dropdown-item" href="/storage/cata pdfffffffff-4.pdf">Télècharger nôtre Catalogue</button>
                    </div>
                </div>
                
            </li>
            <li class="nav-item   text-dark    my-3 pl-3"><i class="fa fas fa-headset fa-2x"></i> <a href="tel:{{ config('app.phone') }}" class="h5 font-weight-bold ml-2" style="color: inherit;">{{ config('app.phone') }}</a></li>
            
        </ul>
        <div class="d-inline my-2 my-lg-0 mx-lg-2">
            @guest
            <a class="rounded-circle @isset($transparent) @if($transparent == true) text-light @else text-dark @endif  @endisset hvr-fade p-1 text-center " href="/login" style="cursor: pointer;">
                <i class="fa fas fa-user fa-2x align-middle mx-1 nav-icon" title="Accéder à mon Compte" aria-hidden="true"></i>
            </a>
            @endguest
            
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
<div class="container mb-4 mt-2">
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
