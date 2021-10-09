<template>
    <div class="log_sign">
        <div class="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2">
            <h2 class="text-blue-400 mb-2 items-center text-3xl">Buyer Signup</h2>
            <div class="bg-white px-6 py-8 rounded shadow-md text-black w-full">
               <form @submit.prevent="signup">
                    <h1 class="mb-8 text-3xl text-center">Sign up</h1>
                    <input v-model="signupForm.name" type="text" class="border border-grey-light" name="name" placeholder="Full Name" :class="{ 'text-sm sm:text-base relative w-full border rounded placeholder-gray-400 focus:border-indigo-400 focus:outline-none py-2 pr-2 pl-12 border-red-500': signupForm.errors.has('name') }"/>
                    <div class="text-red-500" v-if="signupForm.errors.has('name')" v-html="signupForm.errors.get('name')"/>

                    <input v-model="signupForm.email" type="text" class="border border-grey-light" name="email" placeholder="Email" :class="{ 'text-sm sm:text-base relative w-full border rounded placeholder-gray-400 focus:border-indigo-400 focus:outline-none py-2 pr-2 pl-12 border-red-500': signupForm.errors.has('email') }"/>
                    <div class="text-red-500" v-if="signupForm.errors.has('email')" v-html="signupForm.errors.get('email')"/>

                    <input v-model="signupForm.password" type="password" class="border border-grey-light" name="password" placeholder="Password" :class="{ 'text-sm sm:text-base relative w-full border rounded placeholder-gray-400 focus:border-indigo-400 focus:outline-none py-2 pr-2 pl-12 border-red-500': signupForm.errors.has('password') }"/>
                    <div class="text-red-500" v-if="signupForm.errors.has('password')" v-html="signupForm.errors.get('password')"/>

                    <button type="submit" class="w-full text-center py-3 rounded bg-green-500 text-white hover:bg-green-900 focus:outline-none my-1">Create Account</button>
               </form>
                <div class="text-center text-sm text-grey-dark mt-4">By signing up, you agree to the 
                    <a class="no-underline border-b border-grey-dark text-grey-dark" href="#">
                        Terms of Service
                    </a> and 
                    <a class="no-underline border-b border-grey-dark text-grey-dark" href="#">
                        Privacy Policy
                    </a>
                </div>
            </div>
            <div class="text-grey-dark mt-6">
                Already have an account? 
                <router-link :to="{name: 'buyer_login'}" class="log_sign_button">Login</router-link>
            </div>
        </div>
    </div>
</template>

<script>
import Form from 'vform'
import axios from 'axios'
import {API_BASE_URL} from '../../config';
export default {
    data: () => ({
        signupForm: new Form({
            name: '',
            email: '',
            password: '',
        })
    }),

    methods: {
        signup() {
            console.log('click');
            console.log(this.signupForm.name);
            this.signupForm.post(`${API_BASE_URL}/buyer/signup`).then(response => {
                console.log(response.data);
                this.$toast.success('Registrtion Successfull', {
                    position: 'bottom-right'
                });
                this.$router.push({ name: 'buyer_login' });
            });
        },
    },

    mounted() {
        console.log('signup');
    }
}
</script>

<style>

</style>