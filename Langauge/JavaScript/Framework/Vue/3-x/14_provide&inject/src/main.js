import { createApp, ref } from 'vue'
import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(router)
// const valueInput = ref('');
// app.provide('valueInput', valueInput)
app.mount('#app')
