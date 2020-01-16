<template>

    <div class="btn-group dropleft" v-if="this.allorders.length >0">
        <button type="button" class="btn text-dark  p-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa fa-truck fa-2x p-2 rounded-circle hvr-fade"></i>
            <span class="badge badge-primary" v-text="this.allorders.length"></span>
        </button>
        <div class="dropdown-menu">
            <div class="container-fluid">
                <div v-for="order in this.allorders" v-bind:key="order.id" class="row border-bottom border-dark pt-2">
                    <div class="col-12 col-md-12 text-center">
                        <span class="h5" v-text="'Commande n°: ' + order.id" ></span>
                    </div>
                    <div class="col-12 px-0 text-left py-1 col-md-6 col-lg-6">
                        <ul class="m-0 pl-2 border-right">
                            <li v-for="product in order.products" v-bind:key="product.id" >
                                <span v-text="'-' + product.name"></span>
                                <span v-text="' x' + product.pivot.quantity" class="font-weight-bold text-primary" ></span>
                            </li>
                        </ul>
                    </div>
                    <div class="col-12 px-0 text-left py-1 col-md-6 col-lg-6">
                        <ul class="m-0 pl-2 border-right">
                            <li class="font-weight-bold">
                                status :
                                <span v-if="order.state == 'requested'" class="text-orange">En Attente</span>
                                <span  v-else-if="order.state == 'waiting'" class="text-dark">En Cours de Traitement</span>
                                <span  v-else-if="order.state == 'Ready'" class="text-success">Prêt</span>                               
                            </li>
                            <li class="font-weight-bold">
                                <span v-text="'Prix: ' + order.price +' Da'"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
export default {
    mounted (){
        var vm = this;
        axios.post('/order/getallorders', {})
        .then(function (response) {
            vm.allorders = response.data;
        })
        .catch(function (error) {
        })
    },
    data: function () {
        return {
            allorders: []
        };
    }
}
</script>

<style scoped>


.dropdown-menu{
    width: 300px
}
dropdown-toggle::after {
    display:none;
}
ul{
    list-style: none;
}
.text-orange{
    color:#f6993f !important;
}
</style>