<template>
  <section class="bg-topography py-2 md:py-8">
    <div class="flex flex-col max-w-screen-lg mx-auto items-stretch my-6">
      <h2
        class="
          text-center text-white
          font-nunito
          md:text-4xl
          text-3xl
          font-bold
        "
        v-text="!!title ? title : ''"
      >
        Some count that matters
      </h2>
      <h4 class="text-center text-white font-nunito md:text-lg text-md" v-text="!!subTitle ? subTitle : ''">
        Our achievement in the journey depicted in numbers
      </h4>
      <div class="flex flex-row text-white justify-evenly md:mt-4 mt-4">
        <div
          class="bg-transparent w-1/4 px-4 my-4 text-center flex flex-col"
          :class="{
            'border-r border-gray-400': index < numberItems.length - 1,
          }"
          v-for="(thing, index) in performances"
          :key="thing.id"
        >
          <span class="md:text-4xl text-3xl font-bold font-nunito">{{
            thing.valeur_performance
          }}</span>
          <span
            class="
              text-sm
              whitespace-pre-line
              md:text-md
              font-nunito font-semibold
            "
            >{{ thing.titre_performance }}
          </span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      numberItems: [
        {
          valeur_performance: 5,
          titre_performance: "Service Geographics",
        },
        {
          valeur_performance: 30,
          titre_performance: "Fortune 500 Clients",
        },
        {
          valeur_performance: 300,
          titre_performance: "Dedicated Members",
        },
        {
          valeur_performance: 8,
          titre_performance: "Years of Journey",
        },
      ],
    };
  },
  props:{
    performances:{
      type: Array,
      default(){
        return numberItems
      }
    },
    title:{
      type: String
    },
    subTitle:{
      type: String
    }
  }
};
</script>

<style scoped>
/* stylesheet containing the bg-pattern class css */
@import "~assets/css/patterns.css";
</style>