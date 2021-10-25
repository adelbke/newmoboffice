<template>
  <a
    v-if="link != ''"
    :href="link"
    v-text="name"
  ></a>
  <NuxtLink
    v-else
    :to="page"
    v-text="name"
  ></NuxtLink>
</template>
<script>
export default {

  props:{
      name:{
          type:String,
          default:'Accueil'
      },
      page:{
          type:String,
          default:'/'
      },
      link:{
          type:String,
          default:''
      }
  }
}
</script>

<style>
</style>