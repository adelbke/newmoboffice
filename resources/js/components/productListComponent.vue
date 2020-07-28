<template>
  <div>
    <!-- <h2>Liste des Produits</h2> -->
    <div class="row justify-content-end">
      <div class="col-6">
        <div class="form-group d-flex align-items-center px-2 flex-row">
          <label for="Search" class="text-dark mr-2">Recherche</label>
          <input
            type="text"
            class="form-control border-primary"
            name="Search"
            id="Search"
            aria-describedby="helpId"
            placeholder="Recherche"
            v-model="searchValue"
          />
        </div>
      </div>
    </div>
    <div class="row justify-content-center">
      <div
        class="col-md-4 justify-content-center col-lg-3 col-12 h-100 py-2"
        v-for="product in productsList"
        :key="product.id"
      >
        <div>
          <product-component
            :id="product.id"
            :path="product.images[0].path"
            :name="product.name"
            :note="product.note"
            :price="product.clientPrice"
            :retailerPrice="product.retailerPrice"
            :description="product.description"
            :new="product.new"
          ></product-component>
        </div>

        <div class="py-2 d-flex justify-content-center flex-row">
          <a
            class="btn btn-success"
            v-bind:href="'/products/'+product.id+'/edit'"
            role="button"
          >Modifier</a>
          <form action method="post">
            <input type="hidden" name="_token" v-bind:value="csrf" />
            <button class="text-light btn btn-danger" type="submit">Supprimer</button>
          </form>
        </div>
      </div>
      <div v-if="productsList.length == 0" class="d-flex w-50 flex-column">
        <img class="w-100" src="images/undraw_empty_xct9.svg" alt />
        <span class="text-center pt-4">Vôtre Recherche n'a donné aucun résultat</span>
      </div>
    </div>
  </div>
</template>

<script>
import productItem from "./ProductComponent";
export default {
  components: {
    "product-component": productItem,
  },
  props: {
    data: Array,
    csrf: String,
  },
  data: function () {
    return {
      searchValue: "",
    };
  },
  computed: {
    productsList: function () {
      let vm = this;
      return this.data.filter(function (product) {
        return (
          product.name.toLowerCase().includes(vm.searchValue.toLowerCase()) ||
          product.description
            .toLowerCase()
            .includes(vm.searchValue.toLowerCase())
        );
      });
    },
  },
};
</script>

<style>
</style>

