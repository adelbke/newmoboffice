export default {
  /*
   ** Nuxt target
   ** See https://nuxtjs.org/api/configuration-target
   */
  target: 'server',
  /*
   ** Headers of the page
   ** See https://nuxtjs.org/api/configuration-head
   */
  head: {
    htmlAttrs: {
      lang: 'fr'
    },
    title: "NewmobOffice",
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
      content: "Bienvenue chez NewMobOffice"
    }
    ],
    link: [
      // Nunito from Google font
      {
        rel: 'preconnect',
        href: 'https://fonts.googleapis.com'
      },
      {
        rel: 'preconnect',
        href: 'https://fonts.gstatic.com',
        crossorigin: true
      },
      {
        href: 'https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;600;700&display=swap',
        rel: 'stylesheet'
      },
      {
        rel: 'icon',
        type: 'image/x-icon',
        href: '/favicon.ico'
      }
    ],
    script: [
      {
        async: true,
        defer: true,
        crossorigin: "anonymous",
        src: "https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v12.0&appId=257374912241023&autoLogAppEvents=1",
        nonce: "YnF9LQqm"
      },
      {
        async: true,
        crossorigin: '*',
        charset: 'UTF-8',
        src: 'https://embed.tawk.to/620e8f4d1ffac05b1d7a6cc6/1fs4dvimu'
      }
    ]
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
  // env: {
  //   STRAPI_URL: 'http://beta.newmoboffice.com/api',
  //   storeUrl: process.env.STORE_URL || "http://beta.newmoboffice.com/api"
  // },


  // router:{
  //   middleware: 'authenticated'
  // },

  privateRuntimeConfig: {
    strapi: {
      url: 'http://newmob_v2_prod_strapi_1:1337',
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
