<template>
        <div class="mx-auto h-100 zoom">
            <img v-bind:src="this.image.small" alt="" class="img-fluid">
        </div>
</template>


<script>
export default {
    props:{
        image:Object

    },
    mounted(){
        $('.zoom').zoom({
            url:this.image.path,
            touch:true,
            on:"mouseover",
        });
    },
    watch:{
        image:function (newval, oldval){
            $('.zoom').zoom('zoom.destroy');
            $('.zoom').zoom({
            url:newval.path,
            touch:true,
            on:"mouseover",
        });
        }
    }

}
</script>
