import _ from 'lodash'

const array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
const filterArr = _.filter(array, (item) => item % 2 === 0)
console.log(array);
console.log(filterArr);
console.log(_.debounce(() => console.log('debounce'), 1000)());

