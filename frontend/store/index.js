
export const state = () => ({
    contactInfo: {},
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
    }
}


export const getters = {
}