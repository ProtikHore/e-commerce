<template>
    <div class="bg-green-200 py-5 px-2 min-h-screen ">
        <div class="bg-white p-10 md:w-4/4 lg:w-2/2 mx-auto">
            <form @submit.prevent="productAdd" enctype="multipart/form-data">
                <div class="flex items-center mb-5">
                    <label for="image" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Image</label>
                    <input type="file" v-on:change="onImageChange" id="image" name="image" placeholder="image" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                </div>
                <div class="flex items-center mb-5">
                    <label for="name" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Text</label>
                    <input v-model="productAddForm.name" type="text" id="name" name="name" placeholder="Name" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productAddForm.errors.has('name')" v-html="productAddForm.errors.get('name')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="price" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Unit Price</label>
                    <input v-model="productAddForm.price" type="text" id="price" name="price" placeholder="Price" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productAddForm.errors.has('price')" v-html="productAddForm.errors.get('price')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="quantity" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Quantity</label>
                    <input v-model="productAddForm.quantity" type="number" id="quantity" name="quantity" placeholder="Quantity" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productAddForm.errors.has('quantity')" v-html="productAddForm.errors.get('quantity')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="description" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Description</label>
                    <textarea v-model="productAddForm.description" name="description" id="description" cols="5" rows="3" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none"></textarea>
                    <div class="text-red-500" v-if="productAddForm.errors.has('description')" v-html="productAddForm.errors.get('description')"/>
                </div>
                <!-- <div class="flex items-center mb-5">
                    <label for="number" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Select</label>
                    <select class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                        <option>Surabaya</option>
                        <option>Jakarta</option>
                        <option>bandung</option>
                        <option>Tangerang</option>
                    </select>
                </div> -->
                <div class="text-right">
                    <button class="py-3 px-8 bg-green-400 text-white font-bold">Submit</button> 
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import Form from 'vform'
import axios from 'axios'
export default {
    data: () => ({
        productAddForm: new Form({
            name: '',
            price: '',
            quantity: '',
            description: '',
            image: '',
        })
    }),

    methods: {
        onImageChange(e){
            console.log(e.target.files[0]);
            this.productAddForm.image = e.target.files[0];
        },
        productAdd() {
            this.productAddForm.post('http://localhost:8000/api/product/save/data').then(response => {
                console.log(response);
                this.$router.push({ name: 'product' });
            });
        },
    },

    mounted() {
        console.log('product add');
    }
}
</script>

<style>

</style>