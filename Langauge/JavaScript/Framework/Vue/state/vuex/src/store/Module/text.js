const text = {
    // namespaced: true,
    state: { // 모듈 상태는 이미 중첩되어 있고, 네임스페이스 옵션의 영향을 받지 않음
        text: 'Hello World!',
    },
    mutations: {
        input(state, val) {
            state.text = val;
        }
    },
    getters: {
        getText: state => {
            return state.text;
        }
    },
    action: {
        // inputAction(context, method, val) {
        //     context.commit(method, val);
        // }
    },
}

export default text;