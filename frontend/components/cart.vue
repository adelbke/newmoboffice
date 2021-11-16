<template>
  <div class="">
    <button class="relative" @click="$modal.show('cart-modal')">
      <cart-icon></cart-icon>
      <span
        v-if="$store.getters['cart/totalItemsCount'] > 0"
        class="
          rounded-full
          text-xs text-white
          bg-newmob-red
          -top-2
          -right-2
          p-1
          absolute
        "
        >{{ $store.getters["cart/totalItemsCount"] }}</span
      >
    </button>
    <modal
      height="90%"
      width="90%"
      name="cart-modal"
      transition="pop-out"
      :classes="'flex flex-col'"
    >
      <div class="flex flex-row items-center justify-between m-4">
        <div
          class="
            cursor-pointer
            flex flex-row
            text-gray-700
            hover:text-black hover:underline
          "
          @click="$modal.hide('cart-modal')"
        >
          <close-icon></close-icon>
          <span class="hidden md:block">Continuez vos Achats</span>
        </div>
        <span class="hidden md:block">Bienvenue au Panier</span>
        <div class="flex flex-row items-center">
          <cart-icon></cart-icon>
          <span
            class="text-sm font-bold"
            v-text="$store.getters['cart/totalItemsCount']"
          ></span>
        </div>
      </div>

      <div class="flex flex-col m-4">
        <cart-item
          v-for="(item, index) in $store.state.cart.list"
          :key="index"
          :itemIndex="index"
          :id="item.product.id"
          :title="item.product.title"
          :description="item.product.description"
          :unitPrice="item.unitPrice"
          :quantity="item.quantity"
          :criterias="item.criterias"
        ></cart-item>
      </div>

      <div class="flex flex-row justify-end m-4">
        <button
          v-if="$store.getters['cart/totalItemsCount'] > 0"
          @click="order"
          class="
            self-center
            large-button
            mt-2
          "
        >
          Lancez la Commande
        </button>
      </div>
    </modal>

    <modal
      name="login-before-modal"
      transition="pop-out"
      classes="p-2 flex flex-col items-center min-w-max"
      height="auto"
    >
      <span v-if="!$strapi.user" class="text-lg mb-2 font-bold font-nunito">
        Vous pouvez soit commander directement avec vos informations, où créer
        un compte
      </span>
      <div class="flex mb-2 flex-row flex-wrap md:flex-nowrap items-center">
        <div v-if="!$strapi.user" class="flex flex-col justify-start p-2">
          <span class="text-lg font-bold font-nunito"
            >Vous pouvez seulement nous donner votre tél et addresse.</span
          >
          <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="tél">
              tél
            </label>
            <input
              class="
                shadow
                appearance-none
                rounded
                w-full
                py-2
                px-3
                text-gray-700
                leading-tight
                focus:outline-none focus:shadow-outline
              "
              v-model="phone"
              @keypress.enter="order"
              type="tel"
              placeholder="téléphone"
            />
            <div class="mt-3">
              <p
                v-for="error in phoneErrors"
                :key="error"
                v-text="error"
                class="text-red-500 text-xs italic"
              ></p>
            </div>
          </div>
          <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="address">
              Adresse
            </label>
            <input
              class="
                shadow
                appearance-none
                rounded
                w-full
                py-2
                px-3
                text-gray-700
                leading-tight
                focus:outline-none focus:shadow-outline
              "
              v-model="address"
              @keypress.enter="order"
              type="text"
              placeholder="Adresse"
            />
            <div class="mt-3">
              <p
                v-for="error in addressErrors"
                :key="error"
                v-text="error"
                class="text-red-500 text-xs italic"
              ></p>
            </div>
          </div>
        </div>
        <div class="min-w-max border-l border-gray-700 p-2">
          <span v-if="!$strapi.user" class="text-lg font-bold font-nunito"
            >Connectez vous afin de terminer votre commande</span
          >
          <login-form v-if="!$strapi.user" v-on:logged-in="connected"></login-form>
          <div v-else >
            Maintenant que vous êtes connectés, pouvez-vous confirmer vôtre numéro de téléphone
            <div class="mb-4">
            <label class="block text-gray-700 text-sm font-bold mb-2" for="tél">
              tél
            </label>
            <input
              class="
                shadow
                appearance-none
                rounded
                w-full
                py-2
                px-3
                text-gray-700
                leading-tight
                focus:outline-none focus:shadow-outline
              "
              v-model="phone"
              @keypress.enter="order"
              type="tel"
              placeholder="téléphone"
            />
            <div class="mt-3">
              <p
                v-for="error in phoneErrors"
                :key="error"
                v-text="error"
                class="text-red-500 text-xs italic"
              ></p>
            </div>
            </div>
          </div>
        </div>
      </div>
      <button class="self-end large-button" @click="order">Terminer la Commande</button>
    </modal>
  </div>
</template>

<script>
import cartIcon from '~/components/icons/cart.vue'
import closeIcon from '~/components/icons/close.vue'
import cartItem from '~/components/cart/cart-item.vue'

import loginForm from '~/components/auth/login-form.vue'
export default {
  components: {
    cartIcon,
    closeIcon,
    cartItem,
    loginForm
  },
  methods:{
    order(){
      let vm = this
      if(!vm.$strapi.user){
        // vm.$modal.show(loginForm, {}, {height: 'fit-content', width:'fit-content', classes:'rounded-lg'})
        // vm.$modal.hideAll()
        // vm.$modal.show(loginForm, {}, {height: 'auto', classes:'rounded-lg max-w-fit-content'})
        vm.$modal.show('login-before-modal');
      }else{
        vm.$strapi.create('order')
      }
    },
    connected(){
      this.order()
    }
  },
  data(){
    return{
      address:'',
      phone:''
    }
  },
  computed:{
    addressErrors(){
      return[]
    },
    phoneErrors(){
      return[]
    }
  }
}
</script>

<style>
.large-button{
  @apply bg-newmob-red p-2 text-lg border-newmob-red-100 text-white rounded-md shadow-lg
}
.max-w-fit-content {
  max-width: fit-content;
}
.pop-out-enter-active,
.pop-out-leave-active {
  transition: all 0.5s;
}
.pop-out-enter,
.pop-out-leave-active {
  opacity: 0;
  transform: translateY(24px);
}
</style>
