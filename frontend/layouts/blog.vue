<template>
  <div class="self-stretch">
    <div id="fb-root"></div>
    <navbar />
    <!-- <Buttons /> -->
    <main class="min-h-screen">
      <Nuxt class="flex-grow" />
    </main>
    <Footer />
  </div>
</template>

<script>
import navbar from './../components/Navbar.vue'
import Footer from './../components/Footer'

export default {
  components: {
    navbar,
    Footer,
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