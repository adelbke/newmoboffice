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
                                <h3 class="mb-0">{{ __('Types') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('types.create') }}" class="btn btn-sm btn-primary">{{ __('Ajouter Type') }}</a>

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
                        {{-- @if (session('statusError'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('statusError') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif --}}
                    </div>

                    <div class="table-responsive table-dark table-hover overflow-x">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">{{ __('N°') }}</th>
                                    <th scope="col">{{ __('Nom') }}</th>
                                    <th scope="col">{{ __('Catégorie') }}</th>
                                    <th scope="col">{{ __('Modifier') }}</th>
                                    <th scope="col">{{ __('Supprimer') }}</th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($typeList as $item)
                                    <tr>
                                        <td>{{ $item["id"] }}</td>

                                        <td>
                                            <a>{{ $item["Name"] }}</a>
                                        </td>
                                        <td>
                                            {{ $item["Category"] }}
                                        </td>
                                        <td>
                                                <a class="btn btn-success" href="{{route('types.edit',$item)}}" role="button">Modifier</a>
                                        </td>
                                        <td>
                                            <form action="{{ route('types.destroy',$item) }}" method="post">
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
