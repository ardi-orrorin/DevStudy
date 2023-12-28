<template>
    <h1>About</h1>
    <p>{{ valueInput }}</p>
</template>

<script setup>
    import { inject } from 'vue'
    const valueInput = inject('valueInput');
</script>

<style lang="scss" scoped>

</style>