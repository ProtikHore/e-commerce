import { createStore } from "vuex";

const store = createStore({
  // state() {
  //   // return {
  //   //   email: 'protik'
  //   // }
  //   message: 'welcome'
  // },
  state:{
      welcome: 'Protik',
      user: {}
  },
  getters:{
    getWelcome(state) {
      return state.welcome;
    },
    getUser(state) {
      return state.user;
    }
  },
  mutations: {
    SET_USER(state, data) {
      state.user = data;
    }
  }
});

export default store;