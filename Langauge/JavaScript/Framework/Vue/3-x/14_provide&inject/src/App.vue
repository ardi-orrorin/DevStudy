<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header>
    <RouterLink class="noneStyle" to="/about">About</RouterLink> |      
    <RouterLink class="noneStyle" to="/input">Input</RouterLink> |      
  </header>

  <RouterView />
</template>

<style lang="scss" scoped>
  header {
    text-align: center;
  }
  .noneStyle {
    text-decoration: none;
    color: red;
  }
</style>
s