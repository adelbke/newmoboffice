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
                                <h3 class="mb-0">{{ __('Commandes') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('products.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Commandes') }}</a>
                                
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

                    <div>
                            <ordersdatatable-component>
                            </ordersdatatable-component>
                    </div>
                </div>
            </div>
        </div>
            
        @include('layouts.footers.auth')
    </div>
@endsection