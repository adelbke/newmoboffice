@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    {{-- first annotation --}}
    <div class="container-fluid">
        <a class="text-dark">
            <span>{{$product->type->Category}} </span>
        </a>

        <span class="font-weight-bold">></span>
        <a href="{{route('types.show',$product->type)}}"class="text-dark">
            <span>{{$product->type->Name}}</span>
        </a>

        <span class="font-weight-bold">></span>
        <a href="{{route('products.show',$product)}}"class="text-dark">
            <span>{{$product->name}}</span>
        </a>
    </div>

    <div class="container my-3">
        <productimages-component :images="{{$product->images}}" :product="{{$product}}"></productimages-component>
    </div>
    <div class="container mt-4 mb-2">
        <h2 class="display-4 text-center mb-2 py-3">Produits Similaires</h2>
        <hr class="w-50 py-2">
        <div class="row my-4">
            @foreach ($similar as $item)
                <div class="col-md-3 col-6">
                        <product-component
                        :id="{{$item->id}}"
                        path="{{$item->images->first()['path']}}"                    
                        name="{{$item->name}}"
                        note="{{$item->note}}"
                        :price="{{$item->clientPrice}}"
                        description="{{$item->description}}"
                        ></product-component>
                </div>                 
            @endforeach
        </div>
    </div>
@endsection
