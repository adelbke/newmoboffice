@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')
    <div class="container-fluid">
        <h2 class="h4 text-center">
            @if ($search == "")
                Tous nos Produits
                @else
                "{{$search}}"
            @endif
        </h2>
    </div>
    {{-- <div class="container-fluid">
        <div class="row">
            <div class="col-2 col-md-2 col-lg-2">
                Résultat: {{$list->count()}}
            </div>
            <div class="offset-8 offset-md-8 offset-lg-8 col-2 col-md-2 col-lg-2">
                <form action="/search" method="get">
                    <div class="form-group">
                        <select class="custom-select" name="sort"  id="sort-input" type="submit">
                            <option selected>Trier par: </option>
                            <option value="test"></option>
                            <option value=""></option>
                            <option value=""></option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </div> --}}
    <searchpage-component
    :listcount="{{$list->count()}}"
    search="{{$search}}"
    ></searchpage-component>
    <div class="container my-2 mx-2">
        <div class="row">
            @foreach ($list as $product)
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
@endsection
