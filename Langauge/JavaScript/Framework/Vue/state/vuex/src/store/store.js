import Vue from 'vue';
import Vuex from 'vuex';
import count from './Module/count';
import text from './Module/text';
import countPlugin from './Plugins/count';
import createLogger from 'vuex/dist/logger';

Vue.use(Vuex);

const store = new Vuex.Store({
    strict: true,
    modules: {
        count: count,
        text: text,
    },
    plugins: [countPlugin, createLogger()]
})

export default store;