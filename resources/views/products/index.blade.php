@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('layouts.headers.cards')

    <div class="container p-0 mt--7">
        <div class="row p-3">
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

                    <div class="table-responsive table-dark table-hover">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-dark">
                                <tr>
                                    <th class="text-white font-weight-bold">{{ __('Nom') }}</th>
                                    
                                    <th class="text-white font-weight-bold">{{ __('Catégorie') }}</th>
                                    <th class="text-white font-weight-bold">{{ __('Date Création') }}</th>
                                    <th class="text-white font-weight-bold">{{__('Visiteurs')}}</th>
                                    <th class="text-white font-weight-bold">{{__('prix Client')}}</th>
                                    <th class="text-white font-weight-bold">{{__('prix Revendeur')}}</th>
                                    <th class="text-white font-weight-bold">{{__('Couleurs')}}</th>
                                    <th class="text-white font-weight-bold">{{__('Description')}}</th>
                                    <th class="text-white font-weight-bold">{{__('Modifier')}}</th>
                                    <th class="text-white font-weight-bold">{{__('Suppression')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr>
                                        <th scope="row">
                                            {{ $product->name }}
                                        </th>
                                        
                                        <td>
                                            <a>{{ $product->type['Name'] }}</a>
                                        </td>
                                        
                                        <td>
                                            {{ $product->created_at }}
                                        </td>
                                        
                                        <td class="{{ $product->visitors > 100?'text-success':'text-light'}}">
                                            {{ $product->visitors}}
                                        </td>
                                        <td>
                                            {{number_format($product->clientPrice,0,'','.')}} da
                                        </td>

                                        <td>
                                            {{number_format($product->retailerPrice,0,'','.')}} da
                                        </td>
                                        <td>
                                            <div class="avatar-group">
                                                @foreach ($product->colors as $color)
                                                <a href="#!" class="avatar rounded-circle">
                                                    <img alt="Image placeholder" src="{{$color->image->path}}">
                                                </a>
                                                @endforeach
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                {{ $product->description}}
                                            </div>
                                        </td>
                                        <td>
                                            <a class="text-info font-weight-bold" href="/products/{{$product->id}}/edit">Modifier</a>
                                        </td>
                                        <td>
                                            <form action="{{ route('products.destroy',$product->id) }}" method="post">
                                                @csrf
                                                @method('delete')
                                            <button class="text-danger p-0 btn btn-link" type="submit">Supprimer</button>
                                            </form>
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