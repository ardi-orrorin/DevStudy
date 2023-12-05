<script setup>

import { computed, defineProps, ref } from 'vue';
// props는 vue에서는 기본적으로 하향식 방법을 택하고 있디.
// 부모 -> 자식 컴포넌트로 props을 전달 할 수 있지만, 자식 -> 부모로 props 전달은 불가능 하다.
const props = defineProps(['title'])

const initTitle = ref(props.title) // 초기값을 전달하는 목적으로 사용된다.
const dynamincTitle = computed(()=> props.title) // 전달 받은 props의 갑이 변경되거나 업데이트가 되면 재계산되어 업데이트 된다.


</script>

<template>
    <div>
        {{ props.title }}
    </div>
</template>

<style lang="scss" scoped>

</style>