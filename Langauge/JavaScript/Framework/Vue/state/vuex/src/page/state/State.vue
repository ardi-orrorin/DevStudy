<template>
    <div>
        <nav>
            <router-link to="/state">/</router-link> |
            <router-link to="/state/basic">Basic</router-link> |
            <router-link to="/state/module">Module</router-link> |
        </nav>
        <div>
            <h1>State Page</h1>
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
export default {
  name: 'StateRoot',
  components: {
    
    },
}
</script>
<style>
</style>