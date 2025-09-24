<template>
    <div>
        <div class="p-5 rounded-xl border-1 border-gray-300 bg-white/60 backdrop-sepia-5">
            <h2 class="text-md font-semibold mb-1">Welcome back</h2>
            <p class="text-xs text-gray-500 mb-2">Enter your credentials to access your account</p>
            
            <form @submit.prevent="submit" class="space-y-2">
                <div>
                    <label for="" class="text-xs">Email or Username</label>
                    <input v-model="form.email" type="text" placeholder="Enter your email or username" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none text-sm">
                </div>
                <div>
                    <label for="" class="text-xs">Password</label>
                    <input v-model="form.password" type="password" placeholder="Enter your password" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none text-sm">
                </div>
                <button type="submit" class="w-full mt-3 bg-gray-900 text-xs text-white py-2 rounded-lg hover:bg-gray-700 transition cursor-pointer">
                    Sign in
                </button>
            </form>
        </div>
    </div>
</template>

<script setup>
    import AppLayout from '@/Layouts/AuthLayout.vue'
    import { ref } from 'vue'
    import { useForm } from '@inertiajs/vue3'
    import axios from 'axios'

    defineOptions({ layout: AppLayout })

    const form = useForm({
        email: '',
        password: '',
    })

    const submit = async () => {
        try {
            const response = await axios.post('/api/login', {
                email: form.email,
                password: form.password,
            }, {
                headers: {
                    Accept: 'application/json',
                }
            })

            localStorage.setItem('token', response.data.token)

        } catch (error) {
            console.error('Login failed:', error.response?.data || error.message)
        }
    }
</script>
