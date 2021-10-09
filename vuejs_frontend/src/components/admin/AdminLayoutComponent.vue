<template>
    <div class="md:flex flex-col md:flex-row md:min-h-screen w-full">
        <div class="flex flex-col w-full md:w-64 text-gray-700 bg-white dark-mode:text-gray-200 dark-mode:bg-gray-800 flex-shrink-0">
            <nav class="flex-grow md:block px-4 pb-4 md:pb-0 md:overflow-y-auto">
            <router-link :to="{name: 'admin_dashboard'}">
                <a class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 bg-gray-200 rounded-lg dark-mode:bg-gray-700 dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Dashboard</a>
            </router-link>
            <router-link :to="{name: 'product'}">
                <a class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Product</a>
            </router-link>
            <router-link :to="{name: 'admin_order_list'}">
                <a class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Order List</a>
            </router-link>
            <a @click.prevent="logout" class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">Logout</a>
            </nav>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import {API_BASE_URL} from '../../config';
export default {
    methods: {
        logout() {
            console.log('button click');
            axios.get(`${API_BASE_URL}/product/admin/logout`, {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${localStorage.getItem('token')}`
            }
            }).then(response => {
                console.log(response);
                //window.localStorage.clear(); //clear all localstorage
                localStorage.removeItem('token');
                localStorage.setItem('authenticated', false);
                this.$router.push({ name: 'admin_login' });
            });
        },
    },

    mounted() {
        console.log(localStorage.getItem('token'));
        console.log('admin layout');
    }
}
</script>

<style>

</style>