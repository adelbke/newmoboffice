<template>
  <div class="flex flex-row">
    <client-only>
      <div v-for="color in colors" :key="color.id" class="flex flex-col items-center px-2">
        <div
          class="mr-2 border-4 rounded-full shadow-lg"
          :class="[{ ' border-newmob-red': color.id == selected }]"
          v-tooltip.top="{
            content: color.color.name,
            classes: tooltipClasses,
          }"
          @click="selectColor(color.id)"
          
        >
          <div
            class="
              w-8
              h-8
              lg:h-12 lg:w-12
              2xl:w-16 2xl:h-16
              bg-image
              rounded-full
            "
            :style="getColorImage(color.id)"
          ></div>
          <input type="radio" name="color" v-model="selected" class="hidden" />
        </div>
        <div class="block sm:hidden" v-text="color.color.name"></div>
      </div>
    </client-only>
  </div>
</template>

<script>
import { VTooltip } from "v-tooltip";

export default {
  directives: {
    tooltip: VTooltip,
  },
  methods:{
    getColorImage(id){
      let url = ''
      let color = this.colors.find(x => x.id == id)
      if(false){
        url = color.image.formats.thumbnail.url
        // url='/uploads/thumbnail_Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99.png'
      }else{
        url = color.color.image.formats.thumbnail.url
        // url='/uploads/thumbnail_Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99.png'
      }
      return `background-image: url('http://localhost:1337${url}')`
    },
    selectColor(id){
      this.$emit('colorSelection',id)
      this.selected = id
    }
  },
  data(){
    return {
      selected: {},
      tooltipClasses: [
        "bg-newmob-red",
        "text-white",
        "text-sm",
        "rounded-full",
        "p-1 ml-1",
      ]
    }
  },
  props:{
    colors:{
      type:Array,
      default:function(){
        return[
    {
        "id": 1,
        "color": {
            "id": 1,
            "name": "Teak Blanc",
            "reference": "teak-blanc",
            "published_at": "2021-10-15T17:17:48.848Z",
            "created_at": "2021-10-15T17:17:42.388Z",
            "updated_at": "2021-10-15T17:17:48.903Z",
            "image": {
                "id": 28,
                "name": "SqtlXt8pBUQMUQhwuUYqjElTRhYoNPJ451qbiaKC.png",
                "alternativeText": "",
                "caption": "",
                "width": 210,
                "height": 210,
                "formats": {
                    "thumbnail": {
                        "name": "thumbnail_SqtlXt8pBUQMUQhwuUYqjElTRhYoNPJ451qbiaKC.png",
                        "hash": "thumbnail_Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99",
                        "ext": ".png",
                        "mime": "image/png",
                        "width": 156,
                        "height": 156,
                        "size": 38.98,
                        "path": null,
                        "url": "/uploads/thumbnail_Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99.png"
                    }
                },
                "hash": "Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99",
                "ext": ".png",
                "mime": "image/png",
                "size": 64.68,
                "url": "/uploads/Sqtl_Xt8p_BUQMU_Qhwu_U_Yqj_El_T_Rh_Yo_NPJ_451qbia_KC_da6538ae99.png",
                "previewUrl": null,
                "provider": "local",
                "provider_metadata": null,
                "created_at": "2021-10-15T17:17:38.234Z",
                "updated_at": "2021-10-15T17:17:38.250Z"
            }
        },
        "image": {
            "id": 26,
            "name": "java.png",
            "alternativeText": null,
            "caption": null,
            "width": 375,
            "height": 375,
            "formats": {
                "thumbnail": {
                    "name": "thumbnail_java.png",
                    "hash": "thumbnail_java_ba976c2907",
                    "ext": ".png",
                    "mime": "image/.png",
                    "width": 156,
                    "height": 156,
                    "size": 16.5,
                    "path": null,
                    "url": "/uploads/thumbnail_java_ba976c2907.png"
                }
            },
            "hash": "java_ba976c2907",
            "ext": ".png",
            "mime": "image/.png",
            "size": 8.19,
            "url": "/uploads/java_ba976c2907.png",
            "previewUrl": null,
            "provider": "local",
            "provider_metadata": null,
            "created_at": "2021-09-26T14:38:59.769Z",
            "updated_at": "2021-09-26T14:38:59.769Z"
        }
    },
    {
        "id": 2,
        "color": {
            "id": 2,
            "name": "Panama Marron Gloss",
            "reference": "panama-marron-gloss",
            "published_at": "2021-10-15T17:18:38.995Z",
            "created_at": "2021-10-15T17:18:36.622Z",
            "updated_at": "2021-10-15T17:18:39.026Z",
            "image": {
                "id": 29,
                "name": "panama_marron_gloss.png",
                "alternativeText": "",
                "caption": "",
                "width": 210,
                "height": 210,
                "formats": {
                    "thumbnail": {
                        "name": "thumbnail_panama_marron_gloss.png",
                        "hash": "thumbnail_panama_marron_gloss_d5f49b816c",
                        "ext": ".png",
                        "mime": "image/png",
                        "width": 156,
                        "height": 156,
                        "size": 49.83,
                        "path": null,
                        "url": "/uploads/thumbnail_panama_marron_gloss_d5f49b816c.png"
                    }
                },
                "hash": "panama_marron_gloss_d5f49b816c",
                "ext": ".png",
                "mime": "image/png",
                "size": 71.13,
                "url": "/uploads/panama_marron_gloss_d5f49b816c.png",
                "previewUrl": null,
                "provider": "local",
                "provider_metadata": null,
                "created_at": "2021-10-15T17:18:32.836Z",
                "updated_at": "2021-10-15T17:18:32.850Z"
            }
        },
        "image": {
            "id": 25,
            "name": "angular.png",
            "alternativeText": null,
            "caption": null,
            "width": 375,
            "height": 375,
            "formats": {
                "thumbnail": {
                    "name": "thumbnail_angular.png",
                    "hash": "thumbnail_angular_47b5180fb1",
                    "ext": ".png",
                    "mime": "image/.png",
                    "width": 156,
                    "height": 156,
                    "size": 15.84,
                    "path": null,
                    "url": "/uploads/thumbnail_angular_47b5180fb1.png"
                }
            },
            "hash": "angular_47b5180fb1",
            "ext": ".png",
            "mime": "image/.png",
            "size": 9.75,
            "url": "/uploads/angular_47b5180fb1.png",
            "previewUrl": null,
            "provider": "local",
            "provider_metadata": null,
            "created_at": "2021-09-26T14:38:59.746Z",
            "updated_at": "2021-09-26T14:38:59.746Z"
        }
    }
]
      }
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