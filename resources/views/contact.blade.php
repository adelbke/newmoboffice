@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')

<div class="container mt-5 mb-3">
    <h2 class="h2 text-center">Contactez Nous !</h2>
    <div class="row border border-primary rounded p-3">
        <div class="col-md-6 col-12">
            <img src="/images/contact.svg" alt="Contact us" class="img-fluid">
        </div>
        <div class="col-md-6 col-12 border-left border-light">
            <h4 class="h4">Contactez nous: </h4>
            <ul style="list-style:none;">
                <li>
                    Email: <a href="mailto:Contact@newmoboffice.com" class="text-dark">Contact@newmoboffice.com</a>
                </li>
                <li>

                    <span class="font-weight-bold">Service Commerciale:</span> <br>
                    <a class="text-dark ml-3" href="tel:+213560125275">0560 12 52 75</a>
                    <br>
                    <a class="text-dark ml-3" href="tel:+213555619000">0555 61 90 00</a>
                </li>
                <li>
                    <span class="font-weight-bold">Service Mobillier:</span> <br>
                    <a class="text-dark ml-3" href="tel:+213560536039">0560 53 60 39</a>
                </li>
            </ul>
            
            

            {{-- Name --}}
            <form action="" method="post">
                <div class="form-group">
                  <label for="name">Nom: <span class="text-danger" >*</span></label>
                  <input type="text" class="form-control" name="name" id="name-input" aria-describedby="helpId" placeholder="Entrez Vôtre Nom">
                  {{-- <small id="helpId" class="form-text text-muted">Help text</small> --}}
                </div>
                {{-- Email --}}
                <div class="form-group">
                    <label for="Email">Email: <span class="text-danger">*</span> </label>
                    <input type="email" class="form-control" name="Email" id="Email-input" aria-describedby="emailHelpId" placeholder="Email">
                    {{-- <small id="emailHelpId" class="form-text text-muted">Help text</small> --}}
                </div>
                  
                  {{-- textarea --}}
                <div class="form-group">
                    <label for="message">Message: <span class="text-danger">*</span> </label>
                    <textarea class="form-control" name="message" id="message-input" rows="3"></textarea>
                </div>

            </form>
            
            
        </div>
    </div>
</div>

    
@endsection