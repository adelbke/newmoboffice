<template>
  <!-- This example requires Tailwind CSS v2.0+ -->
  <nav class="bg-white py-0 sm:py-2 filter drop-shadow-xl z-10 sticky top-0">
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
      <div class="relative flex items-center justify-between">
        <div class="inset-y-0 left-0 flex items-center sm:hidden">
          <client-only>
            <tasty-burger-button
              class="
                flex
                items-center
                justify-center
                p-2
                rounded-md
                text-gray-400
                hover:text-white
                focus:outline-none
              "
              :type="'slider'"
              :active="false"
              :size="'s'"
              :color="'#7E1601'"
              :active-color="'#7E1601'"
              @toggle="toggleNav"
            />
          </client-only>
        </div>
        <div
          class="
            flex-1 flex
            items-center
            justify-center
            sm:items-center sm:justify-center
          "
        >
          <div class="flex items-center">
            <div class="hidden sm:block sm:mr-6">
              <div class="flex space-x-4">
                <products-dropdown></products-dropdown>
                <nav-item
                  v-for="item in navItemsLeft"
                  :key="item.name"
                  :name="item.name"
                  :page="item.page"
                  :link="item.link"
                  :class="'nav-item-lg'"
                ></nav-item>
              </div>
            </div>
            <NuxtLink to="/">
              <logo class="transition-transform duration-75 ease-in transform hover:scale-105"></logo>
            </NuxtLink>
          </div>
          <div class="hidden sm:block sm:ml-6">
            <div class="flex space-x-4">
              <nav-item
                v-for="item in navItemsRight"
                :key="item.name"
                :name="item.name"
                :page="item.page"
                :link="item.link"
                :class="'nav-item-lg'"
              ></nav-item>
            </div>
          </div>
        </div>
        <div
          class="
            inset-y-0
            sm:right-0
            flex
            items-center
            text-gray-600
            sm:absolute sm:inset-auto sm:ml-6 sm:pr-0
          "
        >
          <cart class="right-nav relative"></cart>
          <!-- <button class="right-nav" v-if="!!$strapi.getToken()">
            <img class="" src="~assets/svg/user.svg" alt="" />
          </button> -->
          <profile-menu class="right-nav"></profile-menu>
          <button class="right-nav" @click="$modal.show('search-modal')">
            <search-icon></search-icon>
          </button>

          <!-- search Modal -->
          <search-modal></search-modal>
        </div>
      </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div
      class="sm:hidden animate__animated animate__fadeInDown z-0"
      :class="{ hidden: navMenuClosed }"
    >
      <div class="px-2 pt-2 pb-3 space-y-1">
        <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
        <products-dropdown></products-dropdown>
        <nav-item
          v-for="item in navItems"
          :key="item.name"
          :name="item.name"
          :page="item.page"
          :link="item.link"
          :class="['nav-item-lg', 'block']"
        ></nav-item>
      </div>
    </div>
  </nav>
</template>

<script>
import navItem from '~/components/navigation-components/nav-item.vue'
import cart from '~/components/cart.vue'
import closeIcon from '~/components/icons/close.vue'
import searchIcon from '~/components/icons/search.vue'

import productsDropdown from '~/components/navigation-components/products-dropdown.vue'

import profileMenu from '~/components/auth/profile-menu.vue'
import searchModal from '~/components/search-modal.vue'
import logo from '~/components/icons/logo.vue'
import 'animate.css';

export default {
  components:{
    productsDropdown,
    logo,
    navItem,
    closeIcon,
    cart,
    searchModal,
    profileMenu,
    searchIcon
  },
  methods:{
    toggleNav (){
      this.navMenuClosed = !this.navMenuClosed
    }
  },
  data() {
    return {
      navMenuClosed: true,
      searchModalIsOpen: false,
      navItemsLeft: [
        // {
        //   name: "produits",
        //   page: "/products",
        // },
        {
          name: "catalogue",
          link: "https://heyzine.com/flip-book/6efcfd76d5.html",
        },
      ],
      navItemsRight:[
        {
          name: "Contact",
          page: "/contact",
        },
        {
          name: "Blog",
          page: "/blog",
        },
      ]
    };
  },
  computed: {
    navItems: function () {
      return this.navItemsLeft.concat(this.navItemsRight);
    }
  }
};
</script>

<style scoped>
.right-nav {
  @apply bg-white text-gray-700 px-1 sm:px-2 py-1 outline-none sm:mx-2;
}
</style>