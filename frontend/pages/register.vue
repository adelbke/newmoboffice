<template>
  <main>
    <section class="max-w-screen-xl mx-auto flex flex-col justify-center md:p-4">
      <register-form></register-form>
    </section>
  </main>
</template>

<script>
import registerForm from '~/components/auth/register-form.vue'
export default {
  components: { registerForm }
}
</script>

<style>
</style>