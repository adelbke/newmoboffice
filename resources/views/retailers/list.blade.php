@extends('layouts.app', ['title' => __('User Management')])

@section('content')
@include('layouts.headers.cards')

<div class="container-fluid mt--7">
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-header border-0">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <h3 class="mb-0">{{ __('Revendeurs') }}</h3>
                        </div>
                        <div class="col-4 text-right">
                            <a href="{{ route('user.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter un revendeur') }}</a>
                            
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
                
                <div class="table-responsive">
                    <table class="table align-items-center table-flush">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">{{ __('Nom') }}</th>
                                <th scope="col">{{ __('Email') }}</th>
                                <th scope="col">{{ __('Date Création') }}</th>
                                <th scope="col">{{__('addresse')}}</th>
                                <th scope="col">{{__('Téléphone')}}</th>
                                <th scope="col">{{__('N° Registre De Commerce')}}</th>
                                <th scope="col">{{__('Validé')}}</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($retailers as $retailer)
                            <tr>
                                {{-- Name --}}
                                <td>
                                    {{$retailer->name}}
                                </td>
                                {{-- Mail --}}
                                <td>
                                    <a href="mailto:{{$retailer->email}}">{{$retailer->email}}</a>
                                </td>
                                {{-- Created_at --}}
                                <td>
                                    {{ $retailer->created_at }}
                                </td>
                                {{-- Address --}}
                                <td>
                                    @if ($retailer->address == '')
                                    Null
                                    @else
                                    {{$retailer->address}}                                                
                                    @endif
                                </td>
                                {{-- Phone --}}
                                <td>
                                    {{$retailer->phone}}
                                </td>
                                {{-- Registre Commerce --}}
                                <td>
                                    {{$retailer->registreCommerce}}
                                </td>
                                {{-- Validé --}}
                                @if ($retailer->valide)
                                <td class="text-success">
                                    {{__('oui')}}
                                </td>
                                @else
                                <td class="text-danger">
                                    {{__('non')}}
                                </td>
                                @endif
                                
                                <td>
                                    @if ($retailer->valide)
                                <button type="button" class="btn btn-danger" data-toggle="modal" aria-pressed="false" data-target="#disableModal" data-name="{{$retailer->name}}" autocomplete="off">Désactiver</button>
                                    @else
                                <button type="button" class="btn btn-danger" data-toggle="modal" aria-pressed="false" autocomplete="off" data-target="#enableModal" data-name="{{$retailer->name}}">Activer</button>
                                    
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="card-footer py-4">
                    <nav class="d-flex justify-content-end" aria-label="...">
                        {{ $retailers->links() }}
                    </nav>
                </div>
                <div class="modal fade" id="enableModal" tabindex="-1" role="dialog" aria-labelledby="enableModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="enableModalLabel">Confirmation d'activation de Compte</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="enableModalBody">
                                Vous êtes sur de vouloir Activer le Compte de 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <button type="button" class="btn btn-danger">Activer</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('js')
        <script>
            $('#enableModal').on('show.bs.modal',function (e){
                var name = $(e.relatedTarget).data('name');
                $('#enableModalBody').append(name);
            });
        </script>
    @endpush
    @include('layouts.footers.auth')
</div>
@endsection