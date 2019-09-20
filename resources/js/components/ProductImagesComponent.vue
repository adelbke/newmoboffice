<template>
    <div class="row">
        <div class="col-md-2 order-last order-md-first px-0">
            <ul style="list-style-type:none;" class="row p-0">
                <producticon-component v-for="(image,index) in images" v-bind:key="image.id" v-bind:id="index" v-bind:imagepath="image.path" @update:image="imageupdate"></producticon-component>
                
            </ul>
        </div>
        <div class="col-md-6 text-center order-first img-container" style="height:500px;">
            <largeproduct-component v-bind:image="selectedimage"></largeproduct-component>
        </div>

        <div class="col-md-4 order-md-last pt-4">
            <productdescription-component v-bind:product="product"></productdescription-component>
        </div>
    </div>
</template>

<script>
export default {
    props:{
        images:Array,
        product:Object
    },
    data:function(){
        return{
            selectedimage : this.images[0],
        };
    },
    methods:{
        imageupdate: function (value){
            this.selectedimage = this.images[value];
        }
    }

}
</script>

<style>

</style>