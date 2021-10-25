<template>
  <section class="bg-transparent max-w-screen-xl mx-auto md:py-6 md:my-6 py-2">
    <h2 class="text-black font-bold font-nunito md:text-4xl text-2xl px-2 md:px-0">
      Benefits of working with us
    </h2>
    <div class="flex flex-row flex-wrap">
      <div v-for="i in [1, 2, 3, 4]" :key="i" class="flex flex-row w-full md:w-1/2 md:p-4 lg:p-6 p-3">
        <div class="flex flex-col">
          <div class="bg-white p-3 md:p-4 rounded-full">
            <img class="w-14" src="~assets/svg/feature2.svg" alt="" />
          </div>
        </div>
        <div class="flex flex-col pl-2">
          <h4 class="text-xl font-nunito font-semibold">
            Time zones ain’t no thing
          </h4>
          <p class="text-sm">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis et
            sed nam sem tellus erat.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {};
</script>

<style>
</style>