
export const state = () => ({
    list: [],
    quantity: 0
  })
  
export const mutations = {
    addToCart(state, item){
        const listlen = state.list.length
        item.index = listlen;
        state.list.push(item)
    },
    removeFromCart(state, itemIndex){
        state.list.splice(itemIndex,1)
    },
    updateItemQuantity(state, {itemIndex, quantity} ){
        if(itemIndex != -1){
            state.list[itemIndex].quantity = quantity
        }
    }
}

export const actions= {
    addItemToCart ({ commit }, item) {
      commit('addToCart', item)
    },
    // $nuxt.$store.dispatch('cart/updateItemQuantity', {productId:15, quantity: 5})
    updateItemQuantity({ commit }, { itemIndex=-1, quantity=1} ){
        if(itemIndex  != -1){
            commit('updateItemQuantity', {itemIndex, quantity})
        }
    },

    removeItemFromCart({ commit }, itemIndex){
        commit('removeFromCart', itemIndex)
    }
}


export const getters = {
    totalItemsCount(state){
        return state.list.reduce((a,b) => a + b.quantity, 0)
    }
}