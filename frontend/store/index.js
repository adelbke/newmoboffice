
export const state = () => ({
    contactInfo: {
        num_tel:'',
        page_facebook: '',
        page_insta: '',
        adresse: ''
    },
  })
  
export const mutations = {
    setContactInfo(state, contactInfo){
        state.contactInfo= contactInfo
    }
}

export const actions= {
    async fetchCredentials({ commit }) {
        const contactInfo = await $nuxt.$strapi.find('info-contact')
        commit('setContactInfo',contactInfo)
    },
    async fetchCategories({ commit }) {
        const categoriesList = await $nuxt.$strapi.find('categories')
        commit('SET_CATEGORIES', categoriesList)
    }
}


export const getters = {
}