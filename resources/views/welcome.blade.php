@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    <!-- Heading -->
    <div class="container mt-3 text-center">
        <h2 class="h1 text-secondary" style="font-family:'Almarai';">رحيق الإتقان و الجودة</h2>
        <h2 class="h2 text-secondary font-italic">When Quality and Performance Count</h2>
    </div>
    <div class="container shadow text-dark my-4 bg-light pt-2 pb-3 px-5" style="border-radius: 1rem;box-shadow: 0.2rem 0.2rem 0.2rem 0.2rem rgba(0,0,0,0.15);"> 
        <h4 class="h3 font-weight-bold font-italic text-center">À PROPOS DE NOUS</h4>
        <p class="text-center h5 font-italic">Fondée en 2018, la Société <strong>NEW MOB OFFICE</strong> se fait fort pour servir ses clients et partenaires à travers toute L’ALGERIE. <br>La spécification de nos articles et la <span class="font-weight-bold">garantie</span> du <span class="font-weight-bold">rapport qualité prix</span> sont nos <span class="font-weight-bold">principes</span> de travaille.</p>
        <p class="text-center h5 font-italic">"Notre savoir-faire et nos compétences reposent sur des personnels expérimentés et motivés"</p>
        <p class=" font-italic text-center h5"><strong>New Mob Office</strong>. Du mobilier pour tous les goûts. Notre particularité, c'est de réunir dans une seule entreprise le travail du concepteur et celui du fabriquant. <strong>New Mob Office</strong> Vous propose une large gamme de produits sur mesure et en série.</p>
    </div>
    <!-- Image Slider -->        
    <carousel :slides="{{$sliders}}"></carousel>

    <!-- Products Selection -->
    <div class="container-fluid my-4">
        <div class="row justify-content-center">
            <!-- first -->
            @foreach ($products as $product)
                <div class="col-md-4 col-12 p-2">
                    <product-component
                    :id="{{$product->id}}"
                    path="{{$product->images->first()["path"]}}"                    
                    name="{{$product->name}}"
                    note="{{$product->note}}"
                    :price="{{$product->clientPrice}}"
                    description="{{$product->description}}"
                    new={{$product->new== true? "true" : "false"}}
                    ></product-component>
                </div>
            @endforeach
           
        </div>
    </div>

    <!-- Products Link -->
    <div class="container text-center mb-4">
            <a class="btn font-weight-bold border border-primary hvr-fade my-4 hvr-icon-forward" href="/search" role="button">
                Voir tous les Produits
                <i class="fa fas fa-chevron-right hvr-icon"></i>
            </a>
    </div>

    <!-- Collections -->
    <div class="container mb-5">
        <h2 class="h2 text-center font-italic">TOUT LE <span class="font-weight-bold">MOBILIER</span> POUR VÔTRE BUREAU !</h2>
        <div class="row mt-5 mb-3">
            @foreach ($reunion as $item)
                {{-- Collection 1 --}}
                <div class="col-md-6 col-12 mb-5 text-center d-block" >
                    <collection-component
                    name="{{$item->name}}"
                    image="{{$item->images->first()["path"]}}"
                    description="{{$item->description}}"
                    route="{{route('products.show',$item)}}"
                    ></collection-component>
                </div>
            @endforeach
            {{-- Collection 1 --}}
        </div>
    </div>

    <!-- Cards -->
    <div class="container mb-5">
        <h2 class="h2">Chaises</h2>
        <div class="row">
            @foreach ($accueil as $item)
                <div class="col-md-3 col-12 hvr-grow">
                    <a href="{{route('products.show',$item)}}" class="text-dark ">
                        <div class="card shadow h-100">
                            <img src="{{$item->images->first()['path']}}" class="card-img-top" alt="...">
                            <div class="card-body text-left">
                              <h5 class="card-title mb-0">{{$item->name}}</h5>
                              <div class="card-text font-weight-bold">{!!$item->clientPrice!!} Da</div>
                            </div>
                        </div>
                    </a>             
                </div>
            @endforeach

        </div>
    </div>

@endsection