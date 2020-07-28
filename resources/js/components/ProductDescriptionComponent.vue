<template>
    <div>
        <h4 class="font-weight-bold" v-text="product.name"></h4>
        <p style="font-size:1.1em" v-text="product.note" >description courte</p>
        <h3 class="font-weight-bold" v-bind:style="pricestyle" v-text="priceformatted" >11000 Da</h3>
        <h3 class="font-weight-bold" v-text="product.retailerPrice" ></h3>
        <!-- <p class="text-left" style="color: rgb(255, 210, 0);font-size:1.5em">
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa far fa-star-half-alt"></i>
            <span>
                <span class="text-dark">4.4</span>
                <a href="" class="text-primary">23 avis</a>
            </span>
        </p> -->
        <p>
            <span style="white-space: pre" v-text="product.description" ></span>
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
                <input type="text" name="Quantité" class="form-control d-inline border-0 shadow-0" style="width:3em;" id="qte" v-model="qte">
                <button type="button" @click="increment()" data-toggle="tooltip" style="font-size:1.5em" class="btn btn-light px-3">+</button>
            </div>
        </div>
        <div class="my-3">
            <h4>Couleurs Disponibles</h4>
            <div class="form-check mb-2" v-for="(color,index) in product.colors" v-bind:key="color.id">

                <input class="form-check-input" v-if="index == 0" checked type="radio" name="color" v-bind:id="color.name+'-input'" v-bind:value="color.id">

                <input class="form-check-input" v-else type="radio" v-model="selectedcolor" name="color" v-bind:id="color.name+'-input'" v-bind:value="index">

                <label class="form-check-label" v-bind:for="color.name+'-input'">
                    <img v-bind:src="color.image.path" style="width: 30px;height: auto;" class="img-fluid rounded-circle border-primary" alt="">
                    {{color.name}}
                </label>
            </div>

        </div>
        <div class="my-3">
            <button type="button" name="Buy" id="Buy" @click="addToCart()" class="btn btn-primary btn-lg btn-block">
                <i class="fa fa-cart-plus"></i>
                Ajouter au Panier
            </button>
        </div>
    </div>
</template>

<script>
// import CartComponentVue from './CartComponent.vue';
import {EventBus} from "../event-bus.js";
export default {
    props:{
        product:Object
    },
    data: function (){
        return {
            qte:1,
            pricestyle:'',
            selectedcolor:0
        };
    },
    // components:{
    //     CartComponent
    // },
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
        },
        addToCart: function(){
            var item = {
                'id':this.product.id,
                'name':this.product.name,
                'price':this.price,
                'reference':this.product.reference,
                'type':this.product.type.Name,
                'category':this.product.type.Category,
                'quantity':this.qte,
                'color': this.product.colors[this.selectedcolor],
                'image':this.product.images[0].path,
                'description':this.product.description
            };

            // var vm = this;
            axios.post('/cart/add', {
                productid:this.product.id,
                quantity:this.qte,
                reference:this.product.reference,
                isretailer: this.retailerprice == ''? false:true,
                color: this.product.colors[this.selectedcolor].id,
                image: this.product.images[0].id
            }).then(function (response) {
                item.rowId = response.data
                EventBus.$emit("clicked-event",item);
            })
            .catch(function (error) {
            });
        }
    },
    computed:{
        price:function (){
            if(this.product.hasOwnProperty('retailerPrice')){
                this.pricestyle = 'text-decoration: line-through;';
            }
            return this.product.price;
        },
        priceformatted:function (){
            return this.price + ' Da';
        },
        retailerprice:function(){
            if(this.product.hasOwnProperty('retailerPrice')){
                return this.product.retailerprice + ' Da';
            }else{
                return '';
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

