<template>
  <li class="w-100">
    <img
      v-bind:src="imagepath"
      class="col-12"
      :class="{'border border-secondary rounded':hovered}"
      @mouseover="hovered=true"
      @mouseleave="hovered=false"
      @click="loadimageonlarge()"
    />
  </li>
</template>

<script>
export default {
  props: {
    imagepath: String,
    id: Number,
  },
  data: function () {
    return {
      hovered: false,
    };
  },
  methods: {
    loadimageonlarge: function () {
      var vm = this;
      this.$emit("update:image", vm.id);
    },
  },
};
</script>

<style>
</style>
