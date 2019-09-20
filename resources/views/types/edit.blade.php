@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('users.partials.header', ['title' => __('Ajouter Sous Catégorie')])   

    <div class="container-fluid mt--7">
        <div>
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Ajout Sous Catégorie') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('types.index')}}" class="btn btn-sm btn-primary">{{ __('liste des Sous Catégories') }}</a>
                            </div>
                        </div>
                    </div>


                    @if(session('status'))
                        <div class="alert alert-success font-weight-bold"> {{session('status')}} </div>
                    @endif
                    @if ($errors->any())
        {{ implode('', $errors->all('<div>:message</div>')) }}
@endif
                    <div class="card-body">
                        {{-- {{ Form::open(array('url'=>'/product')) }} --}}
                        <form action="{{route('types.update',$type)}} " method="post">
                            @csrf
                            @method('PATCH')

                            
                            <h6 class="heading-small text-muted mb-4">{{ __('Informations Sous Catégorie') }}</h6>
                            <div class="pl-lg-4">
                                <div class="form-group @error('Name') has-danger @enderror">
                                    <label class="form-control-label" for="input-Name">{{ __('Nom') }}</label>
                                    <input type="text" name="Name" id="input-Name" class="form-control text-dark form-control-alternative text-dark @error('Name') is-invalid @enderror" placeholder="{{ __('Nom') }}" value="{{$type->Name}}" required autofocus>

                                    @if ($errors->has('Name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('Name') }}</strong>
                                        </span>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <label for="Category" class="form-control-label">Catégorie</label>
                                    <select name="Category" class="form-control text-dark" required id="Category">
                                            <option value="Meuble de Bureau">Meuble de Bureau</option>
                                            <option value="Mobilier de Réunion">Mobilier de Réunion</option>
                                            <option value="Mobilier Accueil">Mobilier Accueil</option>
                                            <option value="Mobilier de Conférence">Mobilier de Conférence</option>
                                            <option value="Bibliothèque & Mobilier pour écoles et crèches">Bibliothèque & Mobilier pour écoles et crèches</option>
                                            <option value="Environnement & Accéssoires">Environnement & Accéssoires</option>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">{{ __('Modifier Sous Catégorie') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        @include('layouts.footers.auth')
    </div>
@endsection