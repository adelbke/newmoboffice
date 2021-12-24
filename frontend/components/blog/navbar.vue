<template>
  <nav
    class="
      bg-white
      py-0
      sm:py-2
      filter
      z-10
      sticky
      top-0
      flex
      flex-col
      items-center
    "
  >
    <logo></logo>
    <div class="md:ml-4">
      <nav-item
        v-for="item in navs"
        :key="item.name"
        :name="item.name"
        :page="item.page"
        :link="item.link"
        :class="'nav-item-lg'"
      ></nav-item>
    </div>
  </nav>
</template>

<script>
import logo from '~/components/icons/logo.vue'
import navItem from '~/components/navigation-components/nav-item.vue'
export default {
  components:{
    logo,
    navItem
  },
  data() {
    return {
      navs: [
        {
          name:'Nos Articles',
          page:'/blog/articles/'
        },
        {
          name: 'Boutique',
          page: '/products'
        }
      ]
    }
  }
}
</script>

<style>
</style>