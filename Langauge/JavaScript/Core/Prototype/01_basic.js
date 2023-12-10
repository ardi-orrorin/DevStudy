// 프로토타입 객체란?
// 객체지행 프로그래밍의 상속을 구현하기 위해 사용되는 객체이다.
// 모든 객체는 [[Prototype]]이라는 내부 슬롯을 가지며, 이 내부 슬롯의 값은 null 또는 객체이다.


// 생성자 함수
function Person(name) {
    this.name = name;
    this.getSayHi = function () {
        return `Hi! ${this.name}`;
    }
}

const me = new Person('Lee');
const you = new Person('Kim');

// getSayHi 메소드는 인스턴스마다 생성되므로 중복 소유한다.
// getSayHi 메소드는 하나만 생성하여 모든 인스턴스가 공유해서 사용하는 것이 메모리 사용 측면에서 효율적이다.
console.log(me.getSayHi == you.getSayHi); // false
console.log(me.getSayHi()); // Hi! Lee
console.log(you.getSayHi()); // Hi! Kim


function Person2(name) {
    this.name = name;
}

// 프로토타입 메소드 정의
// 프로토타입 메소드는 모든 인스턴스가 공유한다.
Person2.prototype.getSayHi = function () {
    return `Hi! ${this.name}`;
}

const me2 = new Person2('Lee');
const you2 = new Person2('Kim');

console.log(me2.getSayHi == you2.getSayHi); // true
console.log(me2.getSayHi()); // Hi! Lee
console.log(you2.getSayHi()); // Hi! Kim


// __proto__는 [[Prototype]] 내부 슬롯의 값인 프로토타입 객체에 접근하기 위해 사용하는 접근자 프로퍼티이다.
const person1 = { name: 'Lee' };
console.log(person1.__proto__); 

const obj = {};
const parent = { x: 1 }; 
console.log(obj.__proto__ ); // [Object: null prototype] {}
obj.__proto__ = parent; // obj 객체의 프로토타입을 parent 객체로 교체한다.
console.log(obj.__proto__); // { x: 1 }
console.log(obj); // {}
console.log(obj.x); // 1


// __proto__ 접근자 프로퍼티는 객체가 직접 소유하는 프로퍼티가 아니라 Object.prototype의 프로퍼티이다.
// 모든 객체는 상속을 통해 Object.prototype.__proto__ 접근 프로퍼티를 사용할 수 있다.

const obj2 = {name: 'lee'}

// obj2에 __proto__ 프로퍼티를 갖고 있지 않다.
console.log(obj2.hasOwnProperty('__proto__')); // false

// __proto__ 프로퍼티는 모든 객체의 프로토타입 객체인 Object.prototype의 접근자 프로퍼티이다.
console.log(Object.getOwnPropertyDescriptor(Object.prototype, '__proto__'));
console.log(Object.prototype.hasOwnProperty('__proto__')); // true

/* 
    - 모든 객체는 프로토타입의 계층 구조인 프로토타입 체인에 묶여 있다.
    - 객체의 프로퍼티에 접근하려고 할 때 객체에 프로퍼티가 없다면,
       __proto__ 접근자 프로퍼티가 기리키는 참조에 따라
       자신의 부모 역할을 하는 프로토타입의 프로퍼티를 순자척으로 검색한다.
*/


const parent2 = {};
const child = {};

child.__proto__ = parent2;
console.log(child.__proto__); // {}
// parent2.__proto__ = child; // TypeError: Cyclic __proto__ value  // __proto__ 프로퍼티에 자신을 가리키는 순환 참조를 할 수 없다.
// console.log(parent2.__proto__); // {}

// __proto__ 접근자 프로퍼티를 코드 내에서 직접 사용하는 것은 권장하지 않는다.
/*
    __proto__ 접근자 프로퍼티는 ES5까지 ECMAScript 사양에 포함되지 않은 비표준이다.
    하지만 일부 브라우저에서 __proto__ 지원하고 있었기 때문에 호환성을 고려해서 ES6에서 __proto__를 표준으로 채택하게 되었다.
    하지만 직접 상속을 통해 Obejct.protoype을 상속 받지 않는 객체를 생성할 수도 있기 때문에 __proto__를 사용하는 것은 권장하지 않는다.
*/


const obj3 = Object.create(null);

// obj는 Object.__proto__를 상속받을 수 없다.
console.log(obj3.__proto__); // undefined

// 따라서 __proto__보다 Object.getPrototypeOf, Object.setPrototypeOf 메소드를 사용하는 것이 좋다.
console.log(Object.getPrototypeOf(obj3)); // null

const obj4 = {};
const parent4 = { x: 1 };

Object.getPrototypeOf(obj4); 
console.log(obj4.__proto__); // {}
Object.setPrototypeOf(obj4, parent4);
console.log(obj4.__proto__); // { x: 1 }


