<template>
    <div class="log_sign">
        <div class="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2">
            <div class="bg-white px-6 py-8 rounded shadow-md text-black w-full">
               <form @submit.prevent="signup">
                    <h1 class="mb-8 text-3xl text-center">Sign up</h1>
                    <input type="text" class="border border-grey-light" name="fullname" placeholder="Full Name" />
                    <input type="text" class="border border-grey-light" name="email" placeholder="Email" />
                    <input type="password" class="border border-grey-light" name="password" placeholder="Password" />
                    <input type="password" class="border border-grey-light" name="confirm_password" placeholder="Confirm Password" />

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
                <router-link :to="{name: 'login'}" class="log_sign_button">Login</router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: () => ({
        
    })
}
</script>

<style>

</style>