<template>
  <div class="flex flex-row font-nunito overflow-x-auto">
    <!-- <size v-for="size in sizes" :key="size.id" :name="size.name" :id="size.id" :selected="!!size.selected" v-on:selectSize="updateSize($event)" ></size> -->
    <client-only>
      <button
        v-for="size in sizes"
        :key="size.id"
        :for="size.name"
        @click="selectSize(size.id)"
        class="text-white rounded-md p-1 md:p-2 mx-2 md:text-md"
        v-tooltip.right="{
          content: `${size.height}m /${size.width}m /${size.depth}m`,
          classes: tooltipClasses,
        }"
        :class="[
          {
            'bg-newmob-red shadow-lg font-bold filter drop-shadow-lg':
              size.id == selected,
          },
          { 'bg-newmob-silver filter shadow-inner ': size.id != selected },
        ]"
      >
        {{ size.name }}
        <br />
        <span class="inline sm:hidden">{{ size.height }}m/ {{size.width}}m/ {{size.depth}}m</span> 
        <input
          type="radio"
          name="size"
          v-model="selected"
          :value="size.id"
          class="hidden"
        />
      </button>
    </client-only>
  </div>
</template>

<script>
import { VTooltip } from "v-tooltip";

export default {
  directives: {
    tooltip: VTooltip,
  },
  props:{
    sizes:{
      type:Array,
      default: function(){
        return[
          {
            "id": 1,
            "name": "Moyen",
            "height": 1.6,
            "width": 1.6,
            "depth": 1.6,
            "price": 37400,
            "prix_revendeur": null
          },
          {
            "id": 2,
            "name": "Large",
            "height": 1.6,
            "width": 1.8,
            "depth": 1.6,
            "price": 39500,
            "prix_revendeur": null
          }
        ]
      }   
    }
  },
  data(){
    return{
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
  methods:{
    selectSize(id){
      this.$emit('sizeSelection',id)
      this.selected = id
    }
  }
}
</script>

<style>
</style>