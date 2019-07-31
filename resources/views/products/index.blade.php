@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('layouts.headers.cards')

    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col px-0">
                <div class="card shadow">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Produits') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('products.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Produit') }}</a>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-12">
                        @if (session('status'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('status') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                    </div>

                    <div class="table-responsive table-striped table-hover overflow-x">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">{{ __('Nom') }}</th>
                                    <th scope="col">{{ __('Catégorie') }}</th>
                                    <th scope="col">{{ __('Date Création') }}</th>
                                    <th scope="col">{{__('Visiteurs')}}</th>
                                    <th scope="col">{{__('prix Client')}}</th>
                                    <th scope="col">{{__('prix Revendeur')}}</th>
                                    <th scope="col">{{__('Description')}}</th>
                                    <th scope="col">{{__('Modifier')}}</th>
                                    <th scope="col">{{__('Suppression')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr>
                                        <td>{{ $product->name }}</td>
                                        
                                        <td>
                                            <a>{{ $product->category }}</a>
                                        </td>
                                        
                                        <td>{{ $product->created_at->format('d/m/Y H:i') }}</td>
                                        
                                        <td class="{{ $product->visitors > 100?'text-success':'text-dark'}}">
                                            {{ $product->visitors}}
                                        </td>
                                        <td>
                                            {{number_format($product->clientPrice,0,'','.')}} da
                                        </td>

                                        <td>
                                            {{number_format($product->retailerPrice,0,'','.')}} da
                                        </td>
                                        <td class="text-wrap">
                                            {{$product->description}}
                                        </td>
                                        <td>
                                            <a class="text-info" href="/products/{{$product->id}}/edit">Modifier</a>
                                        </td>
                                        <td>
                                            <form action="{{ route('products.destroy',$product) }}" method="post">
                                                @csrf
                                                @method('delete')
                                            <button class="text-danger p-0 btn btn-link" type="submit">Supprimer</button>
                                            </form>
                                        {{-- <a href="" ></a> --}}
                                        </td>
                                        
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer py-4">
                        <nav class="d-flex justify-content-center" aria-label="...">
                            {{ $products->links() }}
                        </nav>
                    </div>
                </div>
            </div>
        </div>
            
        @include('layouts.footers.auth')
    </div>
@endsection