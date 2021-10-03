<template>
    <div class="h-screen w-full flex bg-gray-800">
      <!-- main -->
      <main class="w-full overflow-y-auto">
        <div class="float-right"> 
            <input v-model="search" type="text" id="search" name="search" placeholder="Search..." class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
            <button @click.prevent="searchProduct" class="py-2 px-6 bg-green-400 text-white font-bold" id="searchProductID">Search</button>
        </div>
        <div class="px-10 mt-5">
          <button @click.prevent="allProduct" class="uppercase font-bold text-2xl text-white">Product List</button >
        </div>
        <div class="px-10 grid grid-cols-4 gap-4">
            <div v-for="(product) in products" :key="product.id" class="col-span-4 sm:col-span-4 md:col-span-2 lg:col-span-1 xl:col-span-1 flex flex-col items-center">
                <div class="bg-white rounded-lg mt-5">
                    <img class="h-40 w-65 rounded-md" :src="'http://localhost:8000/' + 'storage/' + product.image"/>
                </div>
                <div class="bg-white shadow-lg rounded-lg -mt-4 w-64">
                    <div class="py-5 px-5">
                        <span class="font-bold text-gray-800 text-lg">{{product.name}}</span>
                        <div class="flex items-center justify-between">
                            <div class="text-sm text-gray-600 font-light">
                                {{product.descriptiom}}
                                <button @click.prevent="saveOrder(product)" class="items-center justify-center h-8 px-6 w-50 bg-blue-500 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Order</button>
                            </div>
                            <div class="text-2xl text-red-600 font-bold">
                                {{product.price}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </main>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data: () => ({
        products: [],
        search: '',
    }),

    methods: {
        getProductData() {
            axios.get('http://localhost:8000/api/order/buyer/product/get/list').then(response => {
                console.log(response);
                this.products = response.data;
            });
        },
        searchProduct() {
            console.log('button click');
            console.log(this.search);
            axios.get('http://localhost:8000/api/product/search/' + this.search).then(response => {
                console.log(response);
                this.products = response.data;
            });
        },
        allProduct() {
            this.getProductData();
        },
        saveOrder(product) {
            axios.post('http://localhost:8000/api/order/save/data', product).then(response => {
                console.log(response);
                this.$router.push({ name: 'order_list' });
            }).catch(error => {
                console.log(error);
            });
        },
    },

    mounted() {
        this.getProductData();
        console.log('product');
    }
}
</script>

<style>

</style>