<template>
	<div class="container my-0">
		<div class="container">
			<div class="col-12 col-md-3 offset-md-9">
				<div class="form-group">
					<!-- <label for="">R</label> -->
					<input type="text" class="form-control bg-default" v-model="Search" @change="LoadSearch(Search)" aria-describedby="helpId" placeholder="Recherche">
				</div>

			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-dark table-hover table-sm">
				<caption v-text="this.tableData.length+ ' Commandes.'"></caption>
				<thead class="thead-default">
					<tr>
						<th v-for="(column,index) in this.columns" :scope="'col'" :colspan="column.field == 'Status'? 2:1" v-bind:key="index" v-text="column.name" ></th>
					</tr>
					</thead>
					<tbody>
						<tr v-for="order in this.tableData" v-bind:key="order.id" >
							<td v-text="order.id"></td>
							<td v-text="order.nomClient"></td>
							<td v-text="order.emailClient"></td>
							<td v-text="order.numeroClient"></td>
							<td v-text="order.addressClient"></td>
							<td >
								<span v-for="(product,index) in order.Products" v-bind:key="index">
									<a v-bind:href="'/products/' + product.id" >{{product.name}}</a> , {{product.selectedColor.name}}, {{product.reference}}, X{{product.pivot.quantity}}
									<br>
								</span>
							</td>
							<td v-text="order.Price"></td>
							<td colspan="2">
								
								<div class="form-group" style="width:8rem">
									<select 
										v-model="order.Status" 
										v-bind:class="{ 'text-danger':order.Status == 'requested',
											'text-warning':order.Status == 'waiting',
											'text-success':order.Status == 'Ready',
											'text-light':order.Status == 'Sold',
											'custom-select bg-default':true }"
										@change="updateStateChange(order.id,order.Status)"
											>
										<option v-for="(state,index) in states" v-bind:key="index" v-bind:value="state.value" :selected="order.Status == state.value ?true:false" :class="state.color" >{{state.name}}</option>
									</select>
								</div>
							</td>

						</tr>
					</tbody>
			</table>
		</div>
	</div>
</template>

<script>
export default {
    mounted(){
		var vm = this;
		this.getData('');
	},
	methods:{

		LoadSearch:function (){
			this.getData(this.Search);
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
		}
	},
	data:function (){
		return {
			Search: '',
			tableData:[

			],
			columns:[
				{name:'id',field:'id'},
				{name:'Nom Client',field:'nomClient'},
				{name:'Email Client',field:'emailClient'},
				{name:'Numéro Client',field:'numeroClient'},
				{name:'Adresse Client',field:'addressClient'},
				{name:'Produits',field:'Products'},
				{name:'Prix',field:'Price'},
				{name:'état',field:'Status'}
				
			],
			states:[
				{name:"Demandé",value:"requested",color:"text-danger"},
				{name:"En Attente",value:"waiting",color:"text-warning"},
				{name:"Prêt",value:"Ready", color:"text-success"},
				{name:"Vendu",value:"Sold", color:"text-light"},

			],
		};
	}
}
</script>

<style scoped>
</style>