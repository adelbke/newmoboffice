<template>
  <div class="flex flex-col items-center bg-newmob-red-100">
    <div class="flex flex-row flex-wrap w-full px-1 md:px-4 lg:px-8 my-1 md:my-4">
      <div class="py-2 md:py-0 w-full md:w-1/3">
        <h4 class="text-lg font-nunito font-bold text-white text-center">
          Page Facebook
        </h4>
        <client-only>
          <center>
            <div
              class="fb-page"
              data-href="https://www.facebook.com/Newmoboffice-114119043302408"
              data-tabs="timeline"
              data-width=""
              data-height=""
              data-small-header="false"
              data-adapt-container-width="true"
              data-hide-cover="false"
              data-show-facepile="true"
            >
              <blockquote
                cite="https://www.facebook.com/Newmoboffice-114119043302408"
                class="fb-xfbml-parse-ignore"
              >
                <a href="https://www.facebook.com/Newmoboffice-114119043302408"
                  >Newmoboffice</a
                >
              </blockquote>
            </div>
          </center>
        </client-only>
      </div>
      <div class="py-2 md:py-0 w-full md:w-2/3">
        <client-only>
          <h4 class="text-lg font-nunito font-bold text-white text-center">
            Localisation Maps
          </h4>
          <center>
            <maps></maps>
          </center>
        </client-only>
      </div>
    </div>
    <div class="max-w-screen-lg mx-auto p-4">
      <logo white></logo>
    </div>
    <div class="flex flex-row justify-center p-2 md:p-4">
      <NuxtLink
        class="
          text-gray-300
          hover:text-white hover:font-bold hover:underline
          mx-1 md:mx-2
          capitalize
        "
        v-for="link in links"
        :key="link.name"
        v-text="link.name"
        :to="link.link"
      ></NuxtLink>
    </div>
    <div class="border-t border-gray-400 max-w-screen-lg mx-auto w-full">
      <div
        class="flex flex-row justify-between py-4 px-1 md:px-2 lg:px-4 items-center text-gray-300"
      >
        <span class="text-md font-medium">&copy; Newmoboffice 2021 </span>
        <div class="flex flex-row">
          <a
            v-if="!!$store.state.contactInfo.num_tel"
            class="mr-1 md:mr-2"
            :href="`tel:${$store.state.contactInfo.num_tel}`"
          >
            <phone-icon></phone-icon>
          </a>
          <a
            class="mr-1 md:mr-2"
            v-if="!!$store.state.contactInfo.page_facebook"
            :href="$store.state.contactInfo.page_facebook"
          >
            <facebook-logo></facebook-logo>
          </a>
          <a
            v-if="!!$store.state.contactInfo.page_insta"
            :href="$store.state.contactInfo.page_insta"
          >
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
import maps from '~/components/social-media/maps.vue'
export default {
  components: {
    logo,
    facebookLogo: facebook,
    instagramLogo,
    phoneIcon,
    maps
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
