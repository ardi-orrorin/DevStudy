<template>
    <div>
        <h2>Module</h2>
        <div>
          {{ moduleA  }}
        </div>
    </div>  
</template>
<script>
export default {
    name: 'StateModule',
    components: {
    },
    computed: {
        moduleA() {
            return this.$store.a.count
        },
    },
}
</script>
<style scoped>
</style>