const countPlugin = store => {
    // let prevState = cloneDeep(store.state);
    
    /* eslint-disable */
    store.subscribe((mutation, state) => {
        // console.log(mutation, state);
        // let nextState = cloneDeep(state);
        // console.log(prevState, nextState);
        // prevState = nextState;
    })
}

export default countPlugin;