<template>
    <div>
        <div class="p-5 rounded-xl border-1 border-gray-300 bg-white/60 backdrop-sepia-5">
            <h2 class="text-md font-semibold mb-1">Create account</h2>
            <p class="text-xs text-gray-500 mb-2">Join our community and start sharing</p>
            
            <form class="space-y-2">
                <div>
                    <label for="" class="text-xs">Username</label>
                    <input type="text" placeholder="Choose your username" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none">
                </div>
                <div>
                    <label for="" class="text-xs">Email</label>
                    <input type="text" placeholder="Enter your email" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none">
                </div>
                <div>
                    <label for="" class="text-xs">Password</label>
                    <input type="password" placeholder="Enter your password" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none">
                </div>
                <div>
                    <label for="" class="text-xs">Profile Picture URL (Optional)</label>
                    <input type="password" placeholder="https://example.com/your-photo.jpg" class="w-full px-3 py-1 bg-gray-50 border-1 placeholder:text-xs border-gray-100 rounded-lg focus:outline-none">
                </div>
                <button type="submit" class="w-full mt-3 bg-gray-900 text-xs text-white py-2 rounded-lg hover:bg-gray-700 transition cursor-pointer">
                    Create Account
                </button>
            </form>
        </div>
    </div>
</template>

<script setup>
    import AppLayout from '@/Layouts/AuthLayout.vue'

    defineOptions({ layout: AppLayout })
</script>