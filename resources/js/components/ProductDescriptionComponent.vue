<template>
    <div>
        <h4 class="font-weight-bold" v-text="product.name"></h4>
        <p style="font-size:1.1em" v-text="product.note" >description courte</p>
        <h3 class="font-weight-bold" style="text-decoration: line-through;" v-text="product.price + ' Da'" >11000 Da</h3>
        <h3 class="font-weight-bold" v-text="product.retailerPrice + 'Da'" ></h3>
        <p class="text-left" style="color: rgb(255, 210, 0);font-size:1.5em">
            <!-- <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa far fa-star-half-alt"></i>
            <span>
                <span class="text-dark">4.4</span>
                <a href="" class="text-primary">23 avis</a>
            </span> -->
        </p>
        <p>
            <span v-text="product.description" ></span>
            <!-- <span id="more" style="display:none">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nostrum commodi consequuntur exercitationem eaque blanditiis quaerat cupiditate enim similique dolor quos tenetur, distinctio quidem neque velit porro, necessitatibus aut, aliquam doloremque.
            </span> -->
            <!-- <a class="text-primary" id="readMore">lire plus...</a> -->
        </p>
        <div class="row align-items-center">
            <div class="col-md">
            <span style="font-size:1.2em">Quantité</span>

            </div>
            <div class="border border-secondary rounded col-auto px-0 justify-content-center">
                <button type="button" style="font-size:1.5em" @click="decrement()" id="addqte" class="btn btn-light px-3">-</button>
                <input type="text" name="Quantité" class="form-control d-inline border-0 shadow-0" style="width:3em;" id="qte" v-bind:value="qte">
                <button type="button" @click="increment()" data-toggle="tooltip" style="font-size:1.5em" class="btn btn-light px-3">+</button>
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
    props:{
        product:Object
    },
    data: function (){
        return {
            qte:1
        };
    },
    methods:{
        increment: function (){
            if(this.qte < 10){
                this.qte = this.qte + 1;
            }else{
                // $('#addqte').tooltip({
                //     title: "Hello",
                //     trigger:'manual'
                // });
                // $('#addqte').show();
                alert('Vous ne pouvez pas dépasser cette quantité');
            }
        },
        decrement: function(){
            if(this.qte > 1){
                this.qte = this.qte - 1;
            }
        }
    },
    mounted(){
        // $('#readMore').click(function () {
        //     if($('#more').css("display") == 'none'){
        //         $('#more').show();
        //         $('#readMore').html('lire moins.');
        //     }else{
        //         $('#more').hide();
        //         $('readMore').html('lire plus...');
        //     }
        // })
    }
}
</script>

