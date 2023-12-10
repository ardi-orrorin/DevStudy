class Person {

    // 생성자
    constructor(name) {
        this.name = name;
        console.log(this); // Person { name: 'Lee' }
    }
}
const me = new Person('Lee');
console.log(me); // Person { name: 'Lee' }


class Person2 {
    intro = 'hello';


    constructor(name) {
        this.name = name;
        this.age = 10;
        this.contry = 'Korea';
    }


    // 프로토타입 메서드
    modifyIntro(intro) {
        this.intro = intro;
    }

    // 프로토타입 메서드
    sayHi() {
        console.log(this);
    }
};
const me2 = new Person2('Lee');

// 클래스가 생성한 인스턴스는 프로토타입 체인의 일원이 된다.
// me2 객체의 프로토타입은 Person2.prototype이다.
console.log(Object.getPrototypeOf(me2) === Person2.prototype); // true
console.log(me2 instanceof Person2); // true

// me2 객체의 contructor는 Person2 클래스이다.
console.log(me2.constructor === Person2); // true


me2.sayHi();  // Person2 { name: 'Lee', age: 10, contry: 'Korea', intro: 'hello' }
me2.modifyIntro('hi hello'); 
me2.sayHi(); // Person2 { name: 'Lee', age: 10, contry: 'Korea', intro: 'hi hello' }


// static 메서드 
// static 메서드는 인스턴스로 호출할 수 없다.
// static 메서드는 클래스로 호출한다.

// 생성자 함수
function Person3(name) {
    this.name = name;
}
Person3.sayHi = function () {
    console.log(`Hi!`);
}
Person3.sayHi(); // Hi!

// 클래스에서 정적 메소드 정의
class Person4 {
    constructor(name) {
        this.name = name;
    }

    // static 메서드
    static sayHi() {
        console.log(`Hi!`);
    }
}
Person4.sayHi(); // Hi!

// staic method vs prototype method
/* 
    1. 자신이 속해 있는 프로토타입 체인이 다르다.
    2. static 메서드는 클래스로 호출하고 prototype 메서드는 인스턴스로 호출한다.
    3. 정적 메소드는 인스턴스 프로퍼티를 참조할 수 없지만(this), 프로토타입 메소드는 인스턴스 프로퍼티를 참조할 수 있다.
*/

class Person5 {
    constructor(name) {
        this.name = name;
    }
    static sayHi(coment){
        return `${this.name}, Hi ${coment}`;
    }

    sayHi2(coment){
        return `${this.name}, Hi ${coment}`;
    }
}
console.log(Person5.sayHi('goodmorning')); // Hi Lee

const me5 = new Person5('Lee');
console.log(me5.sayHi2('goodmorning')); // Lee, Hi goodmorning


// private field
class Person6 {
    // private field
    #name = '';
    age = 0;

    constructor(name) {
        this.#name = name;
    }

    setName(name) {
        this.#name = name;
    }

    setAge(age) {
        this.age = age;
    }

    getName() {
        return this.#name;
    }

}



const me6 = new Person6('Lee');
console.log(me6.age); // 0
console.log(me6.name); // undefined
console.log(me6.getName()); // Lee

// static 필드 제안
class Person7 {
    static #name = 'Lee';
    static age = 10;

    constructor() {}

    static setName(name) {
        this.#name = name;
    }

    static getName() {
        return this.#name;
    }
}

console.log(Person7.age); // 10
console.log(Person7.name); // undefined

console.log(Person7.getName()); // Lee
Person7.setName('Kim');
console.log(Person7.getName()); // Kim

