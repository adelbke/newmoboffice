<template>
  <section class="flex flex-row flex-wrap p-8 max-screen-lg justify-evenly">
    <div class="w-full md:w-1/2 flex flex-col pb-4 md:pb-0">
      <div class="flex flex-row justify-center items-end mb-2">
        <div class="w-7/12 mr-2 h-80 first-image"></div>
        <div class="w-5/12 ml-2 h-4/5 second-image"></div>
      </div>
      <div class="flex flex-row justify-center items-start mt-2">
        <div class="w-5/12 mr-2 h-4/5 second-image"></div>
        <div class="w-7/12 ml-2 h-80 first-image"></div>
      </div>
    </div>
    <div class="w-full md:w-1/2 flex flex-col justify-center max-w-lg">
      <h2 class="text-4xl font-bold font-nunito" v-text="title">
        When Quality and Performance Count
      </h2>
      <p v-text="description">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis
        tempore quae dolorum rerum eum neque delectus perspiciatis repudiandae,
        tempora ab voluptas ea hic cumque. Aliquid, sunt. Earum iusto hic velit?
      </p>
      <div class="flex mt-1 md:mt-2">
        <a
          class="bg-newmob-red-100 rounded text-white font-semibold shadow-lg px-2 py-2"
          :href="buttonLink"
          v-text="buttonText"
          >Visitez notre Boutique</a
        >
      </div>
    </div>
  </section>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: "When Quality and Performance Count",
    },
    description: {
      type: String,
      default:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis tempore quae dolorum rerum eum neque delectus perspiciatis repudiandae, tempora ab voluptas ea hic cumque. Aliquid, sunt. Earum iusto hic velit?",
    },
    buttonText: {
      type: String,
      default: "Visitez notre Boutique",
    },
    buttonLink: {
      type: String,
      default: "/",
    },
  },
};
</script>

<style scoped>
.first-image {
  background: url("/Image1.png") no-repeat;
  background-size: cover;
  background-position: center;
}
.second-image {
  background: url("/Image2.png") no-repeat;
  background-size: cover;
  background-position: center;
}
</style>