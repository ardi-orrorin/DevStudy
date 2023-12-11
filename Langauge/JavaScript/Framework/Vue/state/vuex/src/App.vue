<template>
  <div id="app">
    <nav> 
      <router-link to="/">Home</router-link> |
      <router-link to="/state">State</router-link> |
    </nav>
    <router-view></router-view>
    
  </div>
</template>

<script>


export default {
  name: 'App',
  components: {
    
},
}

</script>

<style>

</style>
