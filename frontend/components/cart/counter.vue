<template>
  <div class="flex flex-row items-stretch">
    <button class="counter-button border-l" @click="updateCounter(false)">
      <minus-icon></minus-icon>
    </button>
    <input
      type="number"
      min="1"
      v-model="counterValue"
      class="w-20 outline-none border-t border-b text-center border-gray-400"
    />
      <!-- @change="counterChanged($event)" -->
    <button class="counter-button border-r" @click="updateCounter(true)">
      <plus-icon></plus-icon>
    </button>
  </div>
</template>

<script>
import plusIcon from '~/components/icons/plus.vue'
import minusIcon from '~/components/icons/minus.vue'

import Vue from 'vue'
export default {
    components:{
        plusIcon,
        minusIcon
    },
    props:['initialCounter'],
    data(){
        return {
          counterValue: this.initialCounter,
        }
    },
    methods:{
        updateCounter(direction){
            if(direction){
                this.counterValue++;
            }else{
                this.counterValue >1 ? this.counterValue-- : this.counterValue=1
            }
        }
    },
    watch:{
        counterValue: function(newCounterValue, oldCounterValue){
            // console.log('hello world')
            this.$emit('counterChanged', newCounterValue)
        }
    }
}
</script>

<style scoped>
.counter-button {
  @apply p-3 border-t border-b border-gray-400 font-bold;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>