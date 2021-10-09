<template>
    <div class="log_sign">
        <h2 class="text-blue-400 items-center text-3xl">Buyer Login</h2>
        <form @submit.prevent="login" class="flex flex-col bg-white rounded shadow-lg p-12 mt-12" action="">
            <label class="font-semibold text-xs" for="usernameField">Username or Email</label>
            <input v-model="loginForm.email" class="flex items-center h-12 px-4 w-64 bg-gray-200 mt-2 rounded focus:outline-none focus:ring-2" type="text" :class="{ 'text-sm sm:text-base relative w-full border rounded placeholder-gray-400 focus:border-indigo-400 focus:outline-none py-2 pr-2 pl-12 border-red-500': loginForm.errors.has('email') }">
            <div class="text-red-500" v-if="loginForm.errors.has('email')" v-html="loginForm.errors.get('email')"/>

            <label class="font-semibold text-xs mt-3" for="passwordField">Password</label>
            <input v-model="loginForm.password" class="flex items-center h-12 px-4 w-64 bg-gray-200 mt-2 rounded focus:outline-none focus:ring-2" type="password" :class="{ 'is-invalid': loginForm.errors.has('password') }">
            <div class="text-red-500" v-if="loginForm.errors.has('password')" v-html="loginForm.errors.get('password')"/>

            <button class="flex items-center justify-center h-12 px-6 w-64 bg-blue-600 mt-8 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Login</button>
            <div class="flex mt-6 justify-center text-xs">
                <span class="mx-2 text-gray-300">/</span>
                <router-link :to="{name: 'buyer_signup'}" class="log_sign_button">Sign Up</router-link>
            </div>
        </form>
    </div>
</template>

<script>
import Form from 'vform'
import axios from 'axios'
import {API_BASE_URL} from '../../config';
export default {
    data: () => ({
        loginForm: new Form({
            email: '',
            password: '',
        })
    }),

    methods: {
        login() {
            console.log('click');
            this.loginForm.post(`${API_BASE_URL}/buyer/login`).then(response => {
                console.log(response.data);
                this.$toast.success('Login Successfull', {
                    position: 'bottom-right'
                });
                let token = response.data.token.split('|');
                console.log(token);
                this.$store.commit('SET_BUYER_TOKEN', token[1]);
                localStorage.setItem('buyer_token', token[1]);
                let user = response.data.user;
                this.$store.commit('SET_BUYER', user);
                this.$store.commit('SET_BUYER_AUTHENTICATED', true);
                localStorage.setItem('buyer_authenticated', true);
                this.$router.push({ name: 'order' });
            });
        },
    },

    mounted() {
        console.log('login');
    }
}
</script>

<style>

</style>