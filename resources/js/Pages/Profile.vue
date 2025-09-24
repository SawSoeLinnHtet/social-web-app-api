<template>
	<div>
		<!-- Navbar -->
		<header class="bg-white shadow-md sticky top-0 z-10">
			<div class="max-w-6xl mx-auto px-4 flex items-center justify-between h-14">
				<div class="flex items-center gap-6">
					<div class="flex items-center gap-2">
						<div class="bg-black px-3 py-1 border-1 rounded-lg">
							<span class="text-gray-50 text-sm font-bold">S</span>
						</div>
						<span class="text-black font-bold">Social</span>
					</div>
					<nav class="flex items-center gap-3">
						<a href="#" class="flex items-center gap-2 px-3 py-2 rounded-md">
							<HomeIcon class="size-4 text-gray-800"/>
							<span class="text-xs font-bold">Home</span>
						</a>
						<a href="#" class="flex items-center gap-2 px-3 py-1 rounded-md bg-gray-900 text-white">
							<UserIcon class="size-4 text-gray-50"/>
							<span class="text-xs">Profile</span>
						</a>
					</nav>
				</div>
				<div class="flex items-center gap-4">
					<div class="flex items-center gap-2">
						<div class="bg-gray-300 rounded-full p-1">
							<img :src="asset('images/icon/user.png')" alt="no-pf" class="w-4"/>
						</div>
						<span class="text-xs font-semibold">alex_dev</span>
					</div>
					<button class="flex items-center gap-1 cursor-pointer text-sm text-gray-600 hover:text-red-500">
						<ArrowLeftStartOnRectangleIcon class="size-4 scale-x-[-1]" />
						<span class="text-xs">
							Logout
						</span>
					</button>
				</div>
			</div>
		</header>

		<!-- Main content -->
		<main class="max-w-2xl mx-auto mt-6 mb-6 space-y-6">
			<!-- Create Post -->
			<div class="bg-white rounded-xl border-1 border-gray-100 shadow-md p-5">
				<div class="flex items-center gap-2 mb-5">
					<span class="text-sm text-gray-800 font-bold">Profile</span>
				</div>
				<div class="flex gap-3">
					<div class="flex items-center gap-4">
						<div class="bg-gray-300 rounded-full p-4">
							<img :src="asset('images/icon/user.png')" alt="no-pf" class="w-15"/>
						</div>
						<div class="flex flex-col">
							<span class="text-lg text-gray-800 font-bold">
								alex_dev
							</span>
							<span class="text-sm mt-1 text-gray-500">
								alex@gmail.com
							</span>
							<div class="flex gap-4 mt-3">
								<div class="flex flex-col items-center">
									<span class="text-xs font-bold">1</span>
									<span class="text-xs text-gray-500">Posts</span>
								</div>
								<div class="flex flex-col items-center">
									<span class="text-xs font-bold">1</span>
									<span class="text-xs text-gray-500">Likes</span>
								</div>
								<div class="flex flex-col items-center">
									<span class="text-xs font-bold">1</span>
									<span class="text-xs text-gray-500">Comments</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="pl-2">
				<span class="text-sm font-bold text-gray-800">
					Your Posts
				</span>
			</div>

			<!-- Post Example -->
			<div class="bg-white rounded-xl border-1 border-gray-100 shadow-md p-5">
				<!-- Post header -->
				 <div class="flex items-center justify-between">
					<div class="flex items-center gap-3 mb-3">
						<div class="bg-gray-300 rounded-full p-2">
							<img :src="asset('images/icon/user.png')" alt="no-pf" class="w-5"/>
						</div>
						<div class="flex flex-col justify-between">
							<p class="text-sm font-medium">mike_digital</p>
							<span class="text-xs text-gray-500">1h ago</span>
						</div>
					</div>
					<button class="mb-2 text-red-500 cursor-pointer">
						<TrashIcon class="size-5" />
					</button>
				 </div>
				<!-- Post content -->
				<p class="text-gray-500 text-sm mb-3 tracking-wide leading-6">
					Just wrapped up a 6-month digital transformation project for a Fortune 500 company. 
					The journey from legacy systems to modern, user-centric design has been incredible. 
					Sometimes the biggest changes start with the smallest details.
				</p>
				<!-- <img src="https://images.unsplash.com/photo-1598300053380-29886a68259f?auto=format&fit=crop&w=800&q=80" class="rounded-lg" alt="office"> -->

				<!-- Post actions -->
				<div class="flex items-center gap-6 text-sm text-gray-600 mb-5">
					<button class="flex items-center gap-1 hover:text-red-500 cursor-pointer">
						<HeartIcon class="size-4" /> <span class="text-sm">2</span>
					</button>
					<button class="flex items-center gap-1 hover:text-blue-500 cursor-pointer">
						<ChatBubbleOvalLeftIcon class="size-4" /> <span class="text-sm">2</span>
					</button>
				</div>

				<!-- Comment input -->
				<div class="flex items-center gap-2">
					<div class="bg-gray-300 rounded-full p-2">
						<img :src="asset('images/icon/user.png')" alt="no-pf" class="w-5"/>
					</div>
					<input type="text" placeholder="Write a comment..." class="w-full border border-gray-200 placeholder:text-xs text-sm shadow rounded-lg px-3 py-2 focus:ring-1 focus:ring-indigo-200 outline-none"></input>
					<button class="bg-gray-500 px-2 py-2 rounded-md cursor-pointer hover:bg-gray-700">
						<PaperAirplaneIcon class="size-5 text-gray-50 -rotate-45 mb-1 ml-1" />
					</button>
				</div>

				<!-- Comment -->
				<div class="mt-5">
					<div class="flex items-start gap-2 mt-3">
						<div class="bg-gray-300 rounded-full p-2 mt-2 shadow">
							<img :src="asset('images/icon/user.png')" alt="no-pf" class="w-4"/>
						</div>
						<div class="w-full flex flex-col items-start gap-2 shadow border border-gray-200 rounded-lg px-3 py-3 text-sm">
							<div class="flex items-center gap-2">
								<a href="#" class="font-semibold">sarah_creative</a>
								<span class="text-xs text-gray-600">1h ago</span>
							</div>
							<div>
								<span class="text-sm text-gray-500">
									Congratulations! Digital transformation is never easy. What was the biggest changes?
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Post Example -->
		</main>
	</div>
</template>

<script setup>
	import { SparklesIcon} from '@heroicons/vue/24/solid';
	import { HomeIcon, UserIcon, ArrowLeftStartOnRectangleIcon, PhotoIcon, VideoCameraIcon, HeartIcon, ChatBubbleOvalLeftIcon, PaperAirplaneIcon, TrashIcon } from '@heroicons/vue/24/outline';

	const asset = (path) => `/${path}`
</script>