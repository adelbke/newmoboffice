<template>
  <div class="container bg-newmob-gray mx-auto">
    <section
      class="max-w-screen-xl mx-auto md:py-8 py-2 flex flex-row flex-wrap"
    >
      <div class="w-full lg:w-1/2">
        <image-viewer></image-viewer>
      </div>
      <div class="w-full lg:w-1/2 p-2 md:px-6 flex flex-col md:py-4 font-nunito overflow-y-auto">
        <h2 class="font-semibold md:text-3xl text-lg">Bureau sam</h2>
        <small class="text-sm font-light">{{product.category.name}}</small>
        <h4 class="text-lg font-semibold md:text-2xl my-4">
          À partir de {{startingPrice}} DA
        </h4>
        <pre class="text-sm" v-text="product.description">
        </pre>
        <h4 class="text-lg font-semibold md:text-2xl mt-4">Critères du Produit: </h4>
        <div class="flex flex-row flex-wrap items-stretch mb-2">
          <div class="w-full lg:w-1/2 mb-2 sm:mb-0">
            <h6 class="font-semibold font-nunito text-md md:text-lg ">Tailles</h6>
            <size-selector :sizes="product.sizes" class="mt-2" v-on:sizeSelection="updateSize($event)"></size-selector>
          </div>
          <div class="w-full lg:w-1/2 mb-2 sm:mb-0">
            <h6 class="font-semibold font-nunito text-md md:text-lg ">Couleurs </h6>
            <color-selector :colors="product.product_colors" v-on:colorSelection="updateColor($event)" ></color-selector>          
          </div>
        </div>
        <div class="text-lg font-semibold md:text-2xl my-4">
          Prix Actuel: {{ price > 0 ? price : "" }}
        </div>
        <button @click="buyProduct" class="w-2/3 md:w-1/2 self-center bg-newmob-red p-2 text-lg border-newmob-red-100 text-white rounded-md shadow-lg mt-2">Ajouter au Panier</button>
        <!-- <button class="bg-newmob-red p-2 text-lg border-newmob-red-100 text-white rounded-md shadow-lg mt-4" @click="$modal.show('buy-modal')">Ajouter au Panier</button> -->
        <!-- <modal
          height="auto"
          width="50%"
          :classes="'flex flex-col p-2 md:p-4'"
          name="buy-modal"
        >
          <h3 class="text-lg font-semibold md:text-2xl">Lancement de Commande: </h3>
          <div class="ml-2 md:ml-4">
            <div class="mb-2">
              <h4 class="text-md font-semibold md:text-xl">Choisissez une taille: </h4>
              <size-selector :sizes="product.sizes" class="mt-2" v-on:sizeSelection="updateSize($event)"></size-selector>
            </div>
            <div>
              <h4 class="text-md font-semibold md:text-xl">Choisissez une Couleur: </h4>
              <color-selector :colors="product.product_colors"></color-selector>
            </div>
          </div>
        </modal> -->
        <!-- <div class="mt-4 lg:mt-6">
          <h4 class="text-md font-semibold md:text-xl">Choisissez une taille: </h4>
          <size-selector :sizes="product.sizes" class="mt-2" v-on:sizeSelection="updateSize($event)"></size-selector>
        </div>
        Prix: {{price}} -->
      </div>
    </section>
  </div>
</template>

<script>
import imageViewer from '~/components/product-components/image-viewer.vue'
import sizeSelector from '~/components/product-components/size-selector.vue'
import colorSelector from '~/components/product-components/color-selector.vue'


export default {
  components:{
    imageViewer,
    sizeSelector,
    colorSelector
  },
  async asyncData ({ $strapi }){
    const product = await $strapi.findOne('products','bureau-sam')
    return { product }
  },
  methods:{
    updateSize(id){
      this.price = this.product.sizes.find(x => x.id == id).price
    },
    updateColor(id){
      this.color = this.product.product_colors.find(x => x.id == id).id
    },
    buyProduct(){
      if(this.color == {} || this.price == 0){
        this.$toast('Veuillez sélectionner une taille et une couleur avant de procéder',{
          className: 'et-warn',
          verticalPosition: 'bottom',
          duration: 3000,
          mode: 'queue',
          closeable: true,
          transition: 'fade'
        })
      }
      else{
        console.log("add to cart")
      }
      // this.toast('Can I have everybody`s attention?')
    }
  },
  data(){
    return{
      price: 0,
      color: {}
    }
  },
  computed:{
    startingPrice(){
      let priceList = this.product.sizes.map((x) => x.price)
      return Math.min(...priceList)
    },
    categoryList(){

      let categoryList = [this.product.category]
      let currentCategory = this.product.category

      while(currentCategory.parent != null){
        if(typeof(currentCategory.parent) == 'object'){
          currentCategory = currentCategory.parent
        }else{
          if(typeof(currentCategory.parent) == 'number'){
            // currentCategory = await this.$strapi.findOne('categories',this.product.category.parent)
            this.$strapi.findOne('categories',this.product.category.parent).then(x => {
              currentCategory = x
            })
          }
        }
        categoryList.unshift(currentCategory)

      }

      return categoryList

    }
  }
  // notifications: {
  //   showForgotColorError: {
  //     title: 'Choix de couleur oublié',
  //     message: 'Veuillez sélectionner une couleur avant de procéder',
  //     type: 'error'
  //     // type: 'error'
  //   }
  // }
}
</script>

<style>
.et-wrapper.et-warn{
  margin: 1rem;
}
</style>