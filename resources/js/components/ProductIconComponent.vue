<template>
    <li class="col-6 my-2 col-md-12">
        <img v-bind:src="imagepath" class="img-fluid hvr-grow" @click="loadimageonlarge()">
    </li>
</template>

<script>
export default {
    props:{
        imagepath:String,
        id:Number
    },
    methods:{
        loadimageonlarge: function (){
            var vm = this;
            this.$emit('update:image',vm.id);
        }
    }
}
</script>

<style>

</style>