<template>
  <splide :options="sliderOptions" class="py-8 md:ml-8 mx-1">
    <splide-slide v-for="i in [1, 2, 3, 4, 5, 6, 7, 8, 9]" :key="i">
      <color-item></color-item>
    </splide-slide>
  </splide>
</template>

<script>
import colorItem from "~/components/color-item.vue";
export default {
  components: {
    colorItem,
  },
  data() {
    return {
      sliderOptions: {
        arrows: true,
        perPage: 4,
        pagination: false,
        autoplay: true,
        gap: "1rem",
        breakpoints:{
          640:{
            perPage:2
          }
        }
      },
    };
  },
};
</script>

<style>
</style>