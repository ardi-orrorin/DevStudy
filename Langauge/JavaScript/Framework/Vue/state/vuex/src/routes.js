import StateBasic from './page/state/StateBasic.vue';
import VueRouter from 'vue-router';
import State from './page/state/State.vue';
import StateModule from './page/state/StateModule.vue';
import Vue from 'vue';
Vue.use(VueRouter);

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/state',
            name: 'state',
            component: State,
            children: [
                {
                    path: 'basic',
                    name: 'StateBasic',
                    component: StateBasic
                },
                {
                    path: 'module',
                    name: 'StateModule',
                    component: StateModule
                }
            ]
        },
    ]
});

export default router;