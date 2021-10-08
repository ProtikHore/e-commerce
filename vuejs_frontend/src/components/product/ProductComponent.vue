<template>
    <div class="overflow-x-auto">
        <div class="min-w-screen min-h-screen bg-gray-100 flex justify-center bg-gray-100 font-sans overflow-hidden">
            <div class="">
                <AdminLayout />
            </div>
            <div class="w-full">
                <div class="flow-root ">
                    <div class="float-left">
                        <router-link :to="{name: 'product_add'}"><button class="items-center justify-center h-12 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Add</button></router-link>
                    </div>
                    {{user}}
                    <div class="float-right"> 
                        <input v-model="search" type="text" id="search" name="search" placeholder="Search..." class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                        <button @click.prevent="searchProduct" class="py-2 px-6 bg-green-400 text-white font-bold" id="searchProductID">Search</button>
                    </div>
                </div>
                <div class="bg-white shadow-md rounded my-6">
                    <table class="min-w-max w-full table-auto">
                        <thead>
                            <tr class="bg-blue-200 text-gray-600 uppercase text-sm leading-normal">
                                <th class="py-3 px-6 text-left">Image</th>
                                <th class="py-3 px-6 text-left">Name</th>
                                <th class="py-3 px-6 text-center">Description</th>
                                <th class="py-3 px-6 text-center">Price</th>
                                <th class="py-3 px-6 text-center">Quantity</th>
                                <th class="py-3 px-6 text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody v-if="products.length" class="text-gray-600 text-sm font-light">
                            <tr v-for="(product) in products" :key="product.id" class="border-b border-gray-200 hover:bg-gray-100">
                                <td class="py-3 px-6 text-left">
                                    <div class="flex items-center">
                                        <div class="mr-2">
                                            <img class="w-20 h-20 rounded-full" :src="'http://localhost:8000/' + 'storage/' + product.image"/>
                                        </div>
                                        <!-- <span>{{product.image}}</span> -->
                                    </div>
                                </td>
                                <td class="py-3 px-6 text-left whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="mr-2">
                                            <span class="font-medium">{{product.name}}</span>
                                        </div>
                                    </div>
                                </td>
                                <td class="py-3 px-6 text-center">
                                    <div class="flex items-center justify-center">
                                        <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{product.description}}</span>
                                    </div>
                                </td>
                                <td class="py-3 px-6 text-center">
                                    <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{product.price}}</span>
                                </td>
                                <td class="py-3 px-6 text-center">
                                    <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{product.quantity}}</span>
                                </td>
                                <td class="py-3 px-6 text-center">
                                    <div class="flex item-center justify-center">
                                        <div class="cursor-pointer w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                            <router-link :to="{ name: 'product_edit', params: {id: product.id } }">
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                </svg>
                                            </router-link>
                                        </div>
                                        <div class="cursor-pointer w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                            <router-link :to="{ name: 'product_edit', params: {id: product.id } }">
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                                </svg>
                                            </router-link>
                                        </div>
                                        <div class="cursor-pointer w-4 mr-2 transform hover:text-purple-500 hover:scale-110">
                                            <svg @click.prevent="deleteProduct(product)" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                            </svg>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tbody v-else>
                            <tr>
                                <td>
                                    <h5 class="items-center mt-4 mb-4">No Products found.</h5>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import {API_BASE_URL} from '../../config';
import AdminLayout from '../../components/admin/AdminLayoutComponent.vue'
export default {
    components: {
        AdminLayout, 
    },

    computed: {
        welcome() {
            return this.$store.getters.getWelcome;
        },
        user() {
            return this.$store.getters.getUser;
        }
    },

    data: () => ({
        products: [],
        search: '',
    }),

    methods: {
        getProductData() {
            //axios.defaults.headers.common['Authorization'] = `Bearer MFPUP2KACIGQOVWpMk2A19p0MxlKRzwlK0N9RKXi}`;
            axios.get(`${API_BASE_URL}/product/get/list`, {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${localStorage.getItem('token')}`
            }
            }).then(response => {
                console.log(response);
                this.products = response.data;
            });
        },
        searchProduct() {
            console.log('button click');
            console.log(this.search);
            axios.get(`${API_BASE_URL}/product/search/${this.search}`).then(response => {
                console.log(response);
                this.products = response.data;
            });
        },
        deleteProduct(product) {
            console.log(`button click delete this product: Name:  ${product.name} Price: ${product.price}`);
            console.log(product.id);
            if(confirm(`    Are You sure want delete this product 
                    Name:  ${product.name}
                    Price: ${product.price}`)){
                console.log('yes');
                axios.post(`${API_BASE_URL}/product/delete/data/${product.id}`).then(response => {
                    console.log(response);
                    this.$toast.success('Delete Successfull', {
                        position: 'bottom-right'
                    });
                    this.getProductData();
                }).catch(error => {
                    console.log(error);
                });
            }
        }
    },

    mounted() {
        console.log(localStorage.getItem('token'));
        this.getProductData();
        console.log('product');
    }
}
</script>

<style>

</style>