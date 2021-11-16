<template>
  <client-only>
    <splide :options="sliderOptions" class="py-8 md:ml-8 mx-1">
      <splide-slide v-for="color in colors" :key="color.id">
        <color-item :color="color"></color-item>
      </splide-slide>
    </splide>
  </client-only>
</template>

<script>
import colorItem from "~/components/color-item.vue";
export default {
  components: {
    colorItem,
  },
  props:['colors'],
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