// 타입 추론
// 타입스크립트가 코드를 해석하여 적절한 타입을 정해주는 것

// 변수
let a = 10; // a는 number 타입으로 추론
let b; // b는 any 타입으로 추론
let c = '문자'; // c는 string 타입으로 추론

// 함수
function sum(a: number, b: number): number {
    return a + b;
}
let res1 = sum(10, 20); // res1은 number 타입으로 추론

function sum2(a: number, b: number) {
    return a + b;
}
let res2 = sum2(10, 20); // res2는 number 타입으로 추론

// parameter
// 타입이 추론되지 않는 경우, any 타입으로 추론
// function getA(text) { // text는 any 타입으로 추론
//     console.log(text);
// }

function getB(text = 'abc') { // text?는 string 타입으로 추론, 옵셔널체이닝으로 추론
    console.log(text);
}

// interface
interface DropDown<T> {
    title: string;
    value: T;
}

let shoppingItem: DropDown<number> = {
    title: 'abc',
    value: 1000,
};
console.log(shoppingItem);

// generic
interface DetailDropdown<K> extends DropDown<K> {
    description: string;
    tag: string[];
}

let detailItem: DetailDropdown<number> = {
    title: 'abc',
    value: 1000,
    description: 'abc',
    tag: ['abc', 'def'],
};

console.log(detailItem);

function getDetail<T extends DetailDropdown<T>>(text: DetailDropdown<T>): T {
    return text.value;
}


