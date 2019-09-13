@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')

    <div class="container-fluid mb-2 text-center">
        <h2 class="display-4 text-center">Panier</h2>
        @guest
            <a href="{{route('login')}}" class="text-info">Se connecter ou créer mon compte</a>
            pour commander plus vite et plus facilement
        @endguest
        <button type="button" name="" id="" class="btn btn-primary hvr-fade  d-block mx-auto px-5 my-2">Passer Commande</button>
    </div>

    <div class="container my-4">
        <cartitems-component></cartitems-component>
        {{-- <div class="row">
            <div class="col-12-col-md-3 col-lg-3 p-0">
                <img src="/images/hair-salon-couch.jpg" class="img-fluid float-right" alt="">
            </div>
            <div class="col-12 col-md-6 col-lg-6">
                <h4 class="h4">Platsa</h4>
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque reprehenderit, dignissimos libero pariatur, culpa vel iure magni, modi nesciunt autem temporibus ipsa obcaecati repellat tempore in! Dolor quis ab eligendi.</p>
                <quantity-component></quantity-component>

            </div>
            <div class="col-12 col-md-3 col-lg-3">
                <div class="text-right">
                    <h4 class="h4">Prix: 1560</h4>
                    <h5 class="h5">Prix Unité: 520</h5>
                </div>
            </div>
        </div> --}}
    </div>
    
@endsection