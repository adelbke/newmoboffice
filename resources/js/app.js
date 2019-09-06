/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */


require('popper.js').default;
// require('jquery').default;
require('./bootstrap');

window.Vue = require('vue');

// importing VueLazyload
import VueLazyload from 'vue-lazyload';
 
Vue.use(VueLazyload);

// importing vue-upload-multiple-image

import VueUploadMultipleImage from 'vue-upload-multiple-image';
 
export default {
  components: {
    VueUploadMultipleImage,
  },
}


import "jquery-zoom";

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('collection-component', require('./components/CollectionComponent.vue').default);

Vue.component('product-component',require('./components/ProductComponent.vue').default);

Vue.component('largeproduct-component',require('./components/LargeProductComponent.vue').default);

Vue.component('productdescription-component',require('./components/ProductDescriptionComponent.vue').default);

Vue.component('disable-retailer',require('./components/DisableRetailer.vue').default);

Vue.component('enable-retailer',require('./components/EnableRetailer.vue').default);

Vue.component('category-form',require('./components/categoryFormComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});

