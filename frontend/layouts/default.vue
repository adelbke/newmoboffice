<template>
  <div class="self-stretch">
    <NavBar />
    <!-- <Buttons /> -->
    <main class="bg-newmob-gray min-h-screen">
      <Nuxt class="flex-grow" />
    </main>
    <Footer />
    <div hidden id="snipcart" data-api-key="ODhhNWUxOGEtNTk0OC00OTQwLWJkOWMtM2M1ZmNjODU1ZDJhNjM3MzMyNzM0NjM1OTMyNjcz"></div>
  </div>
</template>

<script>
import NavBar from './../components/Navbar'
import Footer from './../components/Footer'
// import Buttons from './../components/Buttons'

export default {
  components: {
    NavBar,
    Footer,
    // Buttons
  }
}
</script>
