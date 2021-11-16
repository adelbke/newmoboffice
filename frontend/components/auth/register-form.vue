<template>
  <div class="w-full max-w-sm">
    <form
      class="
        bg-white
        border-2 border-newmob-red-100
        shadow-md
        rounded-md
        px-8
        pt-6
        pb-8
        mb-4
      "
    >
      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="E-mail">
          E-mail
        </label>
        <input
          class="
            shadow
            appearance-none
            border
            rounded
            w-full
            py-2
            px-3
            text-gray-700
            leading-tight
            focus:outline-none focus:shadow-outline
          "
          v-model="email"
          id="E-mail"
          type="text"
          placeholder="E-mail"
        />
        <div class="mt-3">
          <p
            v-for="error in emailErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          >
            Please choose a password.
          </p>
        </div>
      </div>
      <div class="mb-4">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="mot de passe"
        >
          mot de passe
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
          v-model="password"
          type="password"
          placeholder="******************"
        />
        <div class="mt-3">
          <p
            v-for="error in passwordErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          >
            Please choose a password.
          </p>
        </div>
      </div>
      <div class="mb-4">
        <label
          class="block text-gray-700 text-sm font-bold mb-2"
          for="confirmation mot de passe"
        >
          Confirmation mot de passe
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
          v-model="passwordConfirmation"
          @keypress.enter="register"
          type="password"
          placeholder="******************"
        />
        <div class="mt-3">
          <p
            v-for="error in confirmationErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          >
            Please choose a password.
          </p>
        </div>
      </div>
      <div class="mb-6">
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
          @keypress.enter="register"
          type="tel"
          placeholder="téléphone"
        />
        <div class="mt-3">
          <p
            v-for="error in phoneErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          >
          </p>
        </div>
      </div>
      <div class="mt-3">
        <p
          v-for="error in registerErrors"
          :key="error"
          v-text="error"
          class="text-red-500 text-xs italic"
        ></p>
      </div>
      <div class="flex items-center my-2">
        <span class="text-gray-500 text-sm"
          >Vous avez déja un compte?
          <NuxtLink
            class="text-blue-500 hover:underline hover:text-blue-400"
            to="/login"
            >Connectez Vous !</NuxtLink
          >
        </span>
      </div>
      <div class="flex items-center justify-end">
        <button
          class="
            bg-newmob-red
            hover:bg-newmob-red-100
            text-white
            font-bold
            py-2
            px-4
            rounded
            focus:outline-none focus:shadow-outline
          "
          @click="register"
          type="button"
        >
          S'inscrire
        </button>
      </div>
    </form>
    <!-- <p class="text-center text-gray-500 text-xs">
      &copy;2020 Acme Corp. All rights reserved.
    </p> -->
  </div>
</template>

<script>
export default {
  data(){
    return{
      email:'',
      password:'',
      passwordConfirmation:'',
      phone:'',
      registerErrors:[]
    }
  },
  methods:{
    register(){
      let vm = this
      let errors = [
        ...vm.emailErrors,
        ...vm.passwordErrors,
        ...vm.confirmationErrors,
        ...vm.phoneErrors
      ]
      if(errors.length> 0){
        let payload = {
          email: vm.email,
          username: vm.email.split('@')[0],
          password: vm.password
        }
        if(vm.phone.length > 0){
          payload.phone = vm.phone
        }
        vm.$strapi.register(payload).then(x => {
          vm.$router.push('/profile')
        }).catch(x => {
          vm.registerErrors= [x.message]
          console.log(x)
        })
      }
    }
  },
  computed:{
    passwordErrors(){
      let vm = this
      if(vm.password.length == 0){
        return []
      }
      let output = []
      if(vm.password.length < 8){
        output.push('Le mot de passe contient moins de 8 caractères')
      }
      if(vm.password.toLowerCase() === vm.password){
        output.push('Le mot de passe ne contient pas de majuscules')
      }
      if(!(/\d/.test(vm.password))){
        output.push('Le mot de passe ne contient pas de nombres')
      }
      return output
    },
    confirmationErrors(){
      let vm = this
      if(vm.passwordConfirmation.length == 0){
        return []
      }
      let output = []
      if(vm.password != vm.passwordConfirmation){
        output.push('La Confirmation de mot de passe ne correspond pas au mot de passe')
      }
      return output
    },
    emailErrors(){
      let vm = this
      if(vm.email == ''){
        return []
      }
      let output = []
      const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if(!re.test(String(vm.email).toLowerCase())){
        output.push("L'adresse entrée ne correspond pas à un email")
      }
      return output
    },
    phoneErrors(){
      let vm = this
      if(vm.phone == ''){
        return []
      }
      let output = []
      if(!(/^(023|021)(\d{6}$)|(\d{10}$)|\+213(\d{9}$)/.test(vm.phone))){
        output.push('Votre numéro de téléphone est invalide')
      }
      return output
    }
  }
}
</script>

<style>
</style>