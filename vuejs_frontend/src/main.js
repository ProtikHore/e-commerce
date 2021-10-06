// import { createApp } from 'vue'
// import App from './App.vue'
// import router from './router'
// import store from "./store/index";

// import './index.css'

// const app = createApp(App).use(router).mount('#app');


import { createApp } from "vue";
import App from "./App.vue";
import './index.css';
import router from "./router";
import store from "./store/index.js";
import VueToast from 'vue-toast-notification';
//import 'vue-toast-notification/dist/theme-default.css';
import 'vue-toast-notification/dist/theme-sugar.css';


let authenticated = localStorage.getItem("authenticated");

if(authenticated){
    store.dispatch('authenticatedUser').then(() => {
        const app = createApp(App);
        app.use(router);
        app.use(store);
        app.use(VueToast);
        app.mount("#app");
    });
}else {
    const app = createApp(App);
    app.use(router);
    app.use(store);
    app.use(VueToast);
    app.mount("#app");
}
