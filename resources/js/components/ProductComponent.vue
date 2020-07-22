<template>
    <div class="shadow rounded h-100 border hvr-grow">
        <a v-bind:href="this.productpath">
            <img
                v-bind:src="this.path"
                class="img-fluid img-product mb-2 mx-auto rounded d-block"
                style="width:210px"
                alt
            />
        </a>

        <div class="p-3">
            <span v-if="this.new == 'true'" class="badge badge-pill py-1 badge-secondary">Nouveau</span>
            <a
                v-bind:href="this.productpath"
                v-text="this.name"
                class="text-dark font-weight-bold d-block btn-link"
            >titre produit court</a>
            <p class="text-left my-0">
                <!-- {{this.descriptionformatted}} -->
                <span v-html="this.descriptionformatted"></span>
                <a
                    v-if="this.isdescriptionlong && !this.islong"
                    class="text-primary readMore"
                    @click="readmore()"
                >Lire plus</a>
                <a
                    v-else-if="this.islong"
                    class="text-primary readMore"
                    @click="readless()"
                >Lire moins</a>
            </p>
            <h4 class="text-left" v-text="this.priceformatted">11000 Da</h4>
            <p class="text-left">
                <small class="text-muted text-left" v-text="this.note">Petite Note</small>
            </p>
        </div>
    </div>
</template>

<script>
// import ReadMore from "vue-read-more";
// Vue.use(ReadMore);
export default {
    mounted() {},
    props: {
        id: Number,
        path: String,
        name: String,
        note: String,
        price: Number,
        description: String,
        new: String
    },
    // components:{
    //     ReadMore
    // },
    computed: {
        productpath: function() {
            return "/products/" + this.id;
        },
        priceformatted: function() {
            return this.price + " Da";
        },
        descriptionformatted: function() {
            if (this.isdescriptionlong && !this.islong) {
                return this.description.substring(0, 75);
            } else {
                return this.description;
            }
        },
        isdescriptionlong: function() {
            if (this.description.length > 75) return true;
            else return false;
        }
    },
    data: function() {
        return {
            islong: false
        };
    },
    methods: {
        readmore: function() {
            this.islong = true;
        },
        readless: function() {
            this.islong = false;
        }
    }
};
</script>

<style scoped>
.readMore {
    cursor: pointer;
}
</style>
