<template>
  <div class="flex flex-col p-1 rounded-md">
    <client-only>
      <splide :options="mainSlideOptions" ref="main">
        <splide-slide v-for="image in fullSizeImages" :key="image">
          <div
            class="bg-image w-full h-full cursor-pointer"
            @click="show"
            :style="backgroundImage(image)"
          ></div>
        </splide-slide>
      </splide>

      <splide :options="thumbSlideOptions" ref="thumbs" class="my-2">
        <splide-slide v-for="image in thumbnailImages" :key="image">
          <img :src="image" alt="" />
        </splide-slide>
      </splide>
    </client-only>
  </div>
</template>

<script>
import 'viewerjs/dist/viewer.css'
import VueViewer from 'v-viewer'
import Vue from 'vue'
Vue.use(VueViewer)

import {
  getStrapiMedia
} from '~/utils/medias'
export default {
  updated(){
    if(this.$refs.main && this.$refs.thumbs){
      this.$refs.main.sync(this.$refs.thumbs.splide)
    }
  },
  props:{
    productImages:{
      type:Array,
      default:function () {
        return []
      }
    }
  },
  methods:{
    getStrapiMedia,
    show() {
        this.$viewerApi({
          images: this.fullSizeImages,
        })
    },
    backgroundImage(url){
      return 'background-image: url("' + url +'");'
    }
  },
  data(){
    return{
      images:[
        "/product-image.png",
          "https://picsum.photos/300/200",
          "https://picsum.photos/250/200"
      ],
      mainSlideOptions:{
        type      : 'loop',
        perMove   : 1,
        gap       : '1rem',
        pagination: true,
        arrows: false,
        // cover: true,
        height: '28rem',
        breakpoints:{
          640:{
            height:'16rem'
          }
        }
      },
      thumbSlideOptions:{
        type        : 'slide',
        rewind      : true,
        gap         : '1rem',
        pagination  : false,
        fixedWidth  : 110,
        fixedHeight : 70,
        cover       : true,
        focus       : 'center',
        isNavigation: true,
        updateOnMove: true,
      }
    }
  },
  computed:{
    thumbnailImages(){
      return this.productImages.map(x => getStrapiMedia(x.formats.thumbnail.url))
    },
    fullSizeImages(){
      return this.productImages.map(x => getStrapiMedia(x.url))
    }
  }
}
</script>

<style scoped>
.bg-image {
  background-position: center;
  background-size: contain;
  background-repeat: no-repeat;
}
</style>