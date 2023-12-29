const target = 'Is this all there is?';
const regExp = /is/;

console.log(regExp.test(target)); // true

// flags
// g: global 패턴이 일치하는 모든 문자열을 전역 검색한다.
// i: ignore case 대소문자 구분 없이 검색
// m: multiline  문자열 행이 바뀌더라도 패턴 검색을 계속한다.


console.log(target.match(/is/)); // 정확히 일치하는 is 먼저 찾은 값을 반환
// [ 'is', index: 5, input: 'Is this all there is?', groups: undefined ]
console.log(target.match(/is/i)); // 대소문자 구분없이 먼저 찾은 Is 값을 반환
// [ 'Is', index: 0, input: 'Is this all there is?', groups: undefined ]
console.log(target.match(/is/g)); // 일치하는 모든 is 값을 반환
// [ 'is', 'is' ]
console.log(target.match(/is/ig));  // 대소문자 구분없이 일치하는 모든 Is 값을 반환
// [ 'Is', 'is', 'is' ]

