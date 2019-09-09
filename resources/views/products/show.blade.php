@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    {{-- first annotation --}}
    <div class="container-fluid">
        <a href="" class="text-dark">
            <span>Chaises Hautes</span>
        </a>
        <span class="font-weight-bold">></span>
        <a href=""class="text-dark">
            <span>titre Produit</span>
        </a>
    </div>

    <div class="container my-3">
        <productimages-component :images="{{$product->images}}" :product="{{$product}}"></productimages-component>
    </div>
    <div class="container mt-4 mb-2">
        <h2 class="display-4 text-center mb-2 py-3">Produits Similaires</h2>
        <hr class="w-50 py-2">
        <div class="row my-4">
            <div class="col-md-3 col-6">
                <product-component></product-component>
            </div>
            <div class="col-md-3 col-6">
                <product-component></product-component>
            </div>
            <div class="col-md-3 col-6">
                <product-component></product-component>
            </div>
            <div class="col-md-3 col-6">
                <product-component></product-component>
            </div>
        </div>
    </div>
@endsection