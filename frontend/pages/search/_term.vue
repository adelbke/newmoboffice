<template>
  <main>
    <h2 v-if="!!$route.params.term" class="main-title">
      Résultats de recherche pour "{{ searchTerm }}"
    </h2>
    <h2 class="main-title" v-else>Nos produits</h2>
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
      class="my-2"
      :total-items="productsCount"
      :per-page="10"
      v-model="currentPage"
    />
  </main>
</template>

<script>
import productItem from '~/components/product-item.vue'
import { TPagination } from 'vue-tailwind/dist/components'
import Vue from 'vue'
import VueTailwind from 'vue-tailwind'

const settings = {
  't-pagination': {
    component: TPagination,
    props: {
      classes: {
        wrapper: 'table border-collapse text-center bg-white mx-auto shadow-sm',
        element: 'w-8 h-8 border border-gray-200 table-cell hover:border-blue-100',
        activeElement: 'w-8 h-8 border border-gray-200 border-blue-500 table-cell hover:border-blue-600',
        disabledElement: 'w-8 h-8 border border-gray-200 table-cell',
        ellipsisElement: 'w-8 h-8 border border-gray-200 hidden md:table-cell',
        activeButton: 'bg-blue-500 w-full h-full text-white hover:bg-blue-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50',
        disabledButton: 'opacity-25 w-full h-full cursor-not-allowed transition duration-100 ease-in-out',
        button: 'hover:bg-blue-100 w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50',
        ellipsis: ''
      },
      variants: {
        rounded: {
          wrapper: 'bg-white mx-auto text-center flex space-x-2',
          element: 'w-8 h-8 rounded-full',
          activeElement: 'w-8 h-8 rounded-full',
          disabledElement: 'w-8 h-8 rounded-full',
          ellipsisElement: 'w-8 h-8 rounded-full hidden md:inline',
          activeButton: 'border border-blue-500 bg-blue-500 w-full h-full rounded-full text-white hover:bg-blue-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50',
          disabledButton: 'border border-gray-200  opacity-25 w-full h-full rounded-full cursor-not-allowed transition duration-100 ease-in-out',
          button: 'border border-gray-200 hover:bg-blue-100 hover:border-blue-100 rounded-full w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50',
          ellipsis: ''
        }
      }
    }
  }
}

Vue.use(VueTailwind, settings)
export default {
  async asyncData({ params, $strapi, route }){

    let page = parseInt(!!route.query.page ? route.query.page : 1)
    const searchTerm = params.term;
    const qs = require('qs')
    const filter = { 
      _where: { _or: [
        { title_contains: searchTerm },
        { 'category.name_contains': searchTerm },
        { description_contains: searchTerm } ]
      }, 
      _start: (page - 1) * 10,
      _limit: 10
    }

    const products = $strapi.find('products',qs.stringify(filter))
    const productsCount = $strapi.count('products', qs.stringify(filter))
    let dataResult = await Promise.all([products, productsCount])
    return { searchTerm, products:dataResult[0], productsCount:dataResult[1] }
  },
  components: { 
    productItem
  },
  computed:{
    currentPage:{
      get(){
        return parseInt(!!this.$route.query.page ? this.$route.query.page : 1);
      },
      set(value){
<<<<<<< HEAD
        let vm = this
        this.$router.push({
          name: 'search',
          params: { searchTerm: vm.searchTerm },
          query: { page: value }
        })
      }
    }
  },
  methods:{
    goToPage(page){
      let vm = this
      this.$router.push({
        name:'search',
        params: { searchTerm: vm.searchTerm },
        query: { page }
      })
    }
=======
        this.$router.push({ path: `/search/${this.searchTerm}?page=${value}`})
      }
    }
>>>>>>> v2_strapi
  }
}
</script>

<style>
.main-title {
  @apply text-center font-bold text-lg md:text-xl font-nunito md:py-4;
}
</style>