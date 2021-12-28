<template>
  <!-- <Products :products="products" :error="error" :storeUrl="storeUrl" /> -->
  <div class="container mx-auto relative">
    <large-carousel :slides="sliders"></large-carousel>
    <four-features :features="accueil.criteres_entreprise"></four-features>
    <perf-count
      :performances="accueil.compteur_performance"
      :title="accueil.titre_compteur"
      :sub-title="accueil.sous_titre_compteur"
    ></perf-count>
    <div class="flex flex-row flex-wrap md:py-8 py-2">
      <div
        v-for="product in featuredProducts"
        :key="product.id"
        class="w-full py-1 md:py-0 md:w-1/2"
      >
        <product :product="product"></product>
      </div>
    </div>
    <two-covers class="md:py-8 py-2"></two-covers>
    <landing-item :description="accueil.description_text" buttonLink="/products"></landing-item>
    <h2 class="section-title mt-4">
      Des Solutions personalisables pour tout les goûts
    </h2>
    <large-color-carousel :colors="colors"></large-color-carousel>
  </div>
</template>

<script>
import product from "~/components/product-item.vue";
import landingItem from "~/components/landing-item.vue";
import perfCount from "~/components/perf-count.vue";
import fourFeatures from "~/components/four-features.vue";
import largeColorCarousel from "~/components/large-color-carousel.vue";
import twoCovers from "~/components/two-covers.vue";
import largeCarousel from "~/components/large-carousel.vue";

export default {
  async asyncData({ $strapi }) {
    const featuredProducts = $strapi.find("products", { _limit: 4 });
    const sliders = $strapi.find("sliders", { _limit: 5 });
    const colors = $strapi.find("colors", { _limit: 5 });
    const accueilInfo = $strapi.find("page-accueil");

    let apiData = await Promise.all([
      featuredProducts,
      sliders,
      colors,
      accueilInfo,
    ]);
    return {
      featuredProducts: apiData[0],
      sliders: apiData[1],
      colors: apiData[2],
      accueil: apiData[3],
    };
  },
  components: {
    product,
    landingItem,
    perfCount,
    fourFeatures,
    largeColorCarousel,
    twoCovers,
    largeCarousel,
  },
};
</script>

<style scoped>
</style>
