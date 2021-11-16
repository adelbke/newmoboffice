<template>
  <v-popover  placement="left-start">
    <button class="tooltip-target outline-none">
      <user-icon class="align-middle"></user-icon>
    </button>
    <template slot="popover" class="z-50">
      <div
        v-if="this.loggedIn"
        class="menu-container tooltip-content"
      >
        <NuxtLink class="menu-button" to="/profile"> profile </NuxtLink>
        <button @click="logout()" class="menu-button flex flex-row items-center justify-between">
          <span class="mr-1">Se déconnecter</span>
          <logout-icon class="ml-1"></logout-icon>
        </button>
      </div>
      <div v-else class="menu-container tooltip-content">
        <NuxtLink class="menu-button" to="/login">Se Connecter</NuxtLink>

        <NuxtLink class="menu-button" to="/register">Créer un Compte</NuxtLink>
      </div>
    </template>
  </v-popover>
</template>

<script>
import { VPopover } from 'v-tooltip'

import logoutIcon from '~/components/icons/logout.vue'
import userIcon from '~/components/icons/user.vue'
import logoutConfirmation from './logout-confirmation.vue'
export default {
  components:{ userIcon, logoutIcon, VPopover, logoutConfirmation },
  computed:{
    loggedIn(){
      return !!this.$strapi.user
    }
  },
  methods:{
    logout(){
      this.$modal.show(logoutConfirmation, {}, {height: 'auto', classes:'rounded-lg'})
    }
  }
}
</script>

<style>
.tooltip {
  z-index: 20;
}
</style>

<style scoped>
.menu-button {
  @apply py-1 px-2 w-40 text-sm hover:bg-newmob-red-100 transition-colors duration-75 ease-in hover:text-white font-bold;
}
.menu-container{
 @apply flex flex-col bg-white py-1 border border-newmob-red rounded-md shadow-2xl
}
</style>