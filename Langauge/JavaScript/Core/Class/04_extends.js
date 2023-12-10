class Person {
    constructor(name) {
        this.name = name;
    }
    sayHi() {
        console.log(`Hi! ${this.name}`);
    }
}


class Me extends Person {
    constructor(name) {
        super(name);
    }
    sayHi() {
        super.sayHi();
        console.log('hello');
    }
}


const me = new Me('Lee');
console.log(me);

// 동적 상속

function Base1() { }
class Base2 { }

let condition = true;
class SubBase extends (condition ? Base1 : Base2) { }

const subClass = new SubBase();
console.log(subClass); // SubBase {}
console.log(subClass instanceof Base1); // true
console.log(subClass instanceof Base2); // false


// overriding

class BaseOver {
    constructor(name) {
        this.name = name;
    }
    sayHi() {
        return `Hi! ${this.name}`;
    }
}

class subBaseOver extends BaseOver {
    sayHi() {
        return `${super.sayHi()}. how are you doing?`;
    }
}

const subBaseOverInstance = new subBaseOver('Lee');
const baseOverInstance = new BaseOver('Lee');
console.log(baseOverInstance.sayHi()); // Hi! Lee
console.log(subBaseOverInstance.sayHi()); // Hi! Lee. how are you doing?
