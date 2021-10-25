<template>
  <section>
    <h2 class="text-3xl md:text-4xl text-center capitalize mb-4">TOUT LE MOBILIER POUR VÔTRE BUREAU !</h2>
    <div class="flex flex-row flex-wrap">
      <div class="md:w-1/2 w-full bg-style h-60 md:h-96 relative" style="background:linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6) ), url('/newmob-cover.jpg');background-repeat: no-repeat;background-position: center;background-size: cover;">
        <h2 class="absolute text-4xl font-nunito font-light text-white bottom-0 ml-2 mb-2">NewMobOffice</h2>
      </div>
      <div class="md:w-1/2 w-full bg-style h-60 md:h-96 relative" style="background:linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6) ), url('/sinetica-cover.jpg');background-repeat: no-repeat;background-position: center;background-size: cover;">
        <h2 class="absolute text-4xl font-nunito font-light text-white bottom-0 right-0 md:left-0 md:ml-2 mr-2 md:mr-0 mb-2">SINETICA</h2>
      </div>
    </div>
  </section>
</template>

<script>
export default {};
</script>

<style scoped>
.bg-style{
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
</style>