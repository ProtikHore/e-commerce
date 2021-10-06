import { createStore } from "vuex";
import axios from 'axios';
import router from "../router";

const store = createStore({
  state:{
      welcome: 'Protik',
      user: {},
      authenticated: false,
      token: ''
  },

  getters:{
    getWelcome(state) {
      return state.welcome;
    },
    getUser(state) {
      return state.user;
    },
    getAuthenticated(state) {
      return state.authenticated;
    },
    getToken(state) {
      return state.token;
    }
  },

  mutations: {
    SET_USER(state, data) {
      state.user = data;
    },
    SET_AUTHENTICATED(state, data) {
      state.authenticated = data;
    },
    SET_TOKEN(state, data) {
      state.token = data;
    }
  },

  actions: {
    authenticatedUser ({ commit, dispatch }) {
      return axios.get('http://localhost:8000/api/product/get/list').then((response) => {
          commit('SET_AUTHENTICATED', true);
          commit('SET_USER', response.data);
          localStorage.setItem("authenticated", true);
          
          if(router.currentRoute.name !== null){
              router.push({ name: 'product' })
          };

      }).catch(() => {
          commit('SET_AUTHENTICATED', false)
          commit('SET_USER', null)
          localStorage.removeItem("authenticated");

          if(router.currentRoute.name !== 'login'){
              router.push({ name: 'login' })
          };
      })
    },
  }

});

export default store;