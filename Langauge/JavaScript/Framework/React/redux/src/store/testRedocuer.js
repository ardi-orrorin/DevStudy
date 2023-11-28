import {createActions, handleActions} from 'redux-actions';

export const TEST_INPUT = 'test/INPUT';

const initialState = {
    title: 'df',
    body: '',
};

export const {test : {input, post}} = createActions({
    [TEST_INPUT]: ({key, value}) => ({[key]: value}),
});


const testReducer = handleActions({
    [TEST_INPUT] : (state, {payload}) => ({
        ...state, [TEST_INPUT]: {...state[TEST_INPUT], ...payload },
    }),
}, initialState);


export default testReducer;