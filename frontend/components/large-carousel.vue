<template>
  <client-only>
    <splide :options="slideOptions">
      <splide-slide v-for="slide in slides" :key="slide.id">
        <h2
          class="
            section-title
            text-white
            font-bold
            font-nunito
            text-shadow-dark
            absolute
            bottom-12
            sm:bottom-1/3 sm:ml-2
          "
          v-text="slide.title"
        ></h2>
        <p
          class="
            font-nunito
            text-md
            sm:text-lg
            text-shadow-dark
            absolute
            bottom-8
            sm:bottom-1/4 sm:ml-4
            text-white
          "
          v-text="slide.small_description"
        ></p>
        <img :src="getStrapiMedia(slide.image.url)" alt="" />
      </splide-slide>
    </splide>
  </client-only>
</template>

<script>
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  methods:{
    getStrapiMedia
  },
  props:['slides'],
  data() {
    return {
      slideOptions: {
        arrows: false,
        autoplay: true,
        cover: true,
        height:'30rem',
        breakpoints:{
          640:{
            height:'15rem'
          }
        }
      },
    };
  },
};
</script>

<style>
</style>