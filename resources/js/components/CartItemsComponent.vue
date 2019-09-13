<template>
    <div>
        <div class="row" v-for="(item,index) in this.cart" v-bind:key="item.rowId">
            <div class="col-12-col-md-3 col-lg-3 p-0">
                <img v-bind:src="item.image" class="img-fluid float-right" alt="">
            </div>
            <div class="col-12 col-md-6 col-lg-6">
                <h4 class="h4" v-text="item.name" ></h4>
                <p v-text="item.description">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloremque reprehenderit, dignissimos libero pariatur, culpa vel iure magni, modi nesciunt autem temporibus ipsa obcaecati repellat tempore in! Dolor quis ab eligendi.</p>
                <!-- <quantity-component></quantity-component> -->
                <div class=" rounded d-inline px-0 justify-content-center">
                    Quantité:
                    <button type="button" style="font-size:1.5em" @click="decrement(index)" id="addqte" class="btn btn-light px-3">-</button>
                    <input type="number" name="Quantité" class="form-control d-inline border-0 shadow-0" style="width:4em;" id="qte" @input="changedquantity(index)" v-model="item.quantity">
                    <button type="button" @click="increment(index)" style="font-size:1.5em" class="btn btn-light px-3">+</button>
                </div>

            </div>
            <div class="col-12 col-md-3 col-lg-3">
                <div class="text-right">
                    <h4 class="h4" v-text="'Prix: ' + item.price * item.quantity">Prix: 1560</h4>
                    <h5 class="h5" v-text="'Prix Unité: ' + item.price">Prix Unité: 520</h5>
                    <button type="button" @click="removeFromCart(index)" v-bind:value="index" title="supprimer" class="btn delete-button btn-light border border-dark rounded px-1 py-0 text-dark">
                        <i class="fas fa fa-trash fa-lg "></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { EventBus } from '../event-bus';
export default {
    mounted (){
        var vm = this;
        axios.post('/cart/get', {}).then(function (response) {
            // console.log(response.data);
            response.data.forEach((value) => {
                // console.log(value);
                vm.cart.push(value);
                
            });        
        }).catch(function (error) {
        });
        
    },
    data: function () {
        return {
            cart :[]
        };
    },
    methods:{
        removeFromCart: function (index){
            var rowId = this.cart[index].rowId;
            this.cart.splice(index,1);
            EventBus.$emit('remove-from-cart',{
                rowid:rowId
            });
        },

        increment: function (index){
            if(this.cart[index].quantity < 10){
                this.cart[index].quantity = parseInt(this.cart[index].quantity) + 1;
            }else{
                alert('Vous ne pouvez pas dépasser cette quantité');
            }
            EventBus.$emit('changed-quantity-event',{
                rowid:this.cart[index].rowId,
                quantity:this.cart[index].quantity
            });
        },
        decrement: function(index){
            if(this.cart[index].quantity > 1){
                this.cart[index].quantity = this.cart[index].quantity - 1;
            }
            EventBus.$emit('changed-quantity-event',{
                rowid:this.cart[index].rowId,
                quantity:this.cart[index].quantity
            });
        },
        changedquantity:function(index){
            EventBus.$emit('changed-quantity-event',{
                rowid:this.cart[index].rowId,
                quantity:this.cart[index].quantity
            });
        }
    }
}
</script>

<style scoped>

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}

</style>