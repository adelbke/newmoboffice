<template>
  <main>
    <h2 class="main-title">Nos produits</h2>
    <section class="container mx-auto flex flex-row flex-wrap">
      <div
        class="w-full md:w-1/2"
        v-for="product in products"
        :key="product.id"
      >
        <product-item :product="product"></product-item>
      </div>
    </section>
      <t-pagination
        :total-items="productsCount"
        :per-page="10"
        v-model="currentPage"
      />
      </pagination>
      <!-- <v-paginator :per-page="10" layout="div" :total="productsCount" @changePage="pageChange"/> -->
  </main>
</template>

<script>
import productItem from "~/components/product-item.vue";
import { TPagination } from "vue-tailwind/dist/components";
import Vue from "vue";
import VueTailwind from "vue-tailwind";

const settings = {
  "t-pagination": {
    component: TPagination,
    props: {
      classes: {
        wrapper: "table border-collapse text-center bg-white mx-auto shadow-sm",
        element:
          "w-8 h-8 border border-gray-200 table-cell hover:border-blue-100",
        activeElement:
          "w-8 h-8 border border-gray-200 border-blue-500 table-cell hover:border-blue-600",
        disabledElement: "w-8 h-8 border border-gray-200 table-cell",
        ellipsisElement: "w-8 h-8 border border-gray-200 hidden md:table-cell",
        activeButton:
          "bg-blue-500 w-full h-full text-white hover:bg-blue-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50",
        disabledButton:
          "opacity-25 w-full h-full cursor-not-allowed transition duration-100 ease-in-out",
        button:
          "hover:bg-blue-100 w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50",
        ellipsis: "",
      },
      variants: {
        rounded: {
          wrapper: "bg-white mx-auto text-center flex space-x-2",
          element: "w-8 h-8 rounded-full",
          activeElement: "w-8 h-8 rounded-full",
          disabledElement: "w-8 h-8 rounded-full",
          ellipsisElement: "w-8 h-8 rounded-full hidden md:inline",
          activeButton:
            "border border-blue-500 bg-blue-500 w-full h-full rounded-full text-white hover:bg-blue-600 transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50",
          disabledButton:
            "border border-gray-200  opacity-25 w-full h-full rounded-full cursor-not-allowed transition duration-100 ease-in-out",
          button:
            "border border-gray-200 hover:bg-blue-100 hover:border-blue-100 rounded-full w-full h-full transition duration-100 ease-in-out focus:ring-2 focus:ring-blue-500 focus:outline-none focus:ring-opacity-50",
          ellipsis: "",
        },
      },
    },
  },
};

Vue.use(VueTailwind, settings);
export default {
  async asyncData({ $strapi, route }) {
    let page = parseInt(!!route.query.page ? route.query.page : 0);
    const qs = require("qs");
    const filter = {
      _start: page * 10,
      _limit: 10,
    };

    const products = $strapi.find("products", qs.stringify(filter));
    const productsCount = $strapi.count("products", qs.stringify(filter));
    let dataResult = await Promise.all([products, productsCount]);
    return { products: dataResult[0], productsCount: dataResult[1] };
  },
  components: {
    productItem,
    pagination,
  },
  computed: {
    currentPage: {
      get() {
        return parseInt(!!this.$route.query.page ? this.$route.query.page : 1);
      },
      set(value) {
        this.$router.push(`/products?page=${value}`);
      },
    },
  },
};
</script>

<style>
.main-title {
  @apply text-center font-bold text-lg md:text-3xl text-gray-800 font-nunito md:py-4;
}
</style>