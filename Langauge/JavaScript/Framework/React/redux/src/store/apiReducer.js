import { handleActions, createActions } from "redux-actions";


export const CALL_API = 'api/CALL_API';
export const MODIFY = 'api/MODIFY';
export const INIT = 'api/INIT';

const initialState = [{
    'userId': 0,
    'id': 0,
    'title': '',
    'body': '',
    'index': 0,
}]

export const getApi = () => {
    return async (dispatch, getState) => {
        const url = 'https://jsonplaceholder.typicode.com/posts';
        const data = await fetch(url).then(res => res.json());

        dispatch({
            type: CALL_API,
            payload: data,
        })
    }
}

export const {api : {modify, init}} = createActions({
    [MODIFY]: ({index, key, value}) => ({[key]: value, index: index}),
    [INIT]: () => ({}),
});

const apiReducer =  handleActions({
    [INIT]: () => {
        return initialState;
    },
    [CALL_API]: (state, {payload}) =>  ({
        [CALL_API]: payload
    }),
    [MODIFY]: (state, {payload}) => {
        state[CALL_API][payload.index] = {...state[CALL_API][payload.index], ...payload}
        return {
            [CALL_API]: [...state[CALL_API]]
        }
},
}, initialState);


export default apiReducer;