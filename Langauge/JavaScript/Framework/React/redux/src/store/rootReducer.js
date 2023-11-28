import { combineReducers } from 'redux';
import testReducer from './testRedocuer';
import apiReducer from './apiReducer';

const rootReducer = combineReducers({
    testReducer,
    apiReducer,
});

export default rootReducer;