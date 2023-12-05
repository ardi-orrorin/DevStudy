<script setup>
import { computed } from 'vue';

    const props = defineProps(['modelValue'])
    const emit = defineEmits(['update:modelValue'])

    const value = computed({
        get() {
            return props.modelValue
        },
        set(value) {
            console.log(value);
            emit('update:modelValue', value)
        }
    })
</script>

<template>
    <input v-model="value">
</template>


<style lang="scss" scoped>

</style>