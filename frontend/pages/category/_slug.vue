<template>
  <section class="container mx-auto relative">
    <h2 class="section-title py-6">{{ category.name }}</h2>

    <div class="flex flex-row flex-wrap">
      <div
        class="w-full md:w-1/2"
        v-for="product in products"
        :key="product.id"
      >
        <product-item :product="product"></product-item>
      </div>
    </div>
  </section>
</template>

<script>
import productItem from '~/components/product-item.vue'
export default {
async asyncData ({ params, $strapi, store }){
    let categories = await $strapi.find('categories')
    store.dispatch('category/setCategories', categories)

    let category = categories.find((x) => x.slug === params.slug)
    let filter = store.getters['category/childrenFilterBySlug'](params.slug)
    const qs = require("qs");
    let query = qs.stringify({
      _where: {
        _or:filter
      }
    })

    const products = await $strapi.find('products', query)
    return { category, products }
  },
  components:{
    productItem
  }
}
</script>

<style>
</style>