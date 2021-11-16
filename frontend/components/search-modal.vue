<template>
  <modal
    height="auto"
    width="75%"
    @opened="onOpenHandler"
    :classes="'flex flex-shrink w-36 overflow-visible shadow-lg'"
    name="search-modal"
  >
    <div slot="top-right">
      <button class="text-gray-300" @click="$modal.hide('search-modal')">
        <close-icon></close-icon>
      </button>
    </div>
    <input
      class="
        w-full
        text-xl
        font-semibold
        bg-gray-200
        text-gray-800
        p-2
        rounded-md
        outline-none
      "
      ref="email"
      @keyup.enter="pressHandler"

      placeholder="Recherchez nos produits"
      type="text"
      v-model="searchTerm"
      name="search"
      autofocus
    />
  </modal>
</template>

<script>
import closeIcon from '~/components/icons/close.vue'

export default {
  components:{
    closeIcon
  },
  data(){
    return{
      searchModalIsOpen: false,
      searchTerm:''
    }
  },
  methods:{
    onOpenHandler(){
      this.$refs.email.focus()
    },
    pressHandler(){
      const searchRoute = '/search/' + this.searchTerm
      this.$modal.hide('search-modal')
      this.$router.push({ path: searchRoute })
    }
  }
}
</script>

<style>
</style>