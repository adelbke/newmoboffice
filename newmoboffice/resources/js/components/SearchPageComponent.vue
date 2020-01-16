<template>
<div class="container-fluid">
    <form action="/search" id="searchform" method="get" ref="form" >
        <div class="row">
            
            <div class="col-2 col-md-2 col-lg-2">
                <span class="font-weight-bold">
                    Résultats: {{this.listcount}}
                </span>
            </div>
            <div class="offset-8 offset-md-8 offset-lg-8 col-2 col-md-2 col-lg-2">
                <div class="dropdown open float-left">
                    <button class="btn btn-white border boder-light dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Trier Par
                        <i class="fas fa fa-chevron-down "></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                        <button type="button" class="dropdown-item" @click="popularity()" >Popularité
                            <i class="fas fa fa-check " v-if="this.checked == 'popularity'"></i>
                        </button>
                        <button type="button" class="dropdown-item" @click="expensivetocheap()">du Plus Chère au moins Chère
                            <i class="fas fa fa-check " v-if="this.checked == 'expensivetocheap'"></i>
                        </button>
                        <button type="button" class="dropdown-item" @click="cheaptoexpensive()">du Moins Chère au plus Chère
                            <i class="fas fa fa-check " v-if="this.checked == 'cheaptoexpensive'"></i>
                        </button>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary float-right">Filtrer</button>
            </div>
        </div>
    </form>
</div>
</template>

<script>
export default {

    props:{
        listcount:Number,
        search:String
    },
    mounted(){
        $('#searchform').append('<input type="hidden" name="search" value="'+this.search+'" />');
    },
    data:function (){
        return {
            checked:'popularity'
        };
    },
    methods:{
        sortBy: function () {
            
        },
        expensivetocheap:function(){
            $('input[name="orderby"]').remove();
            $('#searchform').append('<input type="hidden" name="orderby" value="expensivetocheap" />');
            this.checked='expensivetocheap';
        },
        cheaptoexpensive:function(event){
            $('input[name="orderby"]').remove();
            $('#searchform').append('<input type="hidden" name="orderby" value="cheaptoexpensive" />');
            this.checked='cheaptoexpensive';
        },
        popularity: function (){
            $('input[name="orderby"]').remove();
            $('#searchform').append('<input type="hidden" name="orderby" value="popularity" />');
            this.checked='popularity';
        }
    }
}
</script>

<style scoped>
.dropdown-toggle:after { content: none }
</style>