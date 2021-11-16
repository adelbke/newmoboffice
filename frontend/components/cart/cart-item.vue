<template>
  <div class="flex flex-row flex-wrap bg-white rounded-md border shadow-lg p-2 md:p-4">
    <div class="flex flex-row justify-between sm:hidden w-full pb-2">
      <h2 class="product-title" v-text="title"></h2>
      <button class="border border-gray-400 shadow text-red-600 cursor-pointer order-last sm:order-none" @click="deleteFromCart()">
        <trash-icon></trash-icon>
      </button>
    </div>
    <div class="w-full sm:w-1/4">
      <img class="w-full h-auto" src="/product-image.png" alt="">
    </div>
    <div class="hidden sm:flex flex-col w-full sm:w-1/3">
      <h2 class="product-title" v-text="title"></h2>
      <pre class="text-xs mt-4 whitespace-pre-line" v-text="description"></pre>
    </div>
    <div class="flex sm:flex-col flex-row w-full sm:w-1/3 py-2 sm:py-0">
      <div>
        Quantité
        <counter v-on:counterChanged="quantityCounterUpdated($event)" :initialCounter="quantity"></counter>
      </div>

    </div>
    <div class="flex flex-row sm:flex-col justify-between sm:items-end items-center w-full sm:w-1/12 py-2 sm:py-0">
      <button class="border border-gray-400 shadow text-red-600 cursor-pointer order-last sm:order-none" @click="deleteFromCart()">
        <trash-icon></trash-icon>
      </button>

      <span class="order-first sm:order-none">{{price}} DA</span>
    </div>
  </div>
</template>

<script>
import trashIcon from '~/components/icons/trash.vue'
import counter from '~/components/cart/counter.vue'
export default {
  components:{
    trashIcon,
    counter
  },
	props:{
    id:{
      type: Number,
      default: 15
    },
		title:{
      type: String,
      default:'Bureau Sam'
    },
    description:{
      type: String,
      default: "Hello World"
    },
    itemIndex:{
      type:Number,
      default: 20
    },
    unitPrice:{
      type:Number,
      default: 37900
    },
    quantity:{
      type: Number,
      default: 2
    },
    criterias:{
      type: Object,
      default: function () {
        return {
          taille: {
            name:'Large',
            id: 5
          },
          Couleur: 'Blanc teck'
        }
      }
    }
	},
  methods:{
    quantityCounterUpdated(quantity){
      this.quantity= quantity
      this.$store.dispatch('cart/updateItemQuantity', {itemIndex:this.itemIndex, quantity: quantity})
    },
    deleteFromCart(){
      this.$store.dispatch('cart/removeItemFromCart', this.itemIndex)
    }
  },
  computed:{
    price(){
      return this.unitPrice * this.quantity
    }
  }
}
</script>

<style>
</style>