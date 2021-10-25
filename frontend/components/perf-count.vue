<template>
  <section class="bg-topography py-2 md:py-8">
    <div class="flex flex-col max-w-screen-lg mx-auto items-stretch my-6">
      <h2 class="text-center text-white font-nunito md:text-4xl text-3xl font-bold">
        Some count that matters
      </h2>
      <h4 class="text-center text-white font-nunito md:text-lg text-md">
        Our achievement in the journey depicted in numbers
      </h4>
      <div class="flex flex-row text-white justify-evenly md:mt-4 mt-4">
        <div
          class="bg-transparent w-1/4 px-4 my-4 text-center flex flex-col"
          :class="{'border-r border-gray-400': index < numberItems.length - 1}"
          v-for="thing,index in numberItems"
          :key="thing.text"
        >
          <span class="md:text-4xl text-3xl font-bold font-nunito">{{thing.number}}</span>
          <span class="text-sm whitespace-pre-line md:text-md font-nunito font-semibold">{{thing.text}} </span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
    data(){
        return{
            numberItems:[
                {
                    number:5,
                    text:'Service Geographics'
                },
                {
                    number:30,
                    text:'Fortune 500 Clients'
                },
                {
                    number:300,
                    text:'Dedicated Members'
                },
                {
                    number:8,
                    text:'Years of Journey'
                }
            ]
        }
    }
};
</script>

<style scoped>
/* stylesheet containing the bg-pattern class css */
@import "~assets/css/patterns.css";
</style>