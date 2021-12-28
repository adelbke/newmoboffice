<template>
  <div class="flex flex-col items-center bg-newmob-red-100">
    <div class="max-w-screen-lg mx-auto p-4">
      <logo white></logo>
    </div>
    <div class="flex flex-row justify-center p-4">
      <NuxtLink
        class="
          text-gray-300
          hover:text-white hover:font-bold hover:underline
          mx-2
          capitalize
        "
        v-for="link in links"
        :key="link.name"
        v-text="link.name"
        :to="link.link"
      ></NuxtLink>
    </div>
    <div class="border-t border-gray-400 max-w-screen-lg mx-auto w-full">
      <div class="flex flex-row justify-between py-4 items-center text-gray-300">
        <span class="text-md font-medium"
          >&copy; Newmoboffice 2021
        </span>
        <div class="flex flex-row">
          <a v-if="!! $store.state.contactInfo.num_tel" class="mr-1 md:mr-2" :href="`tel:${$store.state.contactInfo.num_tel}`" >
            <phone-icon></phone-icon>
          </a>
          <a class="mr-1 md:mr-2" v-if="!! $store.state.contactInfo.page_facebook" :href="$store.state.contactInfo.page_facebook">
            <facebook-logo></facebook-logo>
          </a>
          <a v-if="!! $store.state.contactInfo.page_insta" :href="$store.state.contactInfo.page_insta">
            <instagram-logo></instagram-logo>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import logo from "~/components/icons/logo.vue";
import facebook from "~/components/icons/facebook.vue";
import phoneIcon from "~/components/icons/phone.vue";
import instagramLogo from '~/components/icons/instagram.vue'
export default {
  components: {
    logo,
    facebookLogo: facebook,
    instagramLogo,
    phoneIcon,
  },
  data() {
    return {
      links: [
        {
          name: "à propos",
          link: "/about",
        },
        {
          name: "Catalogue",
          link: "/about",
        },
        {
          name: "Contactez Nous",
          link: "/contact",
        },
        {
          name: "produits",
          link: "/prod",
        },
      ],
    };
  },
};
</script>

<style>
.emoji {
  font-size: 30px;
}
</style>
