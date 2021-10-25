<template>
  <splide :options="slideOptions">
    <splide-slide v-for="i in [1, 2, 3, 4]" :key="i">
      <img src="/newmob-cover.jpg" alt="" />
    </splide-slide>
  </splide>
</template>

<script>
export default {
  data() {
    return {
      slideOptions: {
        arrows: false,
        autoplay: true,
        cover: true,
        height:'30rem',
        breakpoints:{
          640:{
            height:'20rem'
          }
        }
      },
    };
  },
};
</script>

<style>
</style>