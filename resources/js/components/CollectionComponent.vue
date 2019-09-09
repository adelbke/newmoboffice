<template>
    <div class="hvr-grow">
        <a href="#">
            <h4 class="mb-2">Titre Collection</h4>
            <figure class="imghvr-fade mb-2" >
                <img src="images/furniture-slide1.png" alt="" class="img-fluid w-100">
                <figcaption>
                    <h3 class="text-left h3">Titre</h3>
                    <p class="ml-3 text-left lead">description</p>
                </figcaption>
            </figure>
            <a name="" id="" class="btn btn-primary border border-primary hvr-back-pulse mb-4 hvr-icon-forward" href="#" role="button">
                Voir la Collection
                <i class="fa fas fa-chevron-right hvr-icon"></i>
            </a>
        </a>
    </div>
</template>

<script>
export default {
    mounted(){
        console.log("ExampleComponent Loaded");
    }
}
</script>


<style scoped>
figure{
    background-color: #3490dc8c;
}

figcaption{
    background-color: #3490dc8c;
}
[class^=imghvr-fade]:hover > img{
    opacity: 0.6;
}
</style>

