<template>
  <div>
    <h2 class="section-title my-2">Blog</h2>
    <div class="flex flex-col justify-center">
      <blog-post-item></blog-post-item>
    </div>
  </div>
</template>

<script>
import blogPostItem from '~/components/blog/blog-post-item.vue'
export default {
  layout:'blog',
  components:{
    blogPostItem
  }
}
</script>

<style>
</style>