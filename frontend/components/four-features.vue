<template>
  <section class="bg-transparent max-w-screen-xl mx-auto md:py-6 md:my-6 py-2">
    <h2
      class="text-black font-bold font-nunito md:text-4xl text-2xl px-2 md:px-0"
    >
      Benefits of working with us
    </h2>
    <div class="flex flex-row justify-evenly flex-wrap">
      <div
        v-for="feature in features"
        :key="feature.id"
        class="flex flex-row w-full md:w-1/2 md:p-4 lg:p-6 p-3"
      >
        <div class="flex flex-col">
          <div class="bg-white w-14 h-14 p-2 rounded-full">
            <img class="w-14 h-14" :src="getStrapiMedia(feature.icone.url)" alt="" />
          </div>
        </div>
        <div class="flex flex-col pl-2">
          <h4 class="text-xl font-nunito font-semibold" v-text="!!feature.titre ? feature.titre : ''">
            Time zones ain’t no thing
          </h4>
          <p class="text-sm" v-text="!!feature.description ? feature.description : ''">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis et
            sed nam sem tellus erat.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  props:{
    features:{
      type: Array,
      default: function () {
        return []
      }
    }
  },
  methods:{
    getStrapiMedia
  }
};
</script>

<style>
</style>