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
            sm:items-center
            sm:justify-center
          "
        >
          <div class="flex items-center">
            <div class="hidden sm:block sm:mr-6">
              <div class="flex space-x-4">
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
            <img
              class="block lg:hidden w-auto"
              src="~assets/svg/logo-newmob.svg"
              alt=""
            />
            <img
              class="hidden lg:block w-auto"
              src="~assets/svg/logo-newmob.svg"
              alt=""
            />
          </div>
          <div class="hidden sm:block sm:ml-6">
            <div class="flex space-x-4">
              <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
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
            pr-2
            sm:absolute
            sm:inset-auto
            sm:ml-6
            sm:pr-0
          "
        >
          <button class="right-nav snipcart-checkout relative">
            <img class="" src="~assets/svg/bag.svg" alt="" />
            <span
              class="
                rounded-full
                text-xs
                text-white
                bg-newmob-red
                top-0
                p-1
                absolute
                snipcart-total-items
              "
            ></span>
          </button>
          <button class="right-nav">
            <img class="" src="~assets/svg/user.svg" alt="" />
          </button>
          <button class="right-nav" @click="$modal.show('search-modal')">
            <img class="" src="~assets/svg/search.svg" alt="" />
          </button>

          <!-- search Modal -->
          <modal
            height="auto"
            width="75%"
            :classes="'flex flex-shrink w-36 overflow-visible shadow-lg'"
            name="search-modal"
          >
            <div slot="top-right">
              <button
                class="text-gray-300"
                @click="$modal.hide('search-modal')"
              >
                <svg
                  class="w-6 h-6"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    fill-rule="evenodd"
                    d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
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
              placeholder="Recherchez nos produits"
              type="text"
              name="search"
              autofocus
            />
          </modal>
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
import 'animate.css';

export default {
  components:{
    navItem
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
        {
          name: "produits",
          page: "/products",
          link: "http://google.com",
        },
        {
          name: "catalogue",
          page: "/catalogue",
        },
      ],
      navItemsRight:[
        {
          name: "Contact",
          page: "/contact",
        },
        {
          name: "à propos",
          page: "/about",
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
.nav-item-lg {
  @apply text-gray-500 hover:text-gray-700 font-nunito capitalize bg-white px-3 py-2 rounded-md text-sm font-semibold;
}
.right-nav {
  @apply bg-white px-1 sm:px-2 py-1 outline-none sm:mx-2;
}
</style>