import {odd, even} from './exports.mjs'

const check = num => {
    if(num % 2){
        return odd;
    }
    return even;
}

export default check;