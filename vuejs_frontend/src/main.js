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
// Import one of the available themes
//import 'vue-toast-notification/dist/theme-default.css';
import 'vue-toast-notification/dist/theme-sugar.css';

const app = createApp(App);
app.use(router);
app.use(store);
app.use(VueToast);
app.mount("#app");
