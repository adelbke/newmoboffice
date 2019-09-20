<template>

    <div class="hvr-grow">
        <a v-bind:href="this.productpath">
            <img v-bind:src="this.path" class="img-fluid mx-auto img-product mb-2 rounded  d-block" style="height:210px;width:210px" alt="">
        </a>
        <!-- /images/hair-salon-couch.jpg -->
        
        <a v-bind:href="this.productpath" v-text="this.name" class="text-dark font-weight-bold d-block btn-link">titre produit court</a>
        <p class="text-left my-0" >{{this.descriptionformatted}}
            <a href="#" v-if="this.isdescriptionlong && !this.islong" class="text-primary" @click="readmore()">Lire plus</a>
            <a href="#" v-else-if="this.islong" class="text-primary" @click="readless()">Lire moins</a>

        </p>
        <h4 class="text-left" v-text="this.priceformatted" >11000 Da</h4>
        <!-- <p class="text-left" style="color: rgb(255, 210, 0);">
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fas fa-star"></i>
            <i class="fa fa-star-half"></i>
        </p> -->
        <p class="text-left">
            <small class="text-muted text-left" v-text="this.note" >Petite Note</small>
        </p>
    </div>
    
</template>

<script>
import ReadMore from 'vue-read-more';
Vue.use(ReadMore);
export default {
    mounted(){

    },
    props:{
        id:Number,
        path:String,
        name:String,
        note:String,
        price:Number,
        description:String

    },
    // components:{
    //     ReadMore
    // },
    computed:{
        productpath: function (){
            return '/products/'+ this.id;
        },
        priceformatted: function (){
            return this.price + ' Da';
        },
        descriptionformatted: function(){
            if(this.isdescriptionlong && !this.islong){
                return this.description.substring(0,75);
            }else{
                return this.description;
            }
            
        },
        isdescriptionlong:function () {
            if(this.description.length > 75)
                return true;
            else
                return false;
        }
    },
    data:function (){
        return{
            islong:false
        };
    },
    methods:{
        readmore:function (){
            this.islong = true;
        },
        readless:function (){
            this.islong = false;
        }
    }
}
</script>

<style>

</style>
