@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('users.partials.header', ['title' => __('Ajouter Couleur')])   

    <div class="container-fluid mt--7">
        <div>
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Ajout Couleur') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('colors.index') }}" class="btn btn-sm btn-primary">{{ __('liste des Couleurs') }}</a>
                            </div>
                        </div>
                    </div>


                    @if(session('status'))
                        <div class="alert alert-success font-weight-bold"> {{session('status')}} </div>
                    @endif
                    <div class="card-body">
                        {{-- {{ Form::open(array('url'=>'/product')) }} --}}
                        <form action="{{route('colors.update',$color)}} " method="post">
                            @csrf
                            @method('PATCH')

                            
                            <h6 class="heading-small text-muted mb-4">{{ __('Informations Sous Catégorie') }}</h6>
                            <div class="pl-lg-4">
                                <div class="form-group @error('name') has-danger @enderror">
                                    <label class="form-control-label" for="input-name">{{ __('Nom') }}</label>
                                    <input type="text" name="name" id="input-name" class="form-control text-dark form-control-alternative text-dark @error('name') is-invalid @enderror" placeholder="{{ __('Nom') }}" value="{{$color->name}} " required autofocus>

                                    @if ($errors->has('name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <label for="input-reference" class="form-control-label">Référence</label>
                                    <input type="text" name="reference" id="input-reference" placeholder="{{ __('Référence') }}" value="{{$color->reference}}" class="form-control @error('reference') is-invalid @enderror text-dark form-control-alternative">


                                    @if ($errors->has('reference'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('reference') }}</strong>
                                        </span>
                                    @endif
                                </div>

                                {{-- Image Card --}}
                                <div class="form-group @error('image') has-danger @enderror">
                                        <label class="form-control-label" for="">Image</label>
                                        <div class="custom-file">
                                        <input type="file" class="custom-file-input form-control @error('image') is-invalid @enderror" id="input-image" name="image" onchange="previewCardImages()" >
                                            <label class="custom-file-label" for="input-image">Choisissez une image</label>
                                        </div>
                                        @error('image')
                                            <strong>{{ $errors->first('image') }}</strong>
                                        @enderror
                                    </div>
                                    <div id="imagePreview" class="mb-3">
                                    </div>
                                    @push('js')
                                        <script>
                                            function previewCardImages(){
                                                    $('#imagePreview').append('<div class="col-6 col-md-4 col-lg-2"><img src="'+URL.createObjectURL(event.target.files[0])+'" alt="" class="img-fluid"></div>');
                                            }
                                        </script> 
                                    @endpush
                                

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