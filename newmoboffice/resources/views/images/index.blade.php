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
                                <h3 class="mb-0">{{ __('Images') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('colors.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Image') }}</a>
                                
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
                        @if (session('statusError'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('statusError') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                    </div>

                    <div class="container-fluid">
                        <div class="row">
                            @foreach ($images as $image)
                                <div class="col-6 col-md-3 my-2 col-lg-4">
                                    <button type="button" class="btn btn-white">
                                        <img src="{{$image->path}}" title="{{$image->id}}" alt="{{$image->id}}" class="img-fluid">
                                    </button>
                                </div>
                            @endforeach
                        </div>
                        <div class="card-footer py-4">
                            <nav class="d-flex justify-content-center" aria-label="...">
                                {{ $images->links() }}
                            </nav>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
            
        @include('layouts.footers.auth')
    </div>
@endsection