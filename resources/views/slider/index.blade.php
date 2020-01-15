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
                                <h3 class="mb-0">{{ __('Sliders') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('sliders.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Slider') }}</a>
                                
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            @foreach ($list as $item)
                                <div class="col-md-4 col-12">
                                    <div class="dropdown">
                                            <a class="" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <img src="{{$item->image->path}}" alt="{{$item->id}}" class="img-fluid">
                                            </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">                                            
                                                <form action="{{ route('sliders.destroy', $item) }}" method="post">
                                                    @csrf
                                                    @method('delete')
                                                    
                                                    <button type="submit" class="dropdown-item">
                                                        {{ __('Supprimer') }}
                                                    </button>
                                                </form>    
                                        </div>
                                    </div>
                                </div>                            
                            @endforeach
                        </div>
    
                    </div>
                </div>
                
            </div>
        </div>
    </div>
@endsection