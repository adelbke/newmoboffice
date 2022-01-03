<template>
  <article class="flex flex-col">
    <div
      class="rounded-t-lg h-48 background-style"
      :style="'background-image: url(' + colorImage(color) + ');'"
    ></div>
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
    ></div>
  </article>
</template>

<script>
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  props:['color'],
  methods:{
    getStrapiMedia,
    colorImage(color){
      return getStrapiMedia(color?.image?.url ? color?.image?.url : '')
    }
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