<template>
  <main>
    <h2 class="main-title">Nos produits</h2>
    <section class="container mx-auto flex flex-row flex-wrap">
      <div
        class="w-full md:w-1/2"
        v-for="product in products"
        :key="product.id"
      >
        <product-item :product="product"></product-item>
      </div>
    </section>
    <t-pagination
      :total-items="productsCount"
      :per-page="10"
      v-model="currentPage"
    />
  </main>
</template>

<script>
import productItem from '~/components/product-item.vue'
// import { TPagination } from 'vue-tailwind/dist/components'
import TPagination from 'vue-tailwind/dist/t-pagination';
import Vue from 'vue'
import VueTailwind from 'vue-tailwind'

Vue.use(VueTailwind, {
  't-pagination':{
    component: TPagination
  }
})
export default {
  async asyncData({ $strapi, route }){
    let page = parseInt(!!route.query.page ? route.query.page : 0)
    const qs = require('qs')
    const filter = { 
      _start: page * 10,
      _limit: 10
    }

    const products = $strapi.find('products',qs.stringify(filter))
    const productsCount = $strapi.count('products', qs.stringify(filter))
    let dataResult = await Promise.all([products, productsCount])
    return { products:dataResult[0], productsCount:dataResult[1] }
  },
  components: { 
    productItem
  },
  computed:{
    currentPage:{
      get(){
        return parseInt(!!this.$route.query.page ? this.$route.query.page : 0);
      },
      set(value){
        this.$router.push(`/products?page=${value}`)
      }
    }
  },
  methods:{
    goToPage(page){
      this.$router.push(`/products?page=${value}`)
    }
  }
}
</script>

<style>
.main-title {
  @apply text-center font-bold text-lg md:text-xl font-nunito md:py-4;
}
</style>