<template>
  <div class="self-stretch">
    <div id="fb-root"></div>
    <call-us></call-us>
    <div class="bg-newmob-red flex flex-row justify-end px-1 sm:px-2">
      <NuxtLink
        v-if="!loggedIn"
        to="/login"
        class="text-white hover:underline text-sm"
        >Se Connecter</NuxtLink
      >
      <NuxtLink
        v-else
        to="/"
        class="text-white hover:underline text-sm"
        >Bienvenue, {{ username }}</NuxtLink
      >
    </div>
    <NavBar />
    <!-- <Buttons /> -->
    <main class="bg-newmob-gray min-h-screen">
      <Nuxt class="flex-grow" />
    </main>
    <Footer />
  </div>
</template>

<script>
import NavBar from './../components/Navbar'
import Footer from './../components/Footer'
import callUs from './../components/social-media/call-us.vue'
export default {
  mounted(){
    this.$store.dispatch('fetchCredentials')
  },
  components: {
    NavBar,
    Footer,
    callUs
  },
  computed:{
    loggedIn(){
      let user = this.$strapi.user;
      return !!user ? true : false
    },
    username(){
      return this.loggedIn ? this.$strapi.user.username : ''
    }
  }
}
</script>
<style>
.section-title {
  @apply text-3xl md:text-4xl text-center capitalize font-nunito;
}
.text-shadow-dark {
  text-shadow: 2px 4px 5px #000000;
}
</style>