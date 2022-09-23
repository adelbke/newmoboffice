<template>
  <div>
    <div
      class="
        fixed
        cursor-pointer
        right-0
        bg-newmob-red
        hover:scale-110
        transition-transform
        transform-gpu
        delay-75
        rounded-l-full
        text-white
        p-2
        top-1/2
        z-20
        phone-icon-animate
      "
      @click="call"
    >
      <phone-icon class="md:w-10 md:h-10"></phone-icon>
    </div>
    <client-only>
      <modal name="phone" classes="flex flex-col" height="auto" width="400">
        <a
          class="phone-number"
          :href="'tel:' + number"
          v-for="number in numbers"
          :key="number"
          >Contactez nous au {{ number }}</a
        >
      </modal>
    </client-only>
  </div>
</template>

<script>
import phoneIcon from '../icons/phone.vue'
import { VTooltip } from "v-tooltip";

export default {
  components:{
    phoneIcon
  },
  directives: {
    tooltip: VTooltip,
  },
  methods:{
    call(){
      this.$modal.show('phone');
    }
  },
  computed:{
    numbers(){
      let list = this.$store.state.contactInfo.num_tel.split(',')
      return list
    }
  }
}
</script>

<style scoped>
@keyframes heartbeat {
  0% {
    transform: scale( 1 );    
  }
  /* 20% {
    transform: scale( 1.10 ) 
      translateX(5%) 
      translateY(5%);
  }  */
  50% {
    transform: scale( 1.25 ) 
      translateX(9%) 
      translateY(10%);
  }
}
.phone-icon-animate{
  animation: heartbeat 1.2s 12;
}
.phone-number {
  @apply p-2 shadow-md bg-gray-100 text-gray-800 hover:bg-newmob-red-100 hover:text-white block text-center
}
</style>