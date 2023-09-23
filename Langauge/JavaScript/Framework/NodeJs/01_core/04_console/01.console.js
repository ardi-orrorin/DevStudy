const string = 'abc';
const number = 1;
const boolean = true;
const obj = {
    outside: {
        indise: {
            key: 'value'
        }
    }
}

console.time('전체 시간');
console.log('평범한 로그');
console.log(string, number, boolean);
console.error('에러 표시');
console.table([{name:'제로', birth: 1994},{name:'제로', birth: 1994}, ])
console.dir(obj, {colors: false, depth: 2})
console.dir(obj, {colors: true, depth: 1})
console.time('전체 시간');

for (let i = 0; i < 100000; i++){};
console.timeEnd('시간 측정');

const b = () => {
    console.trace('에러 위치 추적');
}

const a = () => {
    b();
}

a();

console.timeEnd('전체 시간');