@extends('layouts.guest', ['class' => 'bg-white'])
@section('content')

<div class="container-fluid mt-5 mb-3">
    <h2 class="h2 text-center">Des experts en Ameublement Professionel pour toutes les institutions</h2>
</div>

<div class="container shadow text-dark my-4 bg-light pt-2 pb-3 px-5" style="border-radius: 1rem;box-shadow: 0.2rem 0.2rem 0.2rem 0.2rem rgba(0,0,0,0.15);"> 
    <h4 class="h3 font-weight-bold font-italic text-center">À PROPOS DE NOUS</h4>
    <p class="text-center h5 font-italic">Fondée en 2018, la Société <strong>NEW MOB OFFICE</strong> se fait fort pour servir ses clients et partenaires à travers toute L’ALGERIE. <br>La spécification de nos articles et la <span class="font-weight-bold">garantie</span> du <span class="font-weight-bold">rapport qualité prix</span> sont nos <span class="font-weight-bold">principes</span> de travaille.</p>
    <p class="text-center h5 font-italic">"Notre savoir-faire et nos compétences reposent sur des personnels expérimentés et motivés"</p>
    <p class=" font-italic text-center h5"><strong>New Mob Office</strong>. Du mobilier pour tous les goûts. Notre particularité, c'est de réunir dans une seule entreprise le travail du concepteur et celui du fabriquant. <strong>New Mob Office</strong> Vous propose une large gamme de produits sur mesure et en série.</p>
</div>

{{-- <div class="container mt-5">
    <blockquote class="blockquote text-center">
        <p class="mb-0">Notre savoir-faire et nos compétences reposent sur des personnels expérimentés et motivés</p>
        <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
      </blockquote>
</div> --}}

<div class="container my-4 py-5">
    <div class="row">
        <div class="col-md-6 col-12 col-lg-6 ">
            <img src="/asset/maps.png" class="img-fluid mx-auto" style="border-radius: 25% 0%;box-shadow: 1px 1px 10px 1px var(--secondary);">
        </div>
        <div class="col-md-6 col-12 col-lg-6 px-4 text-center">
            <iframe class="mx-auto w-100" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12828.689866263885!2d2.8491879!3d36.5016987!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x327387a486e50ff3!2sNewMobOffice!5e0!3m2!1sfr!2sdz!4v1570610657302!5m2!1sfr!2sdz" height="456" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
        </div>
        
    </div>
</div>

    
@endsection