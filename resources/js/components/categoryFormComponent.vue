<template>
    <div>
        <div v-if="!haserror" class="form-group">
            <label for="category" class="form-control-label ">Catégorie</label>
            <select v-model="selected" class="form-control text-dark form-control-alternative " id="category" name="category" @change="addTypes()">
                <option value="Meuble de Bureau">Meuble de Bureau</option>
                <option value="Mobilier de Réunion">Mobilier de Réunion</option>
                <option value="Mobilier Accueil">Mobilier Accueil</option>
                <option value="Mobilier de Conférence">Mobilier de Conférence</option>
                <option value="Bibliothèque & Mobilier pour écoles et crèches">Bibliothèque & Mobilier pour écoles et crèches</option>
                <option value="Environnement & Accéssoires">Environnement & Accéssoires</option>
            </select>
        </div>
        
        <div v-else class="form-group has-danger">
            <label for="category" class="form-control-label ">Catégorie</label>
            <select v-model="selected" class="is-invalid text-dark form-control form-control-alternative " id="category" name="category" @change="addTypes()">
                <option value="Meuble de Bureau">Meuble de Bureau</option>
                <option value="Mobilier de Réunion">Mobilier de Réunion</option>
                <option value="Mobilier Accueil">Mobilier Accueil</option>
                <option value="Mobilier de Conférence">Mobilier de Conférence</option>
                <option value="Bibliothèque & Mobilier pour écoles et crèches">Bibliothèque & Mobilier pour écoles et crèches</option>
                <option value="Environnement & Accéssoires">Environnement & Accéssoires</option>
            </select>
                <span v-if="haserror" class="invalid-feedback" role="alert">
                    <strong>{{ errormessage }}</strong>
                </span>
        </div>
        
        <div class="form-group">
            <label for="Type" class="form-control-label">Sous Catégorie</label>
            <select name="Type" id="Type" class="form-control-alternative text-dark form-control">
                <option class="text-dark" v-for="item in category[selected]" v-bind:value="item.id" v-bind:key="item.value">{{item.Name}}</option>
            </select>
        </div>

    </div>
</template>

<script>
import { METHODS } from 'http';
export default {
    props:{
        errormessage:String,
        haserror:String,
        adminid:String,
        oldcategory:String,
        oldtype:String
    },

    data:function (){
        return {
            selected:null,
            "category":{
                "Meuble de Bureau":[
                    // "Armoires",
                    // "Bureau de direction",
                    // "Bureau Opérateur",
                    // "Workstation"
                ],
                "Mobilier de Réunion":[
                    // "Table Conférence de Réunion",
                    // "Tables de Réunion modulaire",
                    // "Tables de Réunion et Travail"
                ],
                "Mobilier Accueil":[
                    // "Banquette de Réception",
                    // "Canapés et Fauteils",
                    // "Comptoir de Réception",
                    // "Tables Basses"
                ],
                "Bibliothèque & Mobilier pour écoles et crèches":[
                    // "Armoire & Rangement Métallique",
                    // "Mobilier pour crèches",
                    // "Rayonnage Métallique",
                    // "Rayonnage Mobile"
                ]
            },
            
        };
    },

    methods:{
        addTypes:function (){
            var vm = this;
            axios.post("/types/getcategory", {
                category:this.selected,
                adminId:parseInt(this.adminid),

            })
            .then(function (response) {
                vm.category[vm.selected] = [];
                for (let i = 0; i < response.data.length; i++) {
                    const element = response.data[i];
                    // console.log(vm.category[vm.selected]);
                    vm.category[vm.selected].push({Name:element.Name,id:element.id});
                }
            })
        }
    }
}
</script>

<style>

</style>