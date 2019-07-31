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
        <div class="row">
            <div class="col-md-2 order-last order-md-first px-0">
                <ul style="list-style-type:none;" class="row p-0">
                    <li class="col-6 col-md-12">
                        <img src="/images/hair-salon-couch.jpg" class="img-fluid hvr-grow">
                    </li>
                    <li class="col-6 col-md-12">
                        <img src="/images/hair-salon-couch.jpg" class="img-fluid hvr-grow">
                    </li>
                    <li class="col-6 col-md-12">
                        <img src="/images/hair-salon-couch.jpg" class="img-fluid hvr-grow">                        
                    </li>
                </ul>
            </div>
            <div class="col-md-6 text-center order-first img-container" style="height:500px;">
                    <largeproduct-component></largeproduct-component>
            </div>

            <div class="col-md-4 order-md-last pt-4">
                <productdescription-component></productdescription-component>
            </div>
        </div>
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