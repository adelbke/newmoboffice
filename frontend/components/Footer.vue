<template>
  <div class="flex flex-col items-center bg-newmob-red-100">
    <div class="flex flex-row flex-wrap w-full py-2 md:py-4 px-2 md:px-4">
      <div class="w-full md:w-2/3 mb-2 md:mb-0 h-64 md:h-96">
        <client-only>
          <iframe
            src="http://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3207.1724673939575!2d2.8469992153449493!3d36.50169868001116!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x128f0bcefa9476d7%3A0x327387a486e50ff3!2sNew%20Mob%20Office!5e0!3m2!1sen!2sdz!4v1643553056031!5m2!1sen!2sdz"
            width="100%"
            height="100%"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            defer
          ></iframe>
        </client-only>
      </div>
      <div
        class="
          w-full
          md:w-1/3
          h-64
          md:h-96
          overflow-hidden
          flex flex-row
          justify-center
        "
      >
        <client-only>
          <facebook></facebook>
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
          mx-1
          md:mx-2
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
        class="flex flex-row justify-between py-4 items-center text-gray-300"
      >
        <span class="text-md font-medium">&copy; Newmoboffice 2021 </span>
        <div class="flex flex-row">
          <template
            v-for="number in numbers"
          >
            <a
              v-if="number"
              class="mr-1 md:mr-2 hover:text-white"
              :href="'tel:' + number"
              :key="number"
            >
              <phone-icon
                v-tooltip.top="{
                  content: number,
                  classes: 'bg-white p-1 text-gray-800 rounded-full text-newmob-red',
                }"
              ></phone-icon>
            </a>
          </template>
          <a
            class="mr-1 md:mr-2 hover:text-white"
            v-if="!!$store.state.contactInfo.page_facebook"
            :href="$store.state.contactInfo.page_facebook"
          >
            <facebook-logo></facebook-logo>
          </a>
          <a
            v-if="!!$store.state.contactInfo.page_insta"
            :href="$store.state.contactInfo.page_insta"
            class="mr-1 md:mr-2 hover:text-white"
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
import facebookLogo from "~/components/icons/facebook.vue";
import phoneIcon from "~/components/icons/phone.vue";
import instagramLogo from '~/components/icons/instagram.vue'
import facebook from '~/components/social-media/facebook.vue'
import { VTooltip } from "v-tooltip";

export default {
  components: {
    logo,
    facebookLogo,
    facebook,
    instagramLogo,
    phoneIcon
  },
  directives: {
    tooltip: VTooltip,
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
  computed:{
    numbers(){
      return this.$store.state.contactInfo.num_tel.split(',')
    }
  }
};
</script>

<style>
.emoji {
  font-size: 30px;
}
.map-responsive {
  overflow: hidden;
  padding-bottom: 56.25%;
  position: relative;
  height: 0;
}

.map-responsive iframe {
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  position: absolute;
}
</style>
