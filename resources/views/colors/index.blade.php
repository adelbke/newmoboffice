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
                                <h3 class="mb-0">{{ __('Couleurs') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('colors.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Couleur') }}</a>
                                
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

                    <div class="table-responsive table-dark table-hover overflow-x">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">{{ __('N°') }}</th>
                                    <th scope="col">{{ __('Référence') }}</th>
                                    <th scope="col">{{ __('Nom') }}</th>
                                    <th scope="col">{{ __('Image') }}</th>
                                    <th scope="col">{{ __('Supprimer') }}</th>


                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($colors as $color)
                                    <tr>
                                        <td>{{ $color->id }}</td>
                                        
                                        <td>
                                            <a>{{ $color->reference }}</a>
                                        </td>
                                        <td>
                                            {{$color->name}}
                                        </td>
                                        <td>
                                            <div style="width:100px">
                                                <img src="{{$color->image->path}}" alt="" class="img-fluid">
                                            </div>
                                        </td>
                                        <td>
                                            <form action="{{ route('colors.destroy',$color->id) }}" method="post">
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
                </div>
            </div>
        </div>
            
        @include('layouts.footers.auth')
    </div>
@endsection