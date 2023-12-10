// 타입호환
// 서로 다른 타입이 2개 있을 때 특정 타입이 다른 타입에 포함되는지를 의미

let a: string = 'abc';
let b: number = 10;

// b = a; // Error: Type 'string' is not assignable to type 'number'.

let c = 'hi'
let d = 10;

// d = c; // 자바스크립트에서는 타입 캐스팅으로 인해 오류가 발생하지 않음

let e: string = 'hi';
let f: 'hi' = 'hi'; // 문자열 리터럴 타입

e = f; // OK
console.log(e, f);

// 객체 타입 호환

type Persion = {
    name: string;
}

interface Developer {
    name: string;
    // skill: string;
}

let joo: Persion = {
    name: 'joo',
}

let jooDev: Developer = {
    name: 'Lee',
    // skill: 'TypeScript'
}

jooDev = joo; // OK
joo = jooDev; // Ok

type Person10 = {
    name: string;
}

interface Developer10 {
    name: string;
    skill: string;
}

let joo10: Person10 = {
    name: 'joo',
}

let jooDev10: Developer10 = {
    name: 'Lee',
    skill: 'TypeScript'
}

joo10 = jooDev10; // 에러 없음
/* 
    에러가 발생하지 않는 이유는 Developer10 타입이 name 속성을 갖고 있기 때문에
    Person10 입장에서는 필요한 name 속성이 존재하여 타입 호환이 된다고 판단하기 때문이다
*/

// jooDev10 = joo10; // 에러 발생


// Enum 타입 호환
// Enum 타입은 기본적으로 숫자 값을 갖는다.
enum Fruit { 
    Apple, // 0 
    Banana, // 1
}

let fruit: number = Fruit.Apple;
