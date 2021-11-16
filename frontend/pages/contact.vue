<template>
  <main>
    <maps class="w-full h-60 md:h-96"></maps>
    <h2 class="py-2 md:py-4 text-center font-nunito text-2xl md:text-3xl font-bold text-gray-800">
        Contactez nous
    </h2>
    <div class="flex flex-row">
      <div class="w-full sm:w-1/2">
        <contact-form></contact-form>
      </div>
    </div>
  </main>
</template>

<script>
import maps from '~/components/social-media/maps.vue'
import contactForm from '~/components/contact-form.vue'
export default {
  components:{ maps, contactForm }
}
</script>

<style>

</style>