export default {
  /*
   ** Nuxt target
   ** See https://nuxtjs.org/api/configuration-target
   */
  target: 'static',
  /*
   ** Headers of the page
   ** See https://nuxtjs.org/api/configuration-head
   */

  //  <script src="https://cdn.snipcart.com/themes/v3.0.16/default/snipcart.js"></script>

  head: {
    htmlAttrs:{
      lang:'fr'
    },
    title: "Buy stickers with Strapi, Nuxt.js and Snipcart",
    meta: [{
        charset: 'utf-8'
      },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1'
      },
      {
        hid: 'description',
        name: 'description',
        content: "e-commerce starter using Strapi, Nuxt.js and Snipcart"
      }
    ],
    link: [
      // Nunito from Google font
      {
        rel:'preconnect',
        href:'https://fonts.googleapis.com'
      },
      {
        rel:'preconnect',
        href:'https://fonts.gstatic.com',
        crossorigin:true
      },
      {
        href:'https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;600;700&display=swap',
        rel:'stylesheet'
      },
      {
        rel: 'preconnect',
        href: "https://app.snipcart.com"
      },
      {
        rel: 'preconnect',
        href: "https://cdn.snipcart.com"
      },
      {
        rel: 'stylesheet',
        href: "https://cdn.snipcart.com/themes/v3.0.16/default/snipcart.css"
      },
      {
        rel: 'icon',
        type: 'image/x-icon',
        href: '/favicon.ico'
      }
    ],
    script: [{
      src: 'https://cdn.snipcart.com/themes/v3.0.16/default/snipcart.js'
    }]
  },
  /*
   ** Global CSS
   */
  css: [],
  /*
   ** Plugins to load before mounting the App
   ** https://nuxtjs.org/guide/plugins
   */
  plugins: [
    { src: '~/plugins/vue-splide.js', ssr: false },
    { src: '~/plugins/vue-modal.js', ssr: false },
    { src: '~plugins/tasty-burger.client.js', ssr: false },
    { src: '~plugins/vue-toast.js', ssr: false }
  ],
  /*
   ** Auto import components
   ** See https://nuxtjs.org/api/configuration-components
   */
  components: true,
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [
    // Doc: https://github.com/nuxt-community/nuxt-tailwindcss
    '@nuxtjs/tailwindcss'
    // '@nuxtjs/eslint-module',
  ],
  /*
   ** Nuxt.js modules
   */
  modules: ['@nuxtjs/strapi'],
  strapi: {
    url: process.env.API_URL || "http://localhost:1337",
    entities: [
      'Products',
      'Categories'
    ],
  },
  env: {
    STRAPI_URL: 'http://localhost:1337',
    storeUrl: process.env.STORE_URL || "http://localhost:1337"
  },
  
  privateRuntimeConfig: {
    strapi:{
      url:'http://strapi:1337',
      entities: [
        'Products',
        'Categories'
      ],
    }
  },
  
  /*
   ** Build configuration
   ** See https://nuxtjs.org/api/configuration-build/
   */
  build: {}
}
