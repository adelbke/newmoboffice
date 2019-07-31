<template>
    <div>
        <h4 class="font-weight-bold">titre Produit</h4>
        <p style="font-size:1.1em">description courte</p>
        <h3 class="font-weight-bold">11000 Da</h3>
        <p class="text-left" style="color: rgb(255, 210, 0);font-size:1.5em">
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa far fa-star-half-alt"></i>
            <span>
                <span class="text-dark">4.4</span>
                <a href="" class="text-primary">23 avis</a>
            </span>
        </p>
        <p>
            <span>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit nemo aperiam temporibus voluptatum et quos eveniet, est id ipsum illum provident officia, voluptates asperiores inventore nostrum molestias vitae doloribus quidem.
            </span>
            <span id="more" style="display:none">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nostrum commodi consequuntur exercitationem eaque blanditiis quaerat cupiditate enim similique dolor quos tenetur, distinctio quidem neque velit porro, necessitatibus aut, aliquam doloremque.
            </span>
            <a class="text-primary" id="readMore">lire plus...</a>
        </p>
        <div class="row align-items-center">
            <div class="col-md">
            <span style="font-size:1.2em">Quantité</span>

            </div>
            <div class="border border-secondary rounded col-auto justify-content-center">
                <button type="button" style="font-size:1.5em" class="btn btn-light">-</button>
                <input type="text" name="Quantité" class="form-control d-inline border-0 shadow-0" style="width:3em;" id="qte" value="1">
                <button type="button" style="font-size:1.5em" class="btn btn-light">+</button>
            </div>
        </div>
        <div class="my-3">
            <button type="button" name="Buy" id="Buy" class="btn btn-primary btn-lg btn-block">
                <i class="fa fa-cart-plus    "></i>
                Ajouter au Panier
            </button>
        </div>
    </div>
</template>

<script>
export default {
    mounted(){
        $('#readMore').click(function () {
            if($('#more').css("display") == 'none'){
                $('#more').show();
                $('#readMore').html('lire moins.');
            }else{
                $('#more').hide();
                $('readMore').html('lire plus...');
            }
        })
    }
}
</script>

