<template>
    <div class="hvr-grow">
        <a href="#">
            <h4 class="mb-2" v-text="this.name" >Titre Collection</h4>
            <figure class="imghvr-fade mb-2" >
                <img v-bind:src="this.image" alt="" class="img-fluid w-100">
                <figcaption>
                    <h3 class="text-left text-secondary h3" v-text="this.name" ></h3>
                    <p class="ml-3 text-secondary text-left lead" v-html="this.description" >description</p>
                </figcaption>
            </figure>
            <a name="" id="" class="btn border border-primary hvr-fade mb-4 hvr-icon-forward" v-bind:href="this.route" role="button">
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
    },
    props:{
        name:String,
        image:String,
        description:String,
        route:String
    }
}
</script>


<style scoped>
figure{
    background-color: white;
}

[class^=imghvr-fade]:hover > img{
    opacity: 0.6;
}
a.hvr-fade{
    color:var(--secondary);
}
a.hvr-fade:hover{
    color:white;
}
a.btn:hover{
    background: var(--secondary);
}
</style>

