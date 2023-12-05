<script>

</script>

<template>
    <header class="header">
        <slot name="header"></slot>
    </header>
    <main class="main">
        <slot name="main"></slot>
    </main>
    <footer class="footer">
        <slot></slot>
    </footer>

</template>

<style lang="scss" scoped>
    @mixin block {
        width: 98vw;
        height: 3vh;
    }
    
    
    .header {
        border: 1px solid red;
        @include block()
    }
    .main {
        border: 1px solid blue;
        @include block()
    }
    
    .footer {
        border: 1px solid green;
        @include block()
    }
</style>