// dynamic import란?
// 조건부로 모듈을 불러오는 것

const a = true;
if(a) require('./func.js');
console.log('성공');

