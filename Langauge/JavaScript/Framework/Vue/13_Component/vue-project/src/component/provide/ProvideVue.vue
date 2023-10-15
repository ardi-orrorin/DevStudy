<script setup>
import { inject } from 'vue';
import { injectionKey } from './keys';

    const count = inject('count')
    const count2 = inject(injectionKey)
</script>

<template>
    <button @click="count++">{{ count }}</button>
    <button @click="count2++">{{ count2 }}</button>
</template>

<style lang="scss" scoped>

</style>