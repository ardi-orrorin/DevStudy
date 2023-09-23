const { odd, even} = require('./CommonJs');

const check = num => {
    if(num % 2){
        return odd;
    }
    return even;
}

module.exports = check;