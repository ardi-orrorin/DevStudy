// const {odd, even} = require('./CommonJs')  // 최상단, 최하단에 있을 필요가 없다.
const {odd, even} = require('./exports');
const check = require('./func');

console.log(odd);
console.log(even);
console.log(check(3));
console.log(check(2));

// console.log(require);
console.log(require.cache);
// console.log(require.main);