<template>
    <div class="bg-green-200 py-5 px-2 min-h-screen ">
        <div class="bg-white p-10 md:w-4/4 lg:w-2/2 mx-auto">
            <form @submit.prevent="productUpdate" enctype="multipart/form-data">
                <input v-model="productUpdateForm.updateImage" type="text" name="updateImage">
                <div class="flex items-center mb-5">
                    <label for="image" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Image</label>
                    <input type="file" v-on:change="onImageUpdate" id="image" name="image" placeholder="image" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                </div>
                <div class="flex items-center mb-5">
                    <label for="name" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Text</label>
                    <input v-model="productUpdateForm.name" type="text" id="name" name="name" placeholder="Name" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productUpdateForm.errors.has('name')" v-html="productUpdateForm.errors.get('name')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="price" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Unit Price</label>
                    <input v-model="productUpdateForm.price" type="text" id="price" name="price" placeholder="Price" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productUpdateForm.errors.has('price')" v-html="productUpdateForm.errors.get('price')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="quantity" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Quantity</label>
                    <input v-model="productUpdateForm.quantity" type="number" id="quantity" name="quantity" placeholder="Quantity" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none">
                    <div class="text-red-500" v-if="productUpdateForm.errors.has('quantity')" v-html="productUpdateForm.errors.get('quantity')"/>
                </div>
                <div class="flex items-center mb-5">
                    <label for="description" class="inline-block w-20 mr-6 text-right font-bold text-gray-600">Description</label>
                    <textarea v-model="productUpdateForm.description" name="description" id="description" cols="5" rows="3" class="flex-1 py-2 border-b-2 border-gray-400 focus:border-green-400 text-gray-600 placeholder-gray-400 outline-none"></textarea>
                    <div class="text-red-500" v-if="productUpdateForm.errors.has('description')" v-html="productUpdateForm.errors.get('description')"/>
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
                    <button class="py-3 px-8 bg-green-400 text-white font-bold">Update</button> 
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import Form from 'vform';
import axios from 'axios';
export default {
    data: () => ({
        productUpdateForm: new Form({
            name: '',
            price: '',
            quantity: '',
            description: '',
            image: '',
            updateImage: '',
        })
    }),

    methods: {
        getProductUpdateData() {
            let id = this.$route.params.id;
            console.log(id);
            axios.get('http://localhost:8000/api/product/get/update/data/' + id).then(response => {
                console.log(response);
                this.productUpdateForm.name = response.data.name;
                this.productUpdateForm.price = response.data.price;
                this.productUpdateForm.quantity = response.data.quantity;
                this.productUpdateForm.description = response.data.description;
                this.productUpdateForm.updateImage = response.data.image;
            });
        },
        onImageUpdate(e){
            console.log(e.target.files[0]);
            this.productUpdateForm.image = e.target.files[0];
        },
        productUpdate() {
            let id = this.$route.params.id;
            this.productUpdateForm.post('http://localhost:8000/api/product/update/data/' + id).then(response => {
                console.log(response);
                this.$router.push({ name: 'product' });
            });
        },
    },

    mounted() {
        this.getProductUpdateData();
        console.log('product update');
    }
}
</script>

<style>

</style>