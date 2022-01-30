<template>
  <div>
    <img
      v-tooltip.left="{
        content: name,
        classes: tooltipClasses,
      }"
      :src="getStrapiMedia(url)"
      alt=""
      class="rounded-full w-6 h-6 md:w-12 md:h-12"
    />
  </div>
</template>

<script>
import { VTooltip } from "v-tooltip";
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  methods:{
    getStrapiMedia
  },
  directives: {
    tooltip: VTooltip,
  },
  props:{
    url:String,
    name:String
  },
  data(){
    return {
      tooltipClasses: [
        "bg-newmob-red",
        "text-white",
        "text-xs",
        "rounded-full",
        "p-1 mr-1",
      ],
    }
  }
}
</script>

<style>
</style>