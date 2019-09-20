<template>
    <div class=" rounded d-inline px-0 justify-content-center">
        Quantité:
        <button type="button" style="font-size:1.5em" @click="decrement()" id="addqte" class="btn btn-light px-3">-</button>
        <input type="text" name="Quantité" class="form-control d-inline border-0 shadow-0" style="width:3em;" id="qte" v-model="qte">
        <button type="button" @click="increment()" style="font-size:1.5em" class="btn btn-light px-3">+</button>
    </div>
</template>

<script>
export default {

    data: function (){
        return {
            qte:1,
        };
    },
    methods:{
        increment: function (){
            if(this.qte < 10){
                this.qte = this.qte + 1;
            }else{
                // $('#addqte').tooltip({
                //     title: "Hello",
                //     trigger:'manual'
                // });
                // $('#addqte').show();
                alert('Vous ne pouvez pas dépasser cette quantité');
            }
        },
        decrement: function(){
            if(this.qte > 1){
                this.qte = this.qte - 1;
            }
        },
    }
}
</script>

<style>

</style>