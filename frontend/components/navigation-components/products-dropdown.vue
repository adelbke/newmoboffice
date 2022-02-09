<template>
  <v-popover trigger="hover" placement="right" class="flex">
    <nav-item
      name="Produits"
      page="/products"
      class="nav-item-lg flex tooltip-target"
    ></nav-item>
    <template slot="popover">
      <div
        class="
          bg-gray-100
          text-gray-500
          hover:text-gray-700
          font-bold font-nunito
          flex
          flex-col
          py-1
          border
          border-gray-700
          rounded-lg
        "
      >
        <NuxtLink
          class="bg-white p-1 hover:bg-newmob-red-100 hover:text-white"
          v-for="category in categories"
          :key="category.id"
          v-text="category.name"
          :to="`/category/${category.slug}`"
        ></NuxtLink>
      </div>
    </template>
  </v-popover>
</template>

<script>
import navItem from './nav-item.vue'

// import Vue from 'vue'
import { VPopover } from 'v-tooltip'

export default {
  components:{
    navItem,
    VPopover    
  },
  async mounted(){
    this.categories = await this.$strapi.find('categories', { parent_null: true })
  },
  data(){
    return{
      categories: []
    }
  }
}
</script>

<style>
</style>