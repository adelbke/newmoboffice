<template>
  <main class="">
    <section
      class="max-w-screen-xl mx-auto flex flex-col justify-center md:p-4"
    >
      <login-form v-on:logged-in="connected"></login-form>
    </section>
  </main>
</template>

<script>
import loginForm from '~/components/auth/login-form.vue'
export default {
  methods:{
    connected(){
      this.$router.push('/')
    }
  },
  middleware: ['authenticated'],
  components:{ loginForm }
}
</script>

<style>
</style>