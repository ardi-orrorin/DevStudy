<script setup>
    const props = defineProps(['pathMatch'])
    console.log(props.pathMatch.length);
</script>

<template>
    <h1>NotFound</h1>
    <h2>{{ props.pathMatch[props.pathMatch.length - 1] }} 페이지를 찾을 수 없습니다.</h2>
</template>

<style lang="scss" scoped>
    h1 {
        text-align: center;
    }

    h2 {
        text-align: center;
    }
</style>