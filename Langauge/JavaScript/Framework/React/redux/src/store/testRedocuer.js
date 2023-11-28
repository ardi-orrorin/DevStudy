import {createActions, handleActions} from 'redux-actions';

export const TEST_INPUT = 'test/INPUT';
export const TEST_POST = 'test/POST';

const initialState = {
    title: '',
    body: '',
};

export const {test : {input, post}} = createActions({
    [TEST_INPUT]: ({key, value}) => ({[key]: value}),
    [TEST_POST]: ({key, value}) => ({[key]: value}),
});


const testReducer = handleActions({
    [TEST_INPUT] : (state, {payload}) => ({
        ...state, [TEST_INPUT]: {...state[TEST_INPUT], ...payload },
    }),
    [TEST_POST] : (state, {payload}) => ({
        ...state, [TEST_POST]: {...state[TEST_POST], ...payload },
    }),  
}, initialState);


export default testReducer;