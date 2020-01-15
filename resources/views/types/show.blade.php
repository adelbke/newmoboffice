@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    <div class="container-fluid mb-3">
        <h2 class="text-center">{{$type->Name}}</h2>
    </div>
    {{-- <searchpage-component products={{$productsList}} :type="{{$type}}" :colors="{{$colors}}" ></searchpage-component> --}}
    <div class="container-fluid">
        <div class="row">
                <div class="col-2 col-md-2 col-lg-2">
                    <span class="font-weight-bold">
                        Résultats: {{$products->count()}}
                    </span>
                </div>
        </div>
    </div>
    <div class="container-fluid mx-2">
        <div class="row mt-4">
            @foreach ($products as $product)
                <div class="col-6 col-md-3 col-lg-3">
                        <product-component
                        :id="{{$product->id}}"
                        path="{{$product->images->first()['path']}}"                    
                        name="{{$product->name}}"
                        note="{{$product->note}}"
                        :price="{{$product->clientPrice}}"
                        description="{{$product->description}}"
                        ></product-component>
                </div>            
            @endforeach
        </div>
    </div>

    <div class="container-fluid">

        <div class="card-footer py-4">
            <nav class="d-flex justify-content-center" aria-label="...">
                {{ $products->links() }}
            </nav>
        </div>
    </div>
@endsection
