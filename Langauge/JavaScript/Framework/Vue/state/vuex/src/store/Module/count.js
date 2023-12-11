const count = {
    // namespaced: true,
    state: { // 모듈 상태는 이미 중첩되어 있고, 네임스페이스 옵션의 영향을 받지 않음
        count: 12,
    },
    mutations: {
        increment(state, val) {
            state.count += val;
        }
    },
    getters: {
        getCount: state => {
            return state.count + 10;
        }
    },
    action: {
        incrementAction(context, method, val) {
            context.commit(method, val);
        }
    },
}

export default count;