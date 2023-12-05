
<script setup>
import LodingComponent from './LodingComponent.vue'
import ErrorComponent from './ErrorComponent.vue'
import { defineAsyncComponent } from 'vue';

    const AsyncCoomp = defineAsyncComponent({
        loader: () => import('../slot&outlet/LayoutSlot.vue'),
        loadingComponent: LodingComponent,
        delay: 5000,
        errorComponent: ErrorComponent,
        timeout: 5000,
    })
</script>

<template>
    <AsyncCoomp />
</template>

<style lang="scss" scoped>

</style>