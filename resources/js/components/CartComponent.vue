<template>
    <!-- <button type="button" class="btn rounded-circle text-dark hvr-fade p-1 " 
    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <div>
            <i class="fas fa fa-shopping-cart fa-2x mx-1"></i>
            <span class="badge badge-primary"></span>
        </div>
    </button> -->
    <div class="btn-group dropleft">
        <button type="button" class="btn  text-dark  p-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa fa-shopping-cart fa-2x p-2 rounded-circle hvr-fade"></i>
            <span class="badge badge-primary" v-text="cart.length" v-if="cart.length > 0" ></span>

        </button>
               
        <div class="dropdown-menu">
            <div class="container-fluid">
                <div v-for="(product,index) in this.cart" class="product-cart" v-bind:key="product.id">
                    <div class="row">
                        <div class="col-md-10 col-10">
                            <h5 v-text="product.name" ></h5>
                        </div>
                        <div class="col-md-2 col-2">
                            <button type="button" @click="removeFromCart(index)" v-bind:value="index" title="supprimer" class="btn delete-button btn-light border border-dark rounded px-1 py-0 text-dark">
                                <i class="fas fa fa-trash "></i>
                            </button>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-md-3">
                            <img v-bind:src="product.image" class="img-fluid" alt="">
                        </div>
                        <div class="col-9 col-md-9 align-middle">
                            <div class="">
                                <span class="font-weight-bold">Couleur: </span> 
                                <img v-bind:src="product.color.image.path" style="width: 30px;height: auto;" class="img-fluid rounded-circle border-primary" alt="">
                                {{product.color.name}}
                                
                            </div>
                            <div>
                                <span class="font-weight-bold border-right border-dark pr-1" v-text="'Quantité: ' + product.quantity"></span>
                                <span class="font-weight-bold" v-text=" 'Prix: ' + product.price * product.quantity" ></span>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="dropdown-divider"></div>
            <div class="container-fluid mt-2 px-1">
                <div class="row">
                    <div class="totalprice col-md-6 col-lg-6 col-12 align-middle" >
                        <span class="text-center" v-text="'Prix Totale: '+totalPrice"></span>
                    </div>
                    <div class="visitCart text-right col-md-6 col-lg-6 col-12">
                        <!-- <button type="button" name="Cart" id="Cart" href="/cart" class="btn btn-primary">Voir Panier</button> -->
                        <a class="btn btn-primary" href="/cart" role="button">Voir Panier</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {EventBus} from '../event-bus.js';
export default {

    computed:{
        totalPrice: function (){
            var sum=0;
            this.cart.forEach(element => {
                sum = sum + element.price * element.quantity;
            });
            return sum;
        }
    },
    methods:{
        removeFromCart: function (index){
            // console.log(index);
            var rowid = this.cart[index].rowId;
            this.cart.splice(index,1);
            // console.log(rowid)
            axios.post('/cart/remove', {
                    rowid:rowid
            })
            .then(function (response) {
            })
            .catch(function (error) {
            })
        },
        deleteFromCart: function (rowid){
            for (let i = 0; i < this.cart.length; i++) {
                const element = this.cart[i];
                if(element.rowId == rowid){
                    this.removeFromCart(i);
                }
            }
        }

    },
    mounted() {
        var vm = this;
        axios.post('/cart/get', {}).then(function (response) {
            // console.log(response.data);
            response.data.forEach((value) => {
                // console.log(value);
                vm.cart.push(value);
                
            });        
        }).catch(function (error) {
        });
        // Add to cart Event Handler
        EventBus.$on('clicked-event',function (item){
            // console.log(item);
            var b =true;
            vm.cart.forEach(element => {
                if(element.reference === item.reference){
                    b = false;
                }
            });
            if(b){
                vm.cart.push(item);
            }
        });

        EventBus.$on('changed-quantity-event',function (item){
            vm.cart.forEach(element => {
                if(element.rowId == item.rowid){
                    element.quantity = item.quantity;
                }
            });
            axios.post('/cart/update', {
                rowid:item.rowid,
                quantity:item.quantity
            })
            .then(function (response) {
            })
            .catch(function (error) {
            })
        });

        EventBus.$on('remove-from-cart',(item) => this.deleteFromCart(item.rowid));
        // load initial Cart
        
    },
    data: function () {
        return {
            cart :[]
        };
    },
    
}
</script>

<style scoped>


.dropdown-menu{
    width: 300px
}
dropdown-toggle::after {
    display:none;
}
</style>