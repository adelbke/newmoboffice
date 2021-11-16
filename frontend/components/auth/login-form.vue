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
          type="email"
          spellcheck="false"
          v-model="email"
          placeholder="E-mail"
        />
        <div class="mt-3">
          <p
            v-for="error in emailErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          ></p>
        </div>
      </div>
      <div class="mb-6">
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
          @keypress.enter="login"
          type="password"
          placeholder="******************"
        />
        <div class="mt-3">
          <p
            v-for="error in passwordErrors"
            :key="error"
            v-text="error"
            class="text-red-500 text-xs italic"
          ></p>
        </div>
      </div>
      <div class="mt-3">
        <p
          v-for="error in loginErrors"
          :key="error"
          v-text="error"
          class="text-red-500 text-xs italic"
        ></p>
      </div>
      <div class="flex items-center my-2">
        <span class="text-gray-500 text-sm"
          >Vous n'avez pas de compte?
          <NuxtLink
            class="text-blue-500 hover:underline hover:text-blue-400"
            to="/register"
            >Inscrivez Vous !
          </NuxtLink>
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
          type="button"
          @click="login"
        >
          Se Connecter
        </button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  data(){
    return{
      email:'',
      password: '',
      loginErrors: []
    }
  },
  methods:{
    login(){
      let vm = this
      let errors = [...vm.emailErrors, ...vm.passwordErrors]
      if(errors.length == 0){
        vm.$strapi.login({
          identifier:vm.email,
          password:vm.password,
        }).then(x => {
          vm.$emit('logged-in', x)
        }).catch(x => {
          vm.loginErrors.push('E-mail où mot de passe invalide')
        })
      }
    }
  },
  computed:{
    passwordErrors(){
      let vm = this
      if(vm.password == ''){
        return []
      }
      let output = []
      if(vm.password.length < 8){
        output.push('votre mot de passe est trop court')
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
    }
  }
}
</script>

<style>
</style>