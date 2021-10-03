// import Vue from 'vue';
// import VueRouter from "vue-router";

// import Login from '../components/login/LoginComponent.vue';


// Vue.use(VueRouter);

// const routes = new VueRouter({
//     mode: 'history',
//     routes: [
//         {
//             path: '/',
//             name: 'login',
//             component: Login,
//         },
//     ]
// });

// export default routes;


import { createRouter, createWebHistory } from 'vue-router'
import Login from '/src/components/login/LoginComponent.vue'
import SignUp from '/src/components/signup/SignupComponent.vue'
import Product from '/src/components/product/ProductComponent.vue'
import ProductAdd from '/src/components/product/ProductAddComponent.vue'
import ProductEdit from '/src/components/product/ProductEditComponent.vue'
import Order from '/src/components/order/OrderComponent.vue'
import OrderList from '/src/components/order/OrderListComponent.vue'

const routes = [
    {
        path: '/',
        name: 'login',
        component: Login,
    },
    {
        path: '/signup',
        name: 'signup',
        component: SignUp,
    },
    {
        path: '/product',
        name: 'product',
        component: Product,
    },
    {
        path: '/product/add',
        name: 'product_add',
        component: ProductAdd,
    },
    {
        path: '/product/edit/:id',
        name: 'product_edit',
        component: ProductEdit,
    },
    {
        path: '/order',
        name: 'order',
        component: Order,
    },
    ,
    {
        path: '/order/list',
        name: 'order_list',
        component: OrderList,
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router