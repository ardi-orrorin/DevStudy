<template>
    <div>
        <h1>{{ valueInput }}</h1>
        <input type="text" v-model="valueInput" />
        <About />
    </div>    
</template>

<script setup>
import { provide, ref } from 'vue'
import About from './About.vue'
const valueInput = ref('')
provide('valueInput', valueInput)


</script>