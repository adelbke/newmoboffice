<template>
    <div class="container my-5 mx-auto bg-white">
        <div id="mycarousel" class="carousel lazy-load slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#mycarousel" v-for="slide,index in slides" :key="index" :data-slide-to="index" style="background-color:var(--gray);" :class="{'active':index == 0}"></li>                        
            </ol>
            <div class="carousel-inner" role="listbox">
                <div v-for="slide,index in slides" :key="index" class="carousel-item text-center" :class="{'active':index == 0}">
                    <img v-if="index > 2" loading="lazy" :src="slide.image.path" class="w-100 img-fluid mx-auto" alt="First slide">       
                    <img v-else :src="slide.image.path" class="w-100 img-fluid mx-auto" alt="First slide">       
                </div>

            </div>
            <a class="carousel-control-prev bg-transparent" href="#mycarousel" style="background:none;" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next bg-transparent" href="#mycarousel" style="background:none;" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</template>

<script>
export default {
    props:{
        slides:Array
    },

    mounted(){
        console.log("test")
        $('#mycarousel').on('slide.bs.carousel', function () {
            console.log('check this out')
        })
    }
}
</script>

<style>

</style>