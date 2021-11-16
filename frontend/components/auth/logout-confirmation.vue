<template>
  <div class="border-2 border-newmob-red rounded-lg">
    <div class="p-1 md:p-2">
      <span class="text-lg font-bold font-nunito text-black"
      >Êtes-vous sûr de vouloir vous déconnecter ?</span
    >
    </div>
    <div class="flex flex-row">
      <button class="bg-gray-300 text-gray-700 font-bold font-nunito text-lg py-2 w-1/2">Annuler</button>
      <button @click="logout()" class="bg-red-700 text-white font-bold font-nunito text-lg py-2 w-1/2">Se déconnecter</button>
    </div>
  </div>
</template>

<script>
export default {
  methods:{
    logout(){
      this.$strapi.logout()
      this.$modal.hideAll()
    }
  }
}
</script>

<style>
</style>