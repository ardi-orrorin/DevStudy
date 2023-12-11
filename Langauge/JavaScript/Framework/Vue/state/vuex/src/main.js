import Vue from 'vue';
import App from './App.vue';
import router from './routes';
import store from './store/store';

Vue.config.productionTip = false
Vue.config.devtools = true;

/* eslint-disable no-new */
new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')




