<template>
  <article class="flex flex-col">
    <div class="rounded-t-lg h-48 background-style" :style="'background-image: url(' + getStrapiMedia(color.image.url) + ');'"></div>
    <div
      class="
        bg-white
        text-center
        font-semibold font-nunito
        md:text-lg
        text-md
        py-1
      "
      v-text="color.name"
    >
    
    </div>
  </article>
</template>

<script>
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  props:['color'],
  methods:{
    getStrapiMedia
  }
};
</script>

<style scoped>
.background-style {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
</style>