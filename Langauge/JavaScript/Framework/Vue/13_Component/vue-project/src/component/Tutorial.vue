<script setup>
import { computed, ref } from 'vue';
const props = defineProps(['count'])
const emit = defineEmits(['count'])

</script>

<template>
    <button @click="(e)=> $emit('count', e)">{{ props.count }}</button>
</template>

<style scoped>

</style>