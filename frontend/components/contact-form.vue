<template>
  <form
    class="flex flex-row flex-wrap p-1 sm:p-2 justify-end"
    action="https://formsubmit.co/adelbouhraoua23@gmail.com"
    method="post"
  >
    <div class="w-1/2 p-1 sm:p-2">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="E-mail">
        E-mail
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
        @keypress.enter="login"
        type="email"
        placeholder="entrez votre email"
      />
    </div>
    <div class="w-1/2 p-1 sm:p-2">
      <label class="block text-gray-700 text-sm font-bold mb-2" for="E-mail">
        Nom
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
        @keypress.enter="login"
        type="text"
        placeholder="entrez votre nom"
      />
    </div>

    <div class="w-full p-1 sm:p-2">
      <label for="" class="block text-gray-700 text-sm font-bold mb-2">
        Message
      </label>
      <textarea class="w-full" name="message" placeholder="Message à envoyer" cols="30" rows="10"></textarea>

    </div>

    <input type="hidden" name="_next" value="https://newmoboffice.com/thanks">
    <input type="hidden" name="_subject" value="Message depuis le site NewmobOffice !!!">
    <button type="submit" class="bg-newmob-red p-2 mr-2 text-lg border-newmob-red-100 text-white rounded-md shadow-lg">
      Envoyer
    </button>

  </form>
</template>

<script>
export default {

}
</script>

<style>
</style>