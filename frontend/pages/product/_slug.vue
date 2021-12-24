<template>
  <div class="bg-newmob-gray">
    <div
      v-if="!!product.cover_image"
      class="h-72 w-full bg-image"
      :style="
        'background-image: url(' + getStrapiMedia(product.cover_image.url) + ')'
      "
    ></div>
    <product-section
      class="container mx-auto"
      :product="product"
    ></product-section>
    <div v-if="similar_products.length > 0" class="md:py-4 py-2">
      <h2 class="section-title">Produits Similaires</h2>
      <div class="flex flex-row flex-wrap">
        <div
          v-for="prod in similar_products"
          :key="prod.id"
          class="w-full md:w-1/2"
        >
          <product-item :product="prod"></product-item>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import productSection from '~/components/product-components/product-section.vue'
import productItem from '~/components/product-item.vue'
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  components:{ productSection, productItem },
  async asyncData ({ params, $strapi }){
    const product = await $strapi.findOne('products',params.slug)
    const similar_products = await $strapi.find('products', { 'category.id': product.category.id, 'id_ne':product.id })
    return { product, similar_products }
  },
  head(){
    let { title, description, cover_image } = this.product
    let dynamic_section = []
    if(!!cover_image){
      dynamic_section.push(
        { property:'og:image', content: getStrapiMedia(cover_image.url)},
        { name: 'twitter:image', content: getStrapiMedia(cover_image.url)}
      )
    }
    return {
      title:'Newmoboffice - ' + title,
      meta:[
        { hid: 'description', name: 'description', content: description },
        // facebook description
        { property:'og:description', content: description },
        // twitter
        { name: 'twitter:description', content: description },
        ...dynamic_section
      ]
    }
  },
  methods:{ getStrapiMedia }
}
</script>

<style scoped>
.bg-image {
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
}
</style>