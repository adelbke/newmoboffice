@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('users.partials.header', ['title' => __('Ajouter Produit')])   

    <div class="container-fluid mt--7">
        <div>
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Ajout Produit') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('products.index') }}" class="btn btn-sm btn-primary">{{ __('liste des produits') }}</a>
                            </div>
                        </div>
                    </div>


                    @if(session('status'))
                        <div class="alert alert-success font-weight-bold"> {{session('status')}} </div>
                    @endif
                    <div class="card-body">
                        {{-- {{ Form::open(array('url'=>'/product')) }} --}}
                        <form enctype="multipart/form-data" action="/products" method="post">
                            @csrf
                            {{-- @method('') --}}

                            
                            <h6 class="heading-small text-muted mb-4">{{ __('Informations Produit') }}</h6>
                            <div class="pl-lg-4">
                                <div class="form-group @error('name') has-danger @enderror">
                                    <label class="form-control-label" for="input-name">{{ __('Titre') }}</label>
                                    <input type="text" name="name" id="input-name" class="form-control form-control-alternative text-dark @error('name') is-invalid @enderror" placeholder="{{ __('Titre') }}" value="{{old('name')}}" r autofocus>

                                    @if ($errors->has('name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                    @endif
                                </div>


                            <category-form hasError="{{$errors->has('category')}}" adminid="{{auth()->user()->admin->id}}" errormessage="{{$errors->first('category')}}" oldcategory="{{old('category')}}" oldtype="{{old('type')}}"></category-form>

                            <div class="form-group @error('new') has-danger @enderror">
                                <label for="new-input" class="form-control-label">Nouveauté du Produit</label>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="new" id="new-input" value="true" checked>
                                <label class="custom-control-label" for="new-input">Nouveau</label>
                                </div>
                            </div>

                            <div class="form-group @error('colors[]') has-danger @enderror">
                                <label for="colors[]" class="form-control-label">Couleurs disponibles</label>
                                @foreach ($colorList as $item)
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input"  name="colors[]" id="color{{$item->id}}" value="{{$item->id}}">
                                <label class="custom-control-label" for="color{{$item->id}}">{{$item->name}}</label>
                                </div>
                                @endforeach
                            </div>


                            <div class="form-group @error('clientPrice') has-danger @enderror">
                                    <label for="clientPrice" class="form-control-label"> {{__('Prix Client')}} </label>
                                    <input type="number" name="clientPrice" value="{{old('clientPrice')}}" id="clientPrice" class="form-control form-control-alternative text-dark @error('clientPrice') is-invalid @enderror" min="0" max="999999" placeholder="ex:1500">
                                  {{-- <small id="helpId" class="text-muted">Help text</small> --}}
                                    @error('clientPrice')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('clientPrice') }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group @error('retailerPrice') has-danger @enderror">
                                    <label for="retailerPrice" class="form-control-label"> {{__('Prix Revendeur')}} </label>
                                    <input type="number" name="retailerPrice" value="{{old('retailerPrice')}}" id="retailerPrice" class="form-control form-control-alternative text-dark @error('retailerPrice') is-invalid @enderror" min="0" max="999999" placeholder="ex:1500">
                                    {{-- <small id="helpId" class="text-muted">Help text</small> --}}
                                    @error('retailerPrice')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('retailerPrice') }}</strong>
                                        </span>
                                    @enderror
                                </div>



                                <div class="form-group @error('note') has-danger @enderror">
                                    <label class="form-control-label" for="input-note">{{ __('Note') }}</label>
                                    <input type="text" name="note" id="input-note" value="{{old('note')}}" class="form-control form-control-alternative text-dark @error('note') is-invalid @enderror" placeholder="{{ __('Note') }}" value="" r autofocus>

                                    @if ($errors->has('note'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('note') }}</strong>
                                        </span>
                                    @endif
                                </div>


                                <div class="form-group @error('description') has-danger @enderror">
                                    <label for="description" class="form-control-label">Description</label>
                                    <textarea class="form-control form-control-alternative @error('retailerPrice') is-invalid @enderror text-dark"  rows="3" placeholder="Write a large text here ..." name="description">{{old('description')}}</textarea>
                                    @error('description')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                    @enderror
                                </div>



                                {{-- Image Card --}}
                                <div class="form-group @error('imageCard') has-danger @enderror">
                                    <label class="form-control-label" for="">Image Présentation</label>
                                    <div class="custom-file">
                                    <input type="file" class="custom-file-input form-control @error('imageCard') is-invalid @enderror" id="imageCard" name="imageCard" onchange="previewCardImages()" >
                                        <label class="custom-file-label" for="imageCard">Choisissez une image</label>
                                    </div>
                                    <small>l'image est censé être d'une résolution de 210 x 210</small>
                                    @error('imageCard')
                                        <strong>{{ $errors->first('imageCard') }}</strong>
                                    @enderror
                                </div>

                                <div id="imageCardPreview" class="mb-3">
                                </div>

                                @push('js')
                                    <script>
                                        function previewCardImages(){
                                                $('#imageCardPreview').append('<div class="col-6 col-md-4 col-lg-2"><img src="'+URL.createObjectURL(event.target.files[0])+'" alt="" class="img-fluid"></div>');
                                        }
                                    </script> 
                                @endpush


                                {{-- image Slider --}}
                                <div class="form-group @error('imageSlider') has-danger @enderror">
                                    <label class="form-control-label" for="">Image Large (Slider)</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input @error('imageSlider') is-invalid @enderror" id="imageSlider" name="imageSlider" onchange="previewSliderImages()" lang="en">
                                        <label class="custom-file-label" for="imageSlider">Choisissez images</label>
                                    </div>
                                    <small>l'image est censé être d'une résolution de 1280 x 577</small>
                                    @error('imageSlider')
                                        <strong>{{ $errors->first('imageSlider') }}</strong>
                                    @enderror
                                </div>
                                
                                <div id="imageSliderPreview" class="mb-3">
                                </div>
                                @push('js')
                                    <script>
                                        function previewSliderImages(){
                                            $('#imageSliderPreview').append('<div class="col-6 col-md-4 col-lg-2"><img src="'+URL.createObjectURL(event.target.files[0])+'" alt="" class="img-fluid"></div>');
                                        }
                                    </script> 
                                @endpush


                                {{-- Product Image --}}
                                <div class="form-group @error('productImage[]') has-danger @enderror">
                                    <label class="form-control-label" for="">Image du Produit</label>
                                    <div class="custom-file">
                                            <input type="file" class="custom-file-input @error('productImage[]') is-invalid @enderror" id="productImage[]" name="productImage[]" onchange="previewProductImages()" lang="en" multiple>
                                        <label class="custom-file-label" for="productImage[]">Choisissez images</label>
                                    </div>
                                    <small>l'image est censé être d'une résolution de 850 x 995</small>
                                    @error('productImage[]')
                                        <strong>{{ $errors->first('productImage[]') }}</strong>
                                    @enderror
                                </div>
                                <div id="productImagePreview" class="row mb-3">
                                </div>
                                
                                @push('js')
                                    <script>
                                        function previewProductImages(){

                                            var total_file = document.getElementById("productImage[]").files.length;
                                            for(var i=0;i<total_file;i++){
                                                $('#productImagePreview').append('<div class="col-6 col-md-4 col-lg-2"><img src="'+URL.createObjectURL(event.target.files[i])+'" alt="" class="img-fluid"></div>');
                                            }
                                        }
                                    </script> 
                                @endpush

                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">{{ __('Ajouter Produit') }}</button>
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