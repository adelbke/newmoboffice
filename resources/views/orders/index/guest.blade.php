@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')

    <div class="container-fluid mb-2 text-center">
        <h2 class="display-4 text-center">Panier</h2>
        @guest
            <a href="{{route('login')}}" class="text-info">Se connecter ou créer mon compte</a>
            pour commander plus vite et plus facilement
        @endguest
        <form action="{{route('cart.save')}}" method="post">
            @csrf
            <button type="submit" class="btn btn-primary hvr-fade  d-block mx-auto px-5 my-2">Passer Commande</button>

        </form>
    </div>

    <div class="container my-4">
        <cartitems-component></cartitems-component>
    </div>
    
@endsection