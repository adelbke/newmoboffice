<template>
    <div class="shadow">
        <a :href="route" class="h3" v-text="name"></a>
        <a :href="route">
            <div
                class="position-relative"
                @mouseover="displayOverlay=true"
                @mouseleave="displayOverlay=false"
            >
                <div
                    class="h-48"
                    :style="'background-image:url('+image+');background-size: contain;background-repeat: no-repeat;background-position: center;'"
                ></div>
                <div
                    class="overlay text-white overflow-hidden pt-3 pl-3 text-left"
                    :class="{'opacity-100':displayOverlay}"
                >
                    <a :href="route" class="text-white h4" v-text="name"></a>
                    <p v-html="description"></p>
                </div>
            </div>
        </a>
    </div>
</template>

<script>
export default {
    props: {
        name: String,
        image: String,
        description: String,
        route: String
    },
    data() {
        return {
            displayOverlay: false
        };
    }
};
</script>


<style scoped>
/* figure {
    background-color: white;
}

[class^="imghvr-fade"]:hover > img {
    opacity: 0.6;
}
a.hvr-fade {
    color: var(--secondary);
}
a.hvr-fade:hover {
    color: white;
}
a.btn:hover {
    background: var(--secondary);
}*/
.h-48 {
    height: 26rem;
}
.overlay {
    position: absolute;
    /* top: 0; */
    bottom: 0;
    left: 0;
    right: 0;
    height: 10rem;
    width: 100%;
    opacity: 0;
    transition: 0.5s ease;
    background-color: var(--secondary);
}
.opacity-100 {
    opacity: 100;
}
</style>

