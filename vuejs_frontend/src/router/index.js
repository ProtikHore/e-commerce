import { createRouter, createWebHistory } from 'vue-router'
import LandingPage from '/src/components/landing_page/LandingPageComponent.vue'
import AdminLogin from '/src/components/login/AdminLoginComponent.vue'
import AdminDashboard from '/src/components/admin/AdminDashboardComponent.vue'


import BuyerLogin from '/src/components/login/BuyerLoginComponent.vue'
import BuyerSignUp from '/src/components/signup/BuyerSignupComponent.vue'
import Product from '/src/components/product/ProductComponent.vue'
import ProductAdd from '/src/components/product/ProductAddComponent.vue'
import ProductEdit from '/src/components/product/ProductEditComponent.vue'
import Order from '/src/components/order/OrderComponent.vue'
import OrderList from '/src/components/order/OrderListComponent.vue'

const routes = [
    {
        path: '/',
        name: 'landing_page',
        component: LandingPage,
    },
    {
        path: '/admin/login',
        name: 'admin_login',
        component: AdminLogin,
    },
    {
        path: '/admin/dashboard',
        name: 'admin_dashboard',
        component: AdminDashboard,
    },
    {
        path: '/buyer/login',
        name: 'buyer_login',
        component: BuyerLogin,
    },
    {
        path: '/buyer/signup',
        name: 'buyer_signup',
        component: BuyerSignUp,
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