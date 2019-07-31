/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */


require('popper.js').default;
// require('jquery').default;
// require('./bootstrap');

window.Vue = require('vue');

// import ZoomOnHover from "vue-zoom-on-hover";
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

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});

$(document).ready(function(){$(".dropdown-menu a.dropdown-toggle").on("click",function(o){var s=$(this);s.toggleClass("active-dropdown");var n=$(this).offsetParent(".dropdown-menu");$(this).next().hasClass("show")||$(this).parents(".dropdown-menu").first().find(".show").removeClass("show");var e=$(this).next(".dropdown-menu");return e.toggleClass("show"),$(this).parent("li").toggleClass("show"),$(this).parents("li.nav-item.dropdown.show").on("hidden.bs.dropdown",function(o){$(".dropdown-menu .show").removeClass("show"),s.removeClass("active-dropdown")}),n.parent().hasClass("navbar-nav")||s.next().css({top:s[0].offsetTop,left:n.outerWidth()-4}),!1})});