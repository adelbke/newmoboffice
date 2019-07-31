{{-- @extends('layouts.app', ['class' => 'bg-default'])

@section('content')
    <div class="header bg-gradient-primary py-7 py-lg-8">
        <div class="container">
            <div class="header-body text-center mt-7 mb-7">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-6">
                        <h1 class="text-white">{{ __('Welcome to Argon Dashboard FREE Laravel Live Preview.') }}</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="separator separator-bottom separator-skew zindex-100">
            <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
                <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
            </svg>
        </div>
    </div>

    <div class="container mt--10 pb-5"></div>
@endsection --}}

@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    <!-- Heading -->
    <div class="container mt-3 text-center">
        <h2 class="display-4 text-primary">Slogan</h2>
    </div>
    
    <!-- Image Slider -->
    <div class="container my-5 mx-auto bg-white">
        <div id="main" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#main" data-slide-to="0" class="active"></li>
                <li data-target="#main" data-slide-to="1"></li>
                <li data-target="#main" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active text-center" >
                    <img src="images/furniture-unsplash-5.jpg" class="w-100 img-fluid mx-auto" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-white"style="mix-blend-mode: difference;">
                        <h3 class="hvr-grow d-block">Title 1</h3>
                        <p>Description</p>
                    </div>
                </div>
                <div class="carousel-item text-center" >
                    <img src="images/furniture-unsplash-3.jpg" class="w-100 img-fluid mx-auto" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block text-white"style="mix-blend-mode: difference;">
                        <h3 class="hvr-grow d-block">Title</h3>
                        <p>Description</p>
                    </div>
                </div>
                <div class="carousel-item text-center" >
                    <img src="images/furniture-unsplash-4.jpg" class="w-100 img-fluid mx-auto" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block text-white"style="mix-blend-mode: difference;">
                        <h3 class="hvr-grow d-block">Title</h3>
                        <p>Description</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#main" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#main" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!-- Products Selection -->
    <div class="container-fluid my-4">
        <div class="row px-5 justify-content-center">
            <!-- first -->
            <div class="col-md-3 col-6 rounded p-2">
                <product-component></product-component>
            </div>

            <!-- Second -->
            <div class="col-md-3 col-6 rounded p-2">
                <product-component></product-component>
            </div>

            <!-- Third -->
            <div class="col-md-3 col-6 rounded p-2">
                <product-component></product-component>
            </div>

            <!-- Fourth -->
            <div class="col-md-3 col-6 rounded p-2">
                <product-component></product-component>
            </div>
           
        </div>
    </div>

    <!-- Products Link -->
    <div class="container text-center mb-4">
            <a name="" id="" class="btn btn-primary border border-primary hvr-fade my-4 hvr-icon-forward" href="#" role="button">
                Voir tous les Produits
                <i class="fa fas fa-chevron-right hvr-icon"></i>
            </a>
    </div>

    <!-- Collections -->
    <div class="container-fluid px-5 mb-5">
        <div class="row my-3">
            {{-- Collection 1 --}}
            <div class="col-md-6 col-12 text-center d-block" >
                <collection-component></collection-component>
            </div>

            {{-- Collection 2 --}}
            
            <div class="col-md-6 col-12 text-center d-block">
                <collection-component></collection-component>        
            </div>
            
        </div>
        <hr>
        <div class="row mt-5 mb-3">

            {{-- Collection 3 --}}
            <div class="col-md-6 col-12 text-center d-block" >
                <collection-component></collection-component>
            </div>

            {{-- Collection 4 --}}
            <div class="col-md-6 col-12 text-center d-block" >
                <collection-component></collection-component>
            </div>
            
        </div>
    </div>

    <!-- Cards -->
    <div class="container mb-3">
        <div class="row">
            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash.jpg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                          <h5 class="card-title mb-0">Titre</h5>
                          <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>             
            </div>

            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash-2.jpeg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>    
            </div>
            
            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash.jpg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash-2.jpeg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>        
            </div>
            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash.jpg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash-2.jpeg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>
        
            </div>
                
            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash.jpg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3 col-6 pr-2 pb-2 hvr-grow">
                <a href="" class="text-dark">
                    <div class="card border-0 shadow">
                        <img src="images/furniture-unsplash-2.jpeg" class="card-img-top" alt="...">
                        <div class="card-body text-left">
                            <h5 class="card-title mb-0">Titre</h5>
                            <div class="card-text text-black-50">Petite Description</div>
                        </div>
                    </div>
                </a>
            </div>
        

        </div>
    </div>

    <div class="container">
    </div>
@endsection