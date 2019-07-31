<template>
        <div class="mx-auto h-100 zoom">
            <img src="/images/chair.jpg" alt="" class="img-fluid">
        </div>
</template>


<script>
export default {
    mounted(){
        $('.zoom').zoom({
            url:"/images/chair-large.jpg",
            touch:true,
            on:"mouseover",
        });
    }

}
</script>
