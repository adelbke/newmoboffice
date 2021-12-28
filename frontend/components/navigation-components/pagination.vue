<template>
  <ul class="flex flex-row justify-center">
    <li @click="updateCurrentPage(1)">&lt;&lt;</li>
    <li
      @click="updateCurrentPage(currentPage - 1)"
      :disabled="currentPage == 1"
    >
      &lt;
    </li>
    <li
      v-for="x in indexes"
      :key="x"
      :class="[{ 'bg-newmob-red text-white': x == 0 }]"
      @click="updateCurrentPage(x + currentPage)"
    >
      {{ currentPage + x }}
    </li>
    <li
      @click="updateCurrentPage(currentPage - 1)"
      :disabled="currentPage > listCount"
    >
      &gt;
    </li>
    <li @click="updateCurrentPage(listCount / perPage)">&gt;&gt;</li>
  </ul>
</template>

<script>
export default {
  props:{
    listCount:{
      type: Number,
      default:0
    },
    perPage:{
      type: Number,
      default: 5
    },
    currentPage:{
      type: Number,
      default: 1
    }
  },
  methods:{
    updateCurrentPage(newValue){
      this.$emit('currentPage',newValue)
    }
  },
  computed:{
    indexes(){
      let vm = this
      return [-2, -1, 0, 1, 2].filter(x => x + vm.currentPage >= 1 && x + vm.currentPage <= vm.listCount)
    }
  }
}
</script>

<style scoped>
li {
  @apply text-sm text-center p-1 md:w-8 md:h-8 mx-1 border font-bold rounded-full border-gray-500 cursor-pointer;
}
</style>