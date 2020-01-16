<template>
    <div>
        <button type="button" class="btn btn-danger"  @click="enableRetailer($event)" id="enableButton">Activer</button>
    </div>
</template>

<script>
export default {
    mounted(){
    },

    methods:{
        enableRetailer: function(event){
            // alert($(event.currentTarget).data('retailerid'));
            axios.post('/retailers/activate',{
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