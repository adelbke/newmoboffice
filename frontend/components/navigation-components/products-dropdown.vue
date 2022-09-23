<template>
  <v-popover trigger="hover" :container="false" :auto-hide="false" placement="bottom-end">
    <nav-item
      :name="name"
      :page="link"
      class="nav-item-lg flex tooltip-target"
    ></nav-item>
    <template slot="popover">
      <div
        class="
          bg-white
          text-gray-500
          hover:text-gray-700
          font-bold font-nunito
          flex
          flex-col
          py-1
          border
          border-gray-600
          shadow-md
          rounded-lg
        "
      >
        <h2 class="font-nunito text-2xl text-gray-800 font-bold my-1 ml-1 mr-8">Nos Catégories</h2>
        <NuxtLink
          class="bg-white p-1 hover:bg-newmob-red-100 hover:text-white"
          v-for="category in categories"
          :key="category.id"
          v-text="category.name"
          :to="`/category/${category.slug}`"
        ></NuxtLink>
        <!-- <products-dropdown v-for="category in categories" :key="category.id" :id="category.id">

        </products-dropdown> -->
      </div>
    </template>
  </v-popover>
</template>

<script>
import navItem from './nav-item.vue'

// import Vue from 'vue'
import { VPopover } from 'v-tooltip'

export default {
  name: 'products-dropdown',
  components:{
    navItem,
    VPopover    
  },
  async mounted(){
    if(Object.keys(this.$store.state.category.categories).length === 0){
      this.$store.dispatch('category/fetchCategories')
    }
  },
  props:{
    id:{
      type: Number,
      default: null
    }
  },
  computed: {
    categories(){
      return this.$store.getters['category/byParentId'](this.id)
    },
    name(){
      if(this.id == null){
        return 'Catégories'
      }else{
        return this.$store.getters['category/byId'](this.id).name
      }
    },
    link(){
      if(this.id == null){
        return '#'
      }else{
        return '/category/' + this.$store.getters['category/byId'](this.id).slug
      }
    }
  }
}
</script>

<style>
</style>