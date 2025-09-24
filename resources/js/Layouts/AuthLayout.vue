<template>
	<div class="h-screen flex items-center justify-center bg-gradient-to-r from-orange-200 via-pink-200 to-blue-200">
		<div class="absolute inset-0">
			<img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&q=80&w=2000&auto=format&fit=crop" alt="mountains background" class="w-full h-full object-cover opacity-60">
		</div>

		<!-- Card -->
		<div class="relative z-10 w-full max-w-md p-8">
			<!-- Title -->
			<h1 class="text-2xl font-bold text-center mb-1">Social</h1>
			<p class="text-sm text-gray-900 text-center mb-6">Connect with friends and share your moments</p>

			<div class="w-full flex justify-center mb-6 rounded-full backdrop-blur-lg px-1 py-1">
				<a href="/login" class="w-1/2 py-1 text-center text-xs rounded-full font-medium cursor-pointer" :class="routeName == 'login' ? 'bg-gray-50' : ''">Login</a>
				<a href="/register" class="w-1/2 py-1 text-center text-xs rounded-full font-medium cursor-pointer" :class="routeName == 'register' ? 'bg-gray-50' : ''">Register</a>
			</div>
			
			<slot />

			<div class="flex items-center flex-col mt-2 rounded-xl border-1 border-gray-300 bg-white/50 backdrop-sepia-5 py-2">
				<span class="text-xs font-bold text-slate-400">Demo account for testing: </span>
				<div class="flex gap-2 items-center justify-center mt-1 font-semibold text-slate-400">
					<span class="text-xs">Email: demo@example.com</span>
					<span class="text-xs">Password: demo123</span>
				</div>  
			</div>
        </div>
    </div>
</template>    

<script setup>
	import { onMounted, ref } from 'vue';

    const routeName = ref(window.location.pathname.split('/')[1]);

	onMounted(() => {
		console.log(routeName.value);
	});

</script>