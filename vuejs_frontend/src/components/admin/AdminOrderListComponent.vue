<template>
    <div class="overflow-x-auto">
        <div class="min-w-screen min-h-screen bg-gray-100 flex justify-center bg-gray-100 font-sans overflow-hidden">
            <div class="">
                <AdminLayout />
            </div>
            <div class="w-full">
                <div class="flow-root ">
                    <div class="relative inline-flex">
                        <svg class="w-2 h-2 absolute top-0 right-0 m-4 pointer-events-none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 412 232"><path d="M206 171.144L42.678 7.822c-9.763-9.763-25.592-9.763-35.355 0-9.763 9.764-9.763 25.592 0 35.355l181 181c4.88 4.882 11.279 7.323 17.677 7.323s12.796-2.441 17.678-7.322l181-181c9.763-9.764 9.763-25.592 0-35.355-9.763-9.763-25.592-9.763-35.355 0L206 171.144z" fill="#648299" fill-rule="nonzero"/></svg>
                        <select v-on:change="changeStatus" class="border border-gray-300 rounded-full text-gray-600 h-10 pl-5 pr-10 bg-white hover:border-gray-400 focus:outline-none appearance-none">
                            <option value="">Select Status</option>
                            <option value="Pending">Pending</option>
                            <option value="Approved">Approved</option>
                            <option value="Rejected">Rejected</option>
                            <option value="Processing">Processing</option>
                            <option value="Delivered">Delivered</option>
                        </select>
                    </div>
                    <div class="float-right"> 
                        <input v-model="search" type="text" id="search" name="search" placeholder="Search..." class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                        <button @click.prevent="searchProduct" class="py-2 px-6 bg-green-400 text-white font-bold" id="searchProductID">Search</button>
                    </div>
                </div>
                <div class="bg-white shadow-md rounded my-6">
                    <table class="min-w-max w-full table-auto">
                        <div v-for="(orderList) in orderLists" :key="orderList.id">
                            <h2>Order Number: {{orderList.order_number}}</h2>
                            <p>Date: {{orderList.created_at}}</p>
                            <p>Order Status: <span :class="{ 'text-red-500': orderList.status === 'Pending', 'text-green-500' : orderList.status === 'Approved', 'text-red-500' : orderList.status === 'Rejected', 'text-yellow-500' : orderList.status === 'Processign' }">{{orderList.status}}</span></p>
                            <tbody v-if="orderLists.length" class="text-gray-600 text-sm font-light">
                                <tr v-for="(orderDetail, index) in orderList.order_detail" :key="orderList.order_detail[index].id" class="border-b border-gray-200 hover:bg-gray-100">
                                    <td class="py-3 px-6 text-left">
                                        <div class="flex items-center">
                                            <div class="mr-2">
                                                <img class="w-20 h-20 rounded-full" :src="'http://localhost:8000/' + 'storage/' + orderDetail.product.image"/>
                                            </div>
                                            <!-- <span>{{product.image}}</span> -->
                                        </div>
                                    </td>
                                    <td class="py-3 px-6 text-left whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="mr-2">
                                                <span class="font-medium">{{orderDetail.product.name}}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-3 px-6 text-center">
                                        <div class="flex items-center justify-center">
                                            <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{orderDetail.product.description}}</span>
                                        </div>
                                    </td>
                                    <td class="py-3 px-6 text-center">
                                        <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{orderDetail.price}}</span>
                                    </td>
                                    <td class="py-3 px-6 text-center">
                                        <span class="bg-purple-200 text-purple-600 py-1 px-3 rounded-full text-xs">{{orderDetail.quantity}}</span>
                                    </td>


                                    <div v-if="orderList.status === 'Pending'" class="mt-7 flex items-center justify-center">
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="approvedReject(orderList.id, 'Approved')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Approved</button>
                                        </td>
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="approvedReject(orderList.id, 'Rejected')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Reject</button>
                                        </td>
                                    </div>
                                    <div v-if="orderList.status === 'Approved'" class="mt-7 flex items-center justify-center">
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Processing')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Processign</button>
                                        </td>
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Shipped')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Shipped</button>
                                        </td>
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Delivered')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Delivered</button>
                                        </td>
                                    </div>
                                    <div v-if="orderList.status === 'Processing'" class="mt-7 flex items-center justify-center">
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Shipped')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Shipped</button>
                                        </td>
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Delivered')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Delivered</button>
                                        </td>
                                    </div>
                                    <div v-if="orderList.status === 'Shipped'" class="mt-7 flex items-center justify-center">
                                        <td class="py-3 px-6 text-center">
                                            <button @click.prevent="updateStatus(orderList.id, 'Delivered')" class="gap-4 h-6 px-6 w-50 bg-blue-600 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Delivered</button>
                                        </td>
                                    </div>

                                </tr>
                            </tbody>
                            <tbody v-else>
                                <tr>
                                    <td>
                                        <h5 class="items-center mt-4 mb-4">No Products found.</h5>
                                    </td>
                                </tr>
                            </tbody>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import {API_BASE_URL} from '../../config';
import AdminLayout from '../../components/admin/AdminLayoutComponent.vue'
export default {
    components: {
        AdminLayout, 
    },

    data: () => ({
        orderLists: [],
        search: '',
    }),
    methods: {
        getOrderList() {
            axios.get('http://localhost:8000/api/order/get/list').then(response => {
                console.log(response);
                console.log(response.data[0].buyer.name);
                console.log(response.data[0].order_detail[0].product.price);
                this.orderLists = response.data;
            });
        },
        changeStatus(event) {
            console.log(event.target.value);
            axios.get(`http://localhost:8000/api/order/filer/status/${event.target.value}`).then(response => {
                console.log(response);
                this.orderLists = response.data;
            });
        },
        approvedReject(id, status) {
            console.log(id + '-' + status);
            axios.put(`${API_BASE_URL}/product/approve/reject/order/${id}/${status}`, {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${localStorage.getItem('token')}`
            }
            }).then(response => {
                console.log(response);
                this.$toast.success('Update Status Successfull', {
                    position: 'bottom-right'
                });
                this.getOrderList();
            });
        },
        updateStatus(id, status) {
            console.log(id + '-' + status);
            axios.put(`${API_BASE_URL}/product/update/status/${id}/${status}`, {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${localStorage.getItem('token')}`
            }
            }).then(response => {
                console.log(response);
                this.$toast.success('Update Status Successfull', {
                    position: 'bottom-right'
                });
                this.getOrderList();
            });
        },
        searchProduct() {
            console.log('button click');
            console.log(this.search);
            axios.get(`${API_BASE_URL}/product/search/unique/${this.search}`).then(response => {
                console.log(response);
                this.orderLists = response.data;
            });
        },
    },

    mounted() {
        console.log(localStorage.getItem('token'));
        this.getOrderList();
        console.log('product');
    }
}
</script>

<style>

</style>