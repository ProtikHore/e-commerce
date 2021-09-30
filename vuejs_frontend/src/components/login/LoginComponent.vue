<template>
    <div class="log_sign">
        <form class="flex flex-col bg-white rounded shadow-lg p-12 mt-12" action="">
            <label class="font-semibold text-xs" for="usernameField">Username or Email</label>
            <input v-model="loginForm.email" class="flex items-center h-12 px-4 w-64 bg-gray-200 mt-2 rounded focus:outline-none focus:ring-2" type="text">
            <div class="text-danger" v-if="loginForm.errors.has('email')" v-html="loginForm.errors.get('email')" :class="{ 'is-invalid': loginForm.errors.has('email') }" />

            <label class="font-semibold text-xs mt-3" for="passwordField">Password</label>
            <input v-model="loginForm.password" class="flex items-center h-12 px-4 w-64 bg-gray-200 mt-2 rounded focus:outline-none focus:ring-2" type="password">
            <div class="text-danger" v-if="loginForm.errors.has('password')" v-html="loginForm.errors.get('password')" :class="{ 'is-invalid': loginForm.errors.has('password') }" />

            <button class="flex items-center justify-center h-12 px-6 w-64 bg-blue-600 mt-8 rounded font-semibold text-sm text-blue-100 hover:bg-blue-700">Login</button>
            <div class="flex mt-6 justify-center text-xs">
                <a class="text-blue-400 hover:text-blue-500" href="#">Forgot Password</a>
                <span class="mx-2 text-gray-300">/</span>
                <router-link :to="{name: 'signup'}" class="log_sign_button">Sign Up</router-link>
            </div>
        </form>
    </div>
</template>

<script>
import Form from 'vform'
export default {
    data: () => ({
        loginForm: new Form({
            email: '',
            password: '',
        })
    })
}
</script>

<style>

</style>