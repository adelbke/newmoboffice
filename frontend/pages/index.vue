<template>
  <!-- <Products :products="products" :error="error" :storeUrl="storeUrl" /> -->
  <div class="container mx-auto relative">
    <large-carousel></large-carousel>
    <four-features></four-features>
    <perf-count></perf-count>
    <div class="flex flex-row flex-wrap md:py-8 py-2">
      <div class="w-full py-1 md:py-0 md:w-1/2">
        <product></product>
      </div>
      <div class="w-full py-1 md:py-0 md:w-1/2">
        <product></product>
      </div>
    </div>
    <two-covers class="md:py-8 py-2"></two-covers>
    <landing-item></landing-item>
    <h2 class="text-3xl md:text-4xl text-center capitalize mt-4">Des Solutions personalisables pour tout les goûts</h2>
    <large-color-carousel></large-color-carousel>
  </div>
</template>

<script>
import product from "~/components/product-item.vue";
import landingItem from '~/components/landing-item.vue';
import perfCount from '~/components/perf-count.vue'
import fourFeatures from '~/components/four-features.vue'
import largeColorCarousel from '~/components/large-color-carousel.vue'
import twoCovers from '~/components/two-covers.vue'
import largeCarousel from '~/components/large-carousel.vue'

export default {
  components: {
    product,
    landingItem,
    perfCount,
    fourFeatures,
    largeColorCarousel,
    twoCovers,
    largeCarousel
  },
};
</script>

<style scoped>
.section-title{
  @apply text-3xl md:text-4xl text-center capitalize
}
</style>
