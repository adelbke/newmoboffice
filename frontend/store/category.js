
export const state = () => ({
    categories: [],
})

export const mutations = {
    SET_CATEGORIES(state, categories) {
        state.categories = categories
    }
}

export const actions = {
    async fetchCategories({ commit }) {
        const categoriesList = await $nuxt.$strapi.find('categories')
        commit('SET_CATEGORIES', categoriesList)
    },
    async setCategories({ commit}, categoriesList){
        commit('SET_CATEGORIES', categoriesList)
    }
}


export const getters = {
    byId: (state) => (id) => state.categories.find(category => category.id === id),
    byParentId: (state) => (id) => {
        return state.categories.filter(category => {
            if (typeof category.parent === 'object' && category.parent !== null) {
                return category.parent.id === id
            } else {
                return category.parent === id
            }
        })
    },
    childrenById: (state, getters) => (id) => {
        let children = getters.byParentId(id)
        let grandChildren = []
        children.forEach(child => {
            grandChildren = grandChildren.concat(getters.childrenById(child.id))
        });

        return children.concat(grandChildren)
    },
    childrenFilterBySlug: (state, getters) => (slug) => {
        const category = getters.bySlug(slug)
        let children = getters.childrenById(category.id)
        children.push(category)
        let output = []
        children.forEach(element => {
            output.push({ category: element.id })
        });
        return output
    },
    bySlug: (state) => (slug) => state.categories.find(category => category.slug === slug),
    list(state){
        return state.categories
    }
}