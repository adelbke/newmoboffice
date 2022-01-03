<template>
  <div class="flex flex-row">
    <client-only>
      <div
        v-for="color in colors"
        :key="color.id"
        class="flex flex-col items-center px-2"
      >
        <div
          class="mr-2 border-4 rounded-full shadow-lg"
          :class="[{ ' border-newmob-red': color.id == selected }]"
          v-tooltip.top="{
            content: color.color.name,
            classes: tooltipClasses,
          }"
          @click="selectColor(color.id)"
        >
          <div
            class="
              w-8
              h-8
              lg:h-12 lg:w-12
              2xl:w-16 2xl:h-16
              bg-image
              rounded-full
            "
            :style="getColorImage(color.id)"
          ></div>
          <input type="radio" name="color" v-model="selected" class="hidden" />
        </div>
        <div class="block sm:hidden" v-text="color.color.name"></div>
      </div>
    </client-only>
  </div>
</template>

<script>
import { VTooltip } from "v-tooltip";
import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  directives: {
    tooltip: VTooltip,
  },
  methods:{
    getStrapiMedia,
    getColorImage(id){
      let url = ''
      let color = this.colors.find(x => x.id == id)
        // url = color.image.formats.thumbnail.url
        url = color?.color?.image?.formats?.thumbnail?.url
      return `background-image: url('${getStrapiMedia(url)}'); background-size: cover;`
    },
    selectColor(id){
      this.$emit('colorSelection',id)
      this.selected = id
    }
  },
  data(){
    return {
      selected: {},
      tooltipClasses: [
        "bg-newmob-red",
        "text-white",
        "text-sm",
        "rounded-full",
        "p-1 ml-1",
      ]
    }
  },
  props:{
    colors:{
      type:Array,
      default:function(){
        return[]
      }
    }
  }
}
</script>

<style scoped>
.bg-image {
  background-position: center;
  background-size: contain;
  background-repeat: no-repeat;
}
</style>