// nullish coalescing, optional Chaining

// nullish coalescing
// nullish coalescing와 || 차이
// 1. || 는 falsy값 (0,'',false,NaN, null, undifined) 모두 false로 인식
// 2. ?? 는 (null, undefined) 만 false로 인식
const t = null ?? 2;
console.log(t); //