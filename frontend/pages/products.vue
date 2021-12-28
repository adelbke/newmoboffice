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
      <pagination
        :listCount="productsCount"
        v-model="currentPage"
      >
      </pagination>
      <!-- <v-paginator :per-page="10" layout="div" :total="productsCount" @changePage="pageChange"/> -->
  </main>
</template>

<script>
import productItem from '~/components/product-item.vue'
// import VPaginator from 'v-paginator'
import pagination from '~/components/navigation-components/pagination.vue'

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
    productItem,
    pagination
  },
  computed:{
    currentPage:{
      get(){
        return parseInt(!!this.$route.query.page ? this.$route.query.page : 1);
      },
      set(value){
        this.$router.push(`/products?page=${value}`)
      }
    }
  },
  methods:{
    goToPage(page){
      this.$router.push(`/products?page=${page}`)
    },
    pageChange(pInfo){
      console.log(pInfo)
    }
  }
}
</script>

<style>
.main-title {
  @apply text-center font-bold text-lg md:text-3xl text-gray-800 font-nunito md:py-4;
}
</style>