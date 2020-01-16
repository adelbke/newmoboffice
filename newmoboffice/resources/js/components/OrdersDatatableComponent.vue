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
      
      <b-table striped hover dark responsive 
        :items="tableData" :fields="fields"
        :sort-by.sync="sortBy"
        :sort-desc.sync="sortDesc"
        sort-icon-left
        :filter-included-fields="includedFields"
        :filter="filter"
      >
      <template v-slot:cell(Products)="data">
        <span v-for="(product,index) in data.value" v-bind:key="index">
            <a v-bind:href="'/products/' + product.id" >{{product.name}}</a> , {{product.selectedColor.name}}, {{product.reference}}, X{{product.pivot.quantity}}
            <br>
        </span>
      </template>
      <template v-slot:cell(Status)="data">
            <div class="form-group">
                <select 
                    v-model="data.value" 
                    v-bind:class="{ 'text-danger':data.value == 'requested',
                        'text-warning':data.value == 'waiting',
                        'text-success':data.value == 'Ready',
                        'text-light':data.value == 'Sold',
                        'custom-select bg-default':true }"
                    @change="updateStateChange(data.item.id,data.value)"
                        >
                    <option v-for="(state,index) in states" v-bind:key="index" v-bind:value="state.value" :selected="data.value == state.value ?true:false" :class="state.color" >{{state.name}}</option>
                </select>
            </div>
      </template>
      
      </b-table>
  </div>
</template>

<script>
import {BTable , BInputGroup, BFormInput, BInputGroupAppend,BButton, BFormGroup	} from 'bootstrap-vue';
export default {
    mounted(){
        var vm = this;
        this.getData('');
    },
    data : function (){
        return {
            filter: null,
            includedFields:[
                'nomClient',
                'emailClient',
                'Products',
                'Price',
            ],
            sortBy: 'id',
            sortDesc: false,
            tableData:[],
            fields:[
                {key:'id',label:'id', sortable: true},
                {key:'nomClient',label:'Nom Client', sortable: true},
                {key:'emailClient',label:'Email Client', sortable: true},
                {key:'addressClient',label:'Adresse Client', sortable: true},
                {key:'Products',label:'Produits', sortable: true},
                {key:'Price',label:'Prix', sortable: true},
                {key:'Status',label:'Status', sortable: true},
            ],
            states:[
				{name:"Demandé",value:"requested",color:"text-danger"},
				{name:"En Attente",value:"waiting",color:"text-warning"},
				{name:"Prêt",value:"Ready", color:"text-success"},
				{name:"Vendu",value:"Sold", color:"text-light"},

			],
        };
    },
    components:{
        BTable,
        BInputGroup,
        BFormInput,
        BInputGroupAppend,
        BButton,
        BFormGroup
    },
    methods:{
        getData:function (searchTerms){
			var vm = this;
			axios.post('/orders/fullList', {
                search:searchTerms,
			})
			.then(function (response) {
				var table = response.data;
				vm.tableData = [];
				if(table.length == 0){return;}
				table.forEach(element => {
					element.products.forEach(product => {
						product.selectedColor= product.colors.filter(function (item){return (item.id == product.pivot.color_id)})[0]
					});
					vm.tableData.push({
						id:element.id,
						nomClient:element.client.user.name,
						emailClient:element.client.user.email,
						numeroClient:element.client.phone,
						addressClient:element.client.address,
						Products:element.products,
						Price:element.price,
						Status:element.state
					})
				});
			})
			.catch(function (error) {
			})
        },
        updateStateChange: function (orderid,state){
			axios.post('/orders/update', {
					orderid:orderid,
					newstate:state
			})
			.then(function (response) {
			})
			.catch(function (error) {
			})
		},
    }
}
</script>

<style scoped>
#filterInput{
    color:var(--gray-dark);
}
</style>