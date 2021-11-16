<template>
  <article
    class="
      flex flex-row flex-wrap
      bg-white
      border-newmob-red border-2
      rounded-tl-xl rounded-br-xl
      p-2
      m-1
      md:m-2
    "
  >
    <div class="w-full lg:w-1/2 h-64">
      <client-only>
        <splide :options="slideOptions">
          <splide-slide v-for="image in product.images" :key="image.id">
            <img :src="getStrapiMedia(image.formats.thumbnail.url)" alt="" />
          </splide-slide>
        </splide>
      </client-only>
    </div>
    <!-- <div class="w-1/2 h-64">
      </div> -->
    <div class="w-10/12 lg:w-5/12 flex flex-col p-2">
      <NuxtLink
        :to="'/product/' + product.slug"
        class="
          md:text-xl
          text-md
          font-nunito
          hover:underline
          font-bold
          leading-5
        "
        v-text="product.title"
      >
        Bureau SAM
      </NuxtLink>
      <NuxtLink
        class="
          text-xs text-gray-700
          hover:underline hover:font-normal
          font-light
        "
        :to="'/category/' + product.category.slug"
        v-text="product.category.name"
        >1.60m /1.60m</NuxtLink
      >
      <pre
        class="md:text-sm text-xs font-nunito whitespace-pre-line"
        v-text="product.description"
      ></pre>
      <span class="text-lg font-nunito font-bold capitalize">à partir de {{ this.product.price }}</span>
    </div>
    <div
      v-if="product.new"
      class="w-2/12 lg:w-1/12 flex flex-col justify-between items-center"
    >
      <div
        class="
          rounded-full
          bg-newmob-red
          text-white
          md:text-sm
          text-xs
          md:-ml-4 md:px-2
          px-1
        "
      >
        Nouveau
      </div>
      <div>
        <img
          v-for="color in product.product_colors"
          :key="color.id"
          v-tooltip.left="{
            content: color.color.name,
            classes: tooltipClasses,
          }"
          :src="getStrapiMedia(color.color.image.formats.thumbnail.url)"
          alt=""
          class="rounded-full w-6 md:w-12 my-1"
        />
      </div>
    </div>
  </article>
</template>

<script>
// tooltip component
import { VTooltip } from "v-tooltip";
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  directives: {
    tooltip: VTooltip,
  },
  methods:{
    getStrapiMedia
  },
  props:['product'],
  data() {
    return {
      slideOptions: {
        cover: true,
        arrows: false,
        height: "15rem",
        autoplay: true,
      },
      tooltipClasses: [
        "bg-newmob-red",
        "text-white",
        "text-xs",
        "rounded-full",
        "p-1 mr-1",
      ],
    };
  },
};
</script>

<style scoped>
.background-image {
  background-image: url("/product-image.png");
}

.splide__pagination__page.is-active {
  background: #aaa;
  transform: scale(1.4);
}
.grow-hover{
  @apply transition-transform duration-100 ease-in transform hover:scale-105
}
.red-shadow{
  box-shadow: 11px 11px 17px 1px rgba(99,17,1,0.75);
-webkit-box-shadow: 11px 11px 17px 1px rgba(99,17,1,0.75);
-moz-box-shadow: 11px 11px 17px 1px rgba(99,17,1,0.75);
}
</style>