<template>
    <div class="container my-0 ">
        <div class="row">
            <div class="col-12 offset-md-8 col-md-4 my-3 text-dark">
                <b-form-group
                label="Filter"
                label-cols-sm="3"
                label-align-sm="right"
                label-size="sm"
                label-for="filterInput"
                class="mb-0">
                <b-input-group size="sm">
                    <b-form-input
                    
                    v-model="filter"
                    type="search"
                    id="filterInput"
                    placeholder="Type to Search"
                    ></b-form-input>
                    <b-input-group-append>
                        <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
                    </b-input-group-append>
                </b-input-group>
            </b-form-group> 
          </div>
      </div>
    <b-table striped hover dark :fixed="true" 
        :items="this.data" :fields="this.fields"
        :sort-by.sync="sortBy"
        :sort-desc.sync="sortDesc"
        sort-icon-left
        :filter-included-fields="includedFields"
        :filter="filter">

        <template v-slot:cell(name)="data">
            <a v-bind:href="'/products/'+data.item.id" class="text-light" v-html="data.item.name" ></a>
        </template>

        <template v-slot:cell(colors)="data">
            <div class="avatar-group">
                <a href="#!" v-for="(color,index) in data.item.colors" v-bind:key="index" class="avatar rounded-circle" v-bind:title="color.name">
                    <img alt="Image placeholder" v-if="color.image != null" class="h-100" v-bind:src="color.image.path">
                </a>

            </div>
        </template>
        

        <template v-slot:cell(Price)="data">
            <span v-html="data.item.Price"></span>
        </template>

        <template v-slot:cell(type)="data">
            <span v-if="data.item.type != null">
                <span class="font-weight-bold" v-text="data.item.type.Category+':'"></span>
                <span v-text="data.item.type.Name" ></span>
            </span>
        </template>

        <template v-slot:cell(description)="data">
            <span v-html="data.item.description"></span>
        </template>

        <template v-slot:cell(Edit)="data">
            <a class="btn btn-success" v-bind:href="'/products/'+data.item.id+'/edit'" role="button">Modifier</a>
        </template>
        <template v-slot:cell(Delete)="data">
            <form action="" method="post">
                <input type="hidden" name="_token" v-bind:value="csrf">
                <button class="text-light btn btn-danger" type="submit">Supprimer</button>
            </form>
        </template>
    </b-table>
  </div>
</template>

<script>
import {BTable , BInputGroup, BFormInput, BInputGroupAppend,BButton, BFormGroup	} from 'bootstrap-vue';
export default {
    components:{
        BTable,
        BInputGroup,
        BFormInput,
        BInputGroupAppend,
        BButton,
        BFormGroup
    },
    props:{
        data:Array,
        csrf:String
    },
    computed:{
        // items: function () {  
        //     this.data.forEach(element => {
        //         element.Price = 'Prix Client: ' + element.clientPrice + '<br>Prix revendeur: ' + element.retailerPrice;
        //     });
        // }
    },
    data:function () {  
        return{
            fields:[
                {key:'name',label:'Nom,Note',sortable:true},
                {key:'reference',label:'Référence',sortable:true},
                {key:'type',label:'Catégorie',sortable:true},
                {key:'created_at',label:'Date',sortable:true},
                {key:'visitors',label:'visiteurs',sortable:true},
                {key:'Price',label:'Prix(s)',sortable:true},
                {key:'colors',label:'Couleurs',sortable:true},
                {key:'description',label:'description',sortable:true},
                {key:'Edit',label:'Modifier',sortable:true},
                {key:'Delete',label:'Supprimer',sortable:true}
            ],
            filter: null,
            sortBy: 'id',
            sortDesc: false,
            includedFields:[
                'name','type','visitors','Price'
            ],
        }
    }
}
</script>

<style scoped>
/* [role="cell"]{
    width:50px;
} */
.table td{
    white-space: normal;
}
</style>