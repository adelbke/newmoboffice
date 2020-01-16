<template>
    <div>
        <button type="button" class="btn btn-danger" @click="disableRetailer($event)" id="disableButton" >Désactiver</button>
    </div>
</template>

<script>
export default {

    mounted(){
        console.log('mounted');
    },
    methods:{
        disableRetailer: function(event){
            // alert($(event.currentTarget).data('retailerid'));
            axios.post('/retailers/deactivate',{
                retailerid: $(event.currentTarget).data('retailerid'),
                adminid:$(event.currentTarget).data('adminid'),
            }).then(function (response){
                $('#enableModal').modal('hide');
                alert(String(response.data));
            });
        }
    }


}
</script>

<style>

</style>