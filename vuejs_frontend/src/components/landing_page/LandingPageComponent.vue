<template>
    <div class="overflow-x-auto">
        <div class="min-w-screen min-h-screen bg-gray-100 flex justify-center bg-gray-100 font-sans overflow-hidden">
            <!-- <h2 class="text-blue-400 text-3xl">Welcome To E-COMMERCE Website</h2> -->
            <div class="flex items-center justify-center">
                <div class="m-3">
                    <router-link :to="{name: 'admin_login'}">
                        <button class="bg-white text-gray-800 font-bold rounded border-b-2 border-green-500 hover:border-green-600 hover:bg-green-500 hover:text-white shadow-md py-2 px-6 inline-flex items-center">
                            <span class="mr-2">Admin Login</span>
                        </button>
                    </router-link>
                </div>
                
                <div class="m-3">
                    <router-link :to="{name: 'buyer_login'}">
                        <button class="bg-white text-gray-800 font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-white shadow-md py-2 px-6 inline-flex items-center">
                            <span class="mr-2">Buyer Login</span>
                        </button>
                    </router-link>
                </div>
                
                <div class="m-3">
                    <router-link :to="{name: 'buyer_signup'}">
                        <button class="bg-white text-gray-800 font-bold rounded border-b-2 border-yellow-500 hover:border-yellow-600 hover:bg-yellow-500 hover:text-white shadow-md py-2 px-6 inline-flex items-center">
                            <span class="mr-2">Buyer Signup</span>
                        </button>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style>

</style>