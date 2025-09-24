<template>
    <div>
        <Login v-if="tab === 'login'" />
        <Register v-else />
    </div>
</template>

<script setup>
    import AppLayout from '@/Layouts/AuthLayout.vue'
    import { Login } from '@/Pages/Login.vue'
    import { Register } from '@/Pages/Register.vue'

    defineOptions({ layout: AppLayout })

    const p = defineProps(withDefaults({
        tab: 'login'
    }, {
        tab: {
            required: false,
            type: String,
            default: 'login'
        }
    }))
</script>