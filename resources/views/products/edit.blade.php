@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('users.partials.header', ['title' => __('Modifier Produit')])   

    <div class="container-fluid mt--7">
        <div>
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Modifier Produit') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('user.index') }}" class="btn btn-sm btn-primary">{{ __('liste des produits') }}</a>
                            </div>
                        </div>
                    </div>

                    @if(session('status'))
                        <div class="alert alert-success font-weight-bold"> {{session('status')}} </div>
                    @endif
                    <div class="card-body">
                        {{-- {{ Form::open(array('url'=>'/product')) }} --}}
                    <form method="post" action="/products/{{ $product->id }}" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            @method('PATCH')
                            {{-- <h5>hello</h5> --}}
                            <h6 class="heading-small text-muted mb-4">{{ __('Informations Produit') }}</h6>
                            <div class="pl-lg-4">
                                <div class="form-group @error('name') has-danger @enderror">
                                    <label class="form-control-label" for="input-name">{{ __('Titre') }}</label>
                                    <input type="text" name="name" id="input-name" class="form-control form-control-alternative text-dark @error('name') is-invalid @enderror" placeholder="{{ __('Titre') }}" value=" {{ old('name')?? $product->name }} " r autofocus>

                                    @if ($errors->has('name'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                    @endif
                                </div>
                                <div class="form-group @error('reference') has-danger @enderror">
                                    <label class="form-control-label" for="input-reference">{{ __('Référence') }}</label>
                                    <input type="text" name="reference" id="input-reference" class="form-control form-control-alternative text-dark @error('reference') is-invalid @enderror" placeholder="{{ __('Référence') }}" value="{{ old('reference')?? $product->reference }}" r autofocus>

                                    @if ($errors->has('reference'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('reference') }}</strong>
                                        </span>
                                    @endif
                                </div>


                                <div class="form-group @error('category') has-danger @enderror">
                                    <label for="category" class="form-control-label ">{{__('Catégorie')}}</label>
                                    <select class="@error('category') is-invalid @enderror form-control form-control-alternative " id="category" name="category">
                                        <option value="Informatique"{{$product->category=='Informatique' ? "selected":""}}>Informatique</option>
                                        <option value="Ameublement" {{$product->category=='Ameublement' ? "selected":""}}>Ameublement</option>
                                        <option value="Electronique" {{$product->category=='Electronique' ? "selected":""}}>Electronique</option>
                                    </select>
                                    @error('category')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('category') }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group @error('clientPrice') has-danger @enderror">
                                    <label for="clientPrice" class="form-control-label"> {{__('Prix Client')}} </label>
                                    <input type="number" name="clientPrice" id="clientPrice" class="form-control form-control-alternative text-dark @error('clientPrice') is-invalid @enderror" min="0" max="999999" placeholder="ex:1500" value="{{ old('clientPrice')?? $product->clientPrice }}">
                                  {{-- <small id="helpId" class="text-muted">Help text</small> --}}
                                    @error('clientPrice')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('clientPrice') }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group @error('retailerPrice') has-danger @enderror">
                                    <label for="retailerPrice" class="form-control-label"> {{__('Prix Revendeur')}} </label>
                                    <input type="number" name="retailerPrice" id="retailerPrice" class="form-control form-control-alternative text-dark @error('retailerPrice') is-invalid @enderror" min="0" max="999999" placeholder="ex:1500" value="{{ old('retailerPrice')?? $product->retailerPrice }}">
                                    {{-- <small id="helpId" class="text-muted">Help text</small> --}}
                                    @error('retailerPrice')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('retailerPrice') }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group @error('description') has-danger @enderror">
                                    <label for="description" class="form-control-label">Description</label>
                                    <textarea class="form-control form-control-alternative @error('retailerPrice') is-invalid @enderror text-dark"  rows="3" placeholder="Write a large text here ..." name="description">{{ old('description')?? $product->description }}</textarea>
                                    @error('description')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="form-group @error('images[]') has-danger @enderror">
                                    <div class="custom-file">
                                        <input r type="file" onchange="preview_images()" class="custom-file-input @error('images[]') is-invalid @enderror" id="images" name="images[]" multiple/>
                                        <label class="custom-file-label" for="images[]">Choisissez images</label>

                                    </div>
                                    @error('images[]')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('images[]') }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div id="imagePreview" class="row">
                                    @foreach ($images as $image)
                                        <div class="col-6 col-md-4 col-lg-4">
                                            <img src="/{{$image->path}}" alt="" class="img-fluid">
                                        </div>
                                    @endforeach
                                </div>

                                <script>

                                    function preview_images(){
                                        var total_file = document.getElementById("images").files.length;
                                        for(var i=0;i<total_file;i++){
                                            $('#imagePreview').append('<div class="col-6 col-md-4 col-lg-4"><img src="'+URL.createObjectURL(event.target.files[i])+'" alt="" class="img-fluid"></div>');
                                        }
                                    }
                                    
                                </script>
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-success mt-4">{{ __('Modifier Produit') }}</button>
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