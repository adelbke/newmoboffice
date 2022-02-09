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
async asyncData ({ params, $strapi }){
    const categoryPromise = $strapi.findOne('categories',params.slug)
    const productsPromise = $strapi.find('products',[['category.slug',params.slug]])
    const [category, products] = await Promise.all([categoryPromise, productsPromise])
    return { category, products }
  },
  components:{
    productItem
  }
}
</script>

<style>
</style>