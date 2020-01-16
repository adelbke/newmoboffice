@extends('layouts.app', ['title' => __('User Management')])

@section('content')
    @include('users.partials.header', ['title' => __('Ajouter Slider')])   

    <div class="container-fluid mt--7">
        <div>
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Ajout Slider') }}</h3>
                            </div>
                            <div class="col-4 text-right">
                                <a href="{{ route('sliders.index') }}" class="btn btn-sm btn-primary">{{ __('liste des Sliders') }}</a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        @if (session('success'))
                            <div class="alert alert-success font-weight-bold"> {{session('success')}} </div>
                        @endif
                        <form enctype="multipart/form-data" action="/sliders" method="post">
                            @csrf
                                <div class="form-group">
                                    <label class="form-control-label" for="sliderImage[]">Image du Slider</label>
                                    <div class="custom-file">
                                    <input type="file" class="custom-file-input form-control" id="sliderImage" name="sliderImage[]" multiple>
                                        <label class="custom-file-label" for="sliderImage">Choisissez une image</label>
                                    </div>
                                </div>                                
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