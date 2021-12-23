<template>
  <section class="max-w-screen-xl mx-auto md:py-8 py-2 flex flex-row flex-wrap">
    <div class="w-full lg:w-1/2">
      <image-viewer :productImages="product.images"></image-viewer>
    </div>
    <div
      class="
        w-full
        lg:w-1/2
        p-2
        md:px-6
        flex flex-col
        md:py-4
        font-nunito
        overflow-y-auto
      "
    >
      <h2 class="font-semibold md:text-3xl text-3xl">{{ product.title }}</h2>
      <div class="flex flex-row flex-wrap items-center">
        <template v-for="category, index in product.parents">
          <NuxtLink
            class="text-xs sm:text-sm font-light sm:mx-1 hover:underline hover:font-normal"
            :key="category.id"
            v-text="category.name"
            :to="'/category/' + category.slug"
          ></NuxtLink>
          <chevron-right v-if="index != product.parents.length - 1" :key="'chevron-' + category.id" class="w-4 h-4 sm:w-6 sm:h-6"></chevron-right>
        </template>
      </div>
      <h4 v-if="price > 0" class="text-lg font-semibold md:text-2xl my-4">
        {{ price }} DA
      </h4>
      <h4 v-else class="text-lg font-semibold md:text-2xl my-4">
        <span v-if="product.sizes.length > 1">À partir de </span>
        {{ this.product.price }} DA
      </h4>
      <p
        class="prose text-sm ml-4"
        v-html="markdownParse(product.description)"
      ></p>
      <h4 class="text-lg font-semibold md:text-2xl mt-2 sm:mt-4">
        Critères du Produit:
      </h4>
      <div class="flex flex-row flex-wrap items-stretch mb-1 sm:mb-2">
        <div class="w-full lg:w-1/2 mb-2 sm:mb-0">
          <h6 class="font-semibold font-nunito text-md md:text-lg">Tailles</h6>
          <size-selector
            v-if="product.sizes.length > 1"
            :sizes="product.sizes"
            class="mt-2"
            v-on:sizeSelection="updateSize($event)"
          ></size-selector>
        </div>
        <div v-if="product.product_colors.length > 1" class="w-full lg:w-1/2 mb-2 sm:mb-0">
          <h6 class="font-semibold font-nunito text-md md:text-lg">Couleurs</h6>
          <color-selector
            :colors="product.product_colors"
            v-on:colorSelection="updateColor($event)"
          ></color-selector>
        </div>
        <div class="flex flex-row flex-wrap items-stretch mb-1 sm:mb-2">
          <div class="w-full lg:w-1/2 mb-2 sm:mb-0">
            <h6 class="font-semibold font-nunito text-md md:text-lg">
              Quantité
            </h6>
            <counter
              v-on:counterChanged="quantityCounterUpdated($event)"
              :initialCounter="1"
            ></counter>
          </div>
        </div>
      </div>
      <div class="text-lg font-semibold md:text-2xl mb-2 sm:my-4">
        Prix Actuel: {{ price > 0 ? price : "" }}
      </div>
      <button
        @click="buyProduct"
        class="
          w-2/3
          md:w-1/2
          self-center
          bg-newmob-red
          p-2
          text-lg
          border-newmob-red-100
          text-white
          rounded-md
          shadow-lg
          sm:mt-2
        "
      >
        Ajouter au Panier
      </button>
    </div>
  </section>
</template>

<script>
import imageViewer from '~/components/product-components/image-viewer.vue'
import sizeSelector from '~/components/product-components/size-selector.vue'
import colorSelector from '~/components/product-components/color-selector.vue'
import chevronRight from '~/components/icons/chevron-right.vue'

import { marked } from 'marked'

import counter from '~/components/cart/counter.vue'
export default {
    components:{
    imageViewer,
    sizeSelector,
    colorSelector,
    counter,
    chevronRight
    },
    props:['product'],
    methods:{
    markdownParse: marked.parse,
    updateSize(id){
      this.selectedSize = this.product.sizes.find(x => x.id == id)
    },
    updateColor(id){
      this.selectedColor = this.product.product_colors.find(x => x.id == id)
    },
    quantityCounterUpdated(quantity){
      $nuxt.$store.dispatch('cart/updateItemQuantity', {productId:this.product.id, quantity: quantity})
      this.quantity = quantity
    },
    buyProduct(){
      const toastOptions = {
          className: 'et-warn',
          verticalPosition: 'bottom',
          duration: 3000,
          mode: 'queue',
          closeable: true,
          transition: 'fade'
        }
      if(Object.keys(this.selectedSize).length <= 0){
        this.$toast('Veuillez sélectionner une Taille avant de procéder',toastOptions)
        return
      }
      if(Object.keys(this.selectedColor).length <= 0){
        this.$toast('Veuillez sélectionner une Couleur avant de procéder',toastOptions)
        return
      }
      else{
        let cartItem = {product: this.product, criterias:{size: this.selectedSize, color:this.selectedColor }, quantity: this.quantity}
        $nuxt.$store.dispatch('cart/addItemToCart', cartItem)
      }
    }
  },
  data(){
    return{
      selectedSize: {},
      selectedColor: {},
      quantity: 1
    }
  },
  computed:{
    price(){
      if(Object.keys(this.selectedSize).length > 0){
        return (this.product.price + this.selectedSize.added_price) * this.quantity
      }else{
        return 0;
      }
    }
  }
}
</script>

<style scoped>
.et-wrapper.et-warn {
  margin: 1rem;
}
.product-title {
  @apply font-semibold md:text-3xl text-lg;
}
</style>