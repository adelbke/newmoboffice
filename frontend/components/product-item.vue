<template>
  <article
    class="
      flex flex-row flex-wrap
      bg-white
      border-newmob-red border-2
      rounded-tl-xl rounded-br-xl
      p-2
      shadow-lg
      m-1
      md:m-2
    "
  >
    <div class="w-full lg:w-1/2 h-64">
      <splide :options="slideOptions">
        <splide-slide>
          <img src="/product-image.png" alt="" />
        </splide-slide>
        <splide-slide>
          <img src="/product-image.png" alt="" />
        </splide-slide>
        <splide-slide>
          <img src="/product-image.png" alt="" />
        </splide-slide>
        <splide-slide>
          <img src="/product-image.png" alt="" />
        </splide-slide>
      </splide>
    </div>
    <!-- <div class="w-1/2 h-64">
      </div> -->
    <div class="w-10/12 lg:w-5/12 flex flex-col p-2">
      <h2 class="md:text-xl text-md font-nunito font-bold leading-5">
        Bureau SAM
      </h2>
      <small class="text-xs text-gray-700 font-light">1.60m /1.60m</small>
      <pre class="md:text-sm text-xs font-nunito whitespace-pre-line">
- Bureau de direction SAM
- Avec caisson et retour fixe
- 50% MDF Couleur teak blanc + mélaminé gris
- 50% MDF Couleur panama marron gloss + mélaminé gris
        </pre
      >
    </div>
    <div class="w-2/12 lg:w-1/12 flex flex-col justify-between items-center">
      <div
        class="
          rounded-full
          bg-newmob-red
          text-white
          md:text-sm
          text-xs
          md:-ml-4
          md:px-2
          px-1
        "
      >
        Nouveau
      </div>
      <div>
        <img
          v-for="i in [1, 2, 3]"
          :key="i"
          v-tooltip.left="{ content: 'Teak Blanc', classes: tooltipClasses }"
          src="/wood_color.png"
          alt=""
          class="rounded-full w-6 md:w-8 my-1"
        />
        <!-- <img src="/wood_color.png" alt="" class="rounded-full w-8 my-1">
          <img src="/wood_color.png" alt="" class="rounded-full w-8 my-1"> -->
      </div>
    </div>
  </article>
</template>

<script>
// tooltip component
import { VTooltip } from "v-tooltip";

export default {
  directives: {
    tooltip: VTooltip,
  },
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

.splide__pagination__page.is-active{
  background: #aaa;
  transform: scale(1.4);
}
</style>